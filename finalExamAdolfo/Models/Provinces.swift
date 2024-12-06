//
//  Provinces.swift
//  finalExamAdolfo
//
//  Created by David Romero on 2024-12-06.
//  Quick type resource --> https://app.quicktype.io/
//  #991555778

import Foundation

// MARK: - Provinces
struct Provinces: Codable {
    let country: String
    let provinces: [Province]
}

// MARK: - Province
struct Province: Codable {
    let name: String
    let capitalCity: CapitalCity
    let population: Int
    let description: String
}

// MARK: - CapitalCity
struct CapitalCity: Codable {
    let name: String
    let latitude, longitude: Double
}
