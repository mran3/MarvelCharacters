import Foundation

// MARK: - CharacterResponse
struct CharacterResponse: Codable {
    let code: Int?
    let data: CharacterData?
}

// MARK: CharacterResponse convenience initializers and mutators

extension CharacterResponse {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharacterResponse.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        code: Int?? = nil,
        data: CharacterData?? = nil
    ) -> CharacterResponse {
        return CharacterResponse(
            code: code ?? self.code,
            data: data ?? self.data
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CharacterData
struct CharacterData: Codable {
    let offset, limit, total, count: Int?
    let results: [CharacterResult]?
}

// MARK: CharacterData convenience initializers and mutators

extension CharacterData {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharacterData.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        offset: Int?? = nil,
        limit: Int?? = nil,
        total: Int?? = nil,
        count: Int?? = nil,
        results: [CharacterResult]?? = nil
    ) -> CharacterData {
        return CharacterData(
            offset: offset ?? self.offset,
            limit: limit ?? self.limit,
            total: total ?? self.total,
            count: count ?? self.count,
            results: results ?? self.results
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CharacterResult
struct CharacterResult: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: CharacterThumbnail?
    let resourceURI: String?
    let comics, series: CharacterComics?
    let stories: CharacterStories?
    let events: CharacterComics?
    let urls: [CharacterURL]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case description
        case thumbnail, resourceURI, comics, series, stories, events, urls
    }
}

// MARK: CharacterResult convenience initializers and mutators

extension CharacterResult {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharacterResult.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        name: String?? = nil,
        description: String?? = nil,
        thumbnail: CharacterThumbnail?? = nil,
        resourceURI: String?? = nil,
        comics: CharacterComics?? = nil,
        series: CharacterComics?? = nil,
        stories: CharacterStories?? = nil,
        events: CharacterComics?? = nil,
        urls: [CharacterURL]?? = nil
    ) -> CharacterResult {
        return CharacterResult(
            id: id ?? self.id,
            name: name ?? self.name,
            description: description ?? self.description,
            thumbnail: thumbnail ?? self.thumbnail,
            resourceURI: resourceURI ?? self.resourceURI,
            comics: comics ?? self.comics,
            series: series ?? self.series,
            stories: stories ?? self.stories,
            events: events ?? self.events,
            urls: urls ?? self.urls
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CharacterComics
struct CharacterComics: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [CharacterComicsItem]?
    let returned: Int?
}

// MARK: CharacterComics convenience initializers and mutators

extension CharacterComics {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharacterComics.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        available: Int?? = nil,
        collectionURI: String?? = nil,
        items: [CharacterComicsItem]?? = nil,
        returned: Int?? = nil
    ) -> CharacterComics {
        return CharacterComics(
            available: available ?? self.available,
            collectionURI: collectionURI ?? self.collectionURI,
            items: items ?? self.items,
            returned: returned ?? self.returned
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CharacterComicsItem
struct CharacterComicsItem: Codable {
    let resourceURI: String?
    let name: String?
}

// MARK: CharacterComicsItem convenience initializers and mutators

extension CharacterComicsItem {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharacterComicsItem.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        resourceURI: String?? = nil,
        name: String?? = nil
    ) -> CharacterComicsItem {
        return CharacterComicsItem(
            resourceURI: resourceURI ?? self.resourceURI,
            name: name ?? self.name
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CharacterStories
struct CharacterStories: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [CharacterStoriesItem]?
    let returned: Int?
}

// MARK: CharacterStories convenience initializers and mutators

extension CharacterStories {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharacterStories.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        available: Int?? = nil,
        collectionURI: String?? = nil,
        items: [CharacterStoriesItem]?? = nil,
        returned: Int?? = nil
    ) -> CharacterStories {
        return CharacterStories(
            available: available ?? self.available,
            collectionURI: collectionURI ?? self.collectionURI,
            items: items ?? self.items,
            returned: returned ?? self.returned
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CharacterStoriesItem
struct CharacterStoriesItem: Codable {
    let resourceURI: String?
    let name: String?
    let type: CharacterItemType?
}

// MARK: CharacterStoriesItem convenience initializers and mutators

extension CharacterStoriesItem {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharacterStoriesItem.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        resourceURI: String?? = nil,
        name: String?? = nil,
        type: CharacterItemType?? = nil
    ) -> CharacterStoriesItem {
        return CharacterStoriesItem(
            resourceURI: resourceURI ?? self.resourceURI,
            name: name ?? self.name,
            type: type ?? self.type
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum CharacterItemType: String, Codable {
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
}

// MARK: - CharacterThumbnail
struct CharacterThumbnail: Codable {
    let path: String?
    let thumbnailExtension: CharacterExtension?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: CharacterThumbnail convenience initializers and mutators

extension CharacterThumbnail {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharacterThumbnail.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        path: String?? = nil,
        thumbnailExtension: CharacterExtension?? = nil
    ) -> CharacterThumbnail {
        return CharacterThumbnail(
            path: path ?? self.path,
            thumbnailExtension: thumbnailExtension ?? self.thumbnailExtension
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum CharacterExtension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}

// MARK: - CharacterURL
struct CharacterURL: Codable {
    let type: CharacterURLType?
    let url: String?
}

// MARK: CharacterURL convenience initializers and mutators

extension CharacterURL {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharacterURL.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        type: CharacterURLType?? = nil,
        url: String?? = nil
    ) -> CharacterURL {
        return CharacterURL(
            type: type ?? self.type,
            url: url ?? self.url
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum CharacterURLType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

