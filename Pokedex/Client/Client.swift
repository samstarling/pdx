//
//  Client.swift
//  Client
//
//  Created by Sam Starling on 06/09/2021.
//

import SwiftUI

struct ClientError: Error {
    var message: String
}

struct Client {
    private var baseUrl = "https://pokeapi.co/api/v2/"
    private var urlSession = URLSession.shared
    
    func pokemon() async throws -> ListResponse<Pokemon> {
        return try await genericFetch("pokemon/")
    }
    
    func pokemonDetail(id: String) async throws -> FullPokemon {
        return try await genericFetch("pokemon/\(id)/")
    }
    
    private func genericFetch<T: Decodable>(_ path: String) async throws -> T {
        let request = try requestFor(path)
        let (data, _) = try await urlSession.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }

    private func requestFor(_ path: String) throws -> URLRequest {
        guard let url = URL(string: baseUrl + path) else {
            throw ClientError(message: "Failed URL")
        }

        return URLRequest(url: url)
    }
}
