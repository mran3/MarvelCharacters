// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - CharacterResponse
struct CharacterResponse: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: CharacterData?
}

// MARK: - CharacterData
struct CharacterData: Codable {
    let offset, limit, total, count: Int?
    let results: [CharacterResult]?
}

// MARK: - CharacterResult
struct CharacterResult: Codable {
    let id: Int?
    let name, description: String?
//    let modified: Date?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics: Comics?
}

// MARK: - Comics
struct Comics: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
    let returned: Int?
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI: String?
    let name: String?
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String?
    let thumbnailExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct URLElement {
    let type: URLType?
    let url: String?
}

enum URLType {
    case comiclink
    case detail
    case wiki
}

