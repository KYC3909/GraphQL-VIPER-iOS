//
//  CountriesListView.swift
//  Sample GraphQL
//
//  Created by Krunal on 27/3/2023.
//

import SwiftUI

struct CountriesListView: View {
    @ObservedObject var presenter: CountriesListPresenter
    
    init(presenter: CountriesListPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        ZStack {
            if presenter.countries.count > 0 {
                List {
                    ForEach(presenter.countries, id: \.id)  { country in
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text(country.emoji)
                                    .font(.largeTitle)
                                    .frame(width: 60, height: 60, alignment: .center)
                                Text("\(country.name): \(country.code)")
                                    .font(.title2)
                                    .frame(height: 60)
                            }
                            HStack {
                                Text("Capital:")
                                    .font(.title3)
                                Text(country.capital)
                            }
                            .padding(.leading, 60 + 8)
                            
                            HStack {
                                Text("AWS Region:")
                                    .font(.title3)
                                Text(country.awsRegion)
                            }
                            .padding(.leading, 60 + 8)
                            
                            Text("States:")
                                .font(.title3)
                                .padding(.leading, 60 + 8)
                            if country.states.count > 0 {
                                Text(country.states)
                                    .padding(.leading, 60 + 8)
                            }
                            else {
                                Text("No States available")
                                    .padding(.leading, 60 + 8)
                            }
                        }
                    }
                    
                }
            }else {
                Text("Loading Countries... Please wait!")
            }
            
        }
        .navigationTitle("Countries")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            presenter.onAppearLoadCountries()
        }
    }
}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView(presenter: CountriesListPresenter(interactor: CountriesListInteractor(continent: GQL_Continent.dummy())))
    }
}
