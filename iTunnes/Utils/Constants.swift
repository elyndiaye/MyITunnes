//
//  Constants.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 17/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

enum ConverterConstants: String {
    case baseUrl = "https://itunes.apple.com/"
    case musicArtist = "musicArtist"
}

enum NetworkErrors: String, Error {
    case invalidUrl = "This URL is invalid request. Please email us."
    case unableToComplete = "Unable to completed your request. Please check your internet"
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "The data received from the server was invalid. Please try again"
}

enum RequestError: Error {
    case api(error: Error)
}
