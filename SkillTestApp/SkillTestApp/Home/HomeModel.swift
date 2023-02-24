//
//  HomeModel.swift
//  SkillTestApp
//
//  Created by David Penagos on 22/02/23.
//

import Foundation

struct AllCharactersModel : Codable {
    let info : Info?
    let results : [Results]?

    enum CodingKeys: String, CodingKey {
        case info = "info"
        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        info = try values.decodeIfPresent(Info.self, forKey: .info)
        results = try values.decodeIfPresent([Results].self, forKey: .results)
    }
}

struct Info : Codable {
    let count : Int?
    let pages : Int?
    let next : String?
    let prev : String?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case pages = "pages"
        case next = "next"
        case prev = "prev"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        pages = try values.decodeIfPresent(Int.self, forKey: .pages)
        next = try values.decodeIfPresent(String.self, forKey: .next)
        prev = try values.decodeIfPresent(String.self, forKey: .prev)
    }
}

struct Results : Codable, Identifiable {
    let id : Int?
    let name : String?
    let status : String?
    let species : String?
    let type : String?
    let gender : String?
    let origin : Origin?
    let location : Location?
    let image : String?
    let episode : [String]?
    let url : String?
    let created : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case status = "status"
        case species = "species"
        case type = "type"
        case gender = "gender"
        case origin = "origin"
        case location = "location"
        case image = "image"
        case episode = "episode"
        case url = "url"
        case created = "created"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        species = try values.decodeIfPresent(String.self, forKey: .species)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        origin = try values.decodeIfPresent(Origin.self, forKey: .origin)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        episode = try values.decodeIfPresent([String].self, forKey: .episode)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        created = try values.decodeIfPresent(String.self, forKey: .created)
    }
}

struct Location : Codable {
    let name : String?
    let url : String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
}

struct Origin : Codable {
    let name : String?
    let url : String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
}
