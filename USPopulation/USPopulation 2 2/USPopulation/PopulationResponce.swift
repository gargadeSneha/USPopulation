//
//  File.swift
//  USPopulation
//
//  Created by TryCatch Classes on 22/11/22.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let data: [Datum]
   // let source: [Source]
}

// MARK: - Datum
struct Datum: Codable {
    let idNation, nation: String
    let idYear: Int
    let year: String
    let population: Int
    let slugNation: String

    enum CodingKeys: String, CodingKey {
        case idNation = "ID Nation"
        case nation = "Nation"
        case idYear = "ID Year"
        case year = "Year"
        case population = "Population"
        case slugNation = "Slug Nation"
    }
}

// MARK: - Source
