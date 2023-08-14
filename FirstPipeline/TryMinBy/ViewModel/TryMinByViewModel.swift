//
//  TryMinByViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 14.08.2023.
//

import Foundation

class TryMinByViewModel: ObservableObject {
    @Published var profiles: [UserProfile] = []
    @Published var minValue = ""
    @Published var invalidCountryError: InvalidCountryError?
    
    func fetch() {
        let dataIn = [
            UserProfile(name: "Igor", city: "Moscow", country: "Russia"),
            UserProfile(name: "Rebecca", city: "Atlanta", country: "United States"),
            UserProfile(name: "Christina", city: "Stuttgart", country: "Germany"),
            UserProfile(name: "Lorenzo", city: "Rome", country: "Italy")
        ]
        
        profiles = dataIn
        
        _ = dataIn.publisher
            .tryMin { currentProfile, nextProfile in
                if currentProfile.country == "United States" {
                    throw InvalidCountryError(country: "United States")
                }
                return currentProfile.country < nextProfile.country
            }
            .sink { [unowned self] completion in
                if case .failure(let error) = completion {
                    self.invalidCountryError = error as? InvalidCountryError
                }
            } receiveValue: { [unowned self] userProfile in
                self.minValue = userProfile.country
            }

    }
}
