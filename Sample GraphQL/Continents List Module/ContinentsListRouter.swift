//
//  ContinentsListRouter.swift
//  Sample GraphQL
//
//  Created by Krunal on 23/3/2023.
//

import SwiftUI

class ContinentsListRouter {
    func makeCountriesListView(for continent: GQL_Continent) -> some View {
        let presenter = CountriesListPresenter(interactor:
            CountriesListInteractor(
                continent: continent
            )
        )
      return CountriesListView(presenter: presenter)
    }
}
