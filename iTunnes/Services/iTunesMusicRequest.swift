//
//  iTunesRequest.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 19/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

class iTunesMusicRequest: APIRequest {
    var method = RequestType.GET
    var path = "search"
    var parameters = [String: String]()

    init(name: String) {
        parameters["name"] = name
    }
    
    init(term: String) {
        parameters["entity"] = "musicArtist"
        parameters["term"] = term
    }
}
