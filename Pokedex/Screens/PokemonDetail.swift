//
//  PokemonDetail.swift
//  PokemonDetail
//
//  Created by Sam Starling on 06/09/2021.
//

import SwiftUI

struct PokemonDetail: View {
    var id: String
    @State var data: FullPokemon?

    let client = Client()

    private func loadData() async -> Void {
        do {
            data = try await client.pokemonDetail(id: id)
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        if let d = data {
            PokemonDetailInner(pokemon: d)
        } else {
            ProgressView().onAppear {
                Task.init { await loadData() }
            }
        }
    }
}

struct PokemonDetailInner: View {
    var pokemon: FullPokemon
    
    var body: some View {
        VStack {
            Text(String(pokemon.weight))
                .navigationTitle(pokemon.name)
        }
    }
}

