//
//  ContentView.swift
//  Sample GraphQL
//
//  Created by Krunal on 23/3/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ContinentsListView(presenter: ContinentsListPresenter(interactor: ContinentsListInteractor()))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
