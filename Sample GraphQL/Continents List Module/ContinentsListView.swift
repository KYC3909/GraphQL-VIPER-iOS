//
//  ContinentsListView.swift
//  Sample GraphQL
//
//  Created by Krunal on 23/3/2023.
//

import SwiftUI

struct ContinentsListView: View {
    @ObservedObject var presenter: ContinentsListPresenter
    
    init(presenter: ContinentsListPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        ZStack {
            if presenter.continents.count > 0 {
                List {
                    ForEach(presenter.continents, id: \.id)  { continent in
                        self.presenter.linkBuilder(for: continent) {
                            Text("\(continent.name): \(continent.code)")
                        }
                    }
                }
            }else {
                Text("Loading Continents... Please wait!")
            }
            
        }
        .navigationTitle("Continents")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            presenter.onAppearLoadContinents()
        }
    }
}

struct ContinentsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContinentsListView(presenter: ContinentsListPresenter(interactor: ContinentsListInteractor()))
    }
}
