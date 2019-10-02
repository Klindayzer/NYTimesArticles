/*
 *	Observable.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/3/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */


class Observable<T> {
    
    // MARK: - Type
    typealias Listener = (T) -> Void
    
    
    // MARK: - Properties
    var listener: Listener?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    
    // MARK: - Constructors
    init(_ value: T) {
        self.value = value
    }
    
    
    // MARK: - Exposed Methods
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    func skipFirstAndBind(listener: Listener?) {
        self.listener = listener
    }
}
