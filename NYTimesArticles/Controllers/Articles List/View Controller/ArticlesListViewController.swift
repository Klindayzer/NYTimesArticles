//
//  ArticlesListViewController.swift
//  NYTimesArticles
//
//  Created by Adham Alkhateeb on 10/2/19.
//  Copyright © 2019 Adham Alkhateeb. All rights reserved.
//

import UIKit

class ArticlesListViewController: BaseController {
    
    // MARK: - IBOutlet
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    
    // MARK: - Properties
    fileprivate var viewModel = ArticlesViewModel()
    fileprivate let articlesDetailsSegue = "showDetailsController"
    
    
    // MARK: - Overridden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchArticles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == articlesDetailsSegue,
            let controller = segue.destination as? ArticleDetailsViewController {
            
            controller.configure(with: viewModel.article(at: viewModel.selectedIndex))
        }
    }
    
    
    // MARK: - Protected Methods
    fileprivate func fetchArticles() {
        
        startLoading()
        viewModel.fetchArticles(page: .one) { [weak self] error in
            
            defer {
                self?.stopLoading()
            }
            
            self?.tableView.reloadData()
        }
    }
}


// MARK: - UITableViewDataSource
extension ArticlesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.name, for: indexPath) as? ArticleCell,
            let article = viewModel.article(at: indexPath.row) else {
                return ArticleCell()
        }
        cell.setupCell(with: article)
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ArticlesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectedIndex = indexPath.row
        performSegue(withIdentifier: articlesDetailsSegue, sender: nil)
    }
}
