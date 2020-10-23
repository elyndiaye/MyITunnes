//
//  iTunesMovieRequest.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 22/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

class iTunesMovieRequest: APIRequest {
    var method = RequestType.GET
    var path = "search"
    var parameters = [String: String]()

    init(name: String) {
        parameters["name"] = name
    }
    
    init(term: String) {
        parameters["entity"] = "movie"
        parameters["term"] = term
    }
}
