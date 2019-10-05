/*
 *	GlobalVariables.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/3/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

var isNetworkReachable = Observable(false)

var isDebug: Bool {
    #if targetEnvironment(simulator)
    return true
    #else
    return false
    #endif
}
