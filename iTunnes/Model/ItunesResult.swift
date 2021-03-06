//
//  ItunesResult.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 17/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - ITunnes
struct ITunnes<T: Codable>: Decodable {
    let resultCount: Int?
    let results: [ItunesResult]
}

// MARK: - Result
struct ItunesResult: Codable {
    let wrapperType: WrapperType?
    let artistType: ArtistType?
    let artistName: String?
    let artistLinkURL: String?
    let artistID: Int?
    let primaryGenreName: String?
    let primaryGenreID: Int?
    let amgArtistID: Int?

    
    let collectionName: String?
    let trackName: String?
    let collectionCensoredName: String?
    let trackCensoredName: String?
    let collectionArtistViewURL, collectionViewURL: String?
    let shortDescription: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, artistType, artistName
        case artistLinkURL = "artistLinkUrl"
        case artistID = "artistId"
        case primaryGenreName
        case primaryGenreID = "primaryGenreId"
        case amgArtistID = "amgArtistId"
       
        case collectionName, trackName, collectionCensoredName, trackCensoredName
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case  shortDescription
        
    }
}

enum ArtistType: String, Codable {
    case artist = "Artist"
    case author = "Author"
    case movieArtist = "Movie Artist"
}

enum WrapperType: String, Codable {
    case artist = "artist"
    case track = "track"
}

