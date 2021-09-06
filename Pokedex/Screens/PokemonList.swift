//
//  PokemonList.swift
//  PokemonList
//
//  Created by Sam Starling on 06/09/2021.
//

import SwiftUI

struct PokemonList: View {
    @State var data: ListResponse<Pokemon>?

    let client = Client()

    private func loadData() async -> Void {
        do {
            data = try await client.pokemon()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        if let d = data {
            PokemonListInner(pokemon: d.results)
        } else {
            ProgressView().onAppear {
                Task.init { await loadData() }
            }
        }
    }
}

struct PokemonListInner: View {
    var pokemon: [Pokemon]
    
    var body: some View {
        List(pokemon) { p in
            NavigationLink(destination: PokemonDetail(id: p.numericalID())) {
                Text(p.name)
                Text(p.numericalID())
            }
            .navigationTitle("Pokemon")
        }
    }
}
