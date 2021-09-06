//
//  Types.swift
//  Types
//
//  Created by Sam Starling on 06/09/2021.
//

import SwiftUI

protocol BaseType: Identifiable, Codable {
    var id: UUID { get }
}

struct ListResponse<T: Codable>: Codable {
    var count: Int
    var next: String
    var results: [T]
}

struct Pokemon: BaseType {
    var id = UUID()
    var url: String
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case url, name
    }
    
    func numericalID() -> String {
        return String(url.split(separator: "/").last!)
    }
}

struct FullPokemon: BaseType {
    var id = UUID()
    var name: String
    var weight: Int
    
    private enum CodingKeys: String, CodingKey {
        case name, weight
    }
}
