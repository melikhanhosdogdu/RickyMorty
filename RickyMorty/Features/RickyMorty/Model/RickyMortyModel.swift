//
//  RickyMortyModel.swift
//  RickyMorty
//
//  Created by Melikhan Hosdogdu on 6.10.2021.
//

import Foundation
// MARK: - RickyMortyModel
// MARK: - RickyMortyModel
struct RickyMortyModel: Codable {
    let info: Info?
    let results: [Result]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next: String?

}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let name, status, species, type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}


