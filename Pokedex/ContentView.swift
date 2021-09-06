//
//  ContentView.swift
//  Pokedex
//
//  Created by Sam Starling on 06/09/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            PokemonList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
