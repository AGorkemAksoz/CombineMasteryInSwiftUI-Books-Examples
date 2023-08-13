//
//  TryMaxByViewModel.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 13.08.2023.
//

import Foundation


class TryMaxByViewModel: ObservableObject {
    @Published var profiles: [UserProfile] = []
    @Published var maxValue = ""
    @Published var invalidCounryError: InvalidCountryError?
    
    func fetch() {
        let dataIn = [
            UserProfile(name: "Igor", city: "Moscow", country: "Russia"),
            UserProfile(name: "Rebecca", city: "Atlanta", country: "United States"),
            UserProfile(name: "Christina", city: "Stuttgart", country: "Germany"),
            UserProfile(name: "Lorenzo", city: "Rome", country: "Italy")
        ]
        
        profiles = dataIn
        
        _ = dataIn.publisher
            .tryMax(by: { current, next -> Bool in
                if current.country == "United States" {
                    throw InvalidCountryError(country: "United States")
                }
                return current.country < next.country
            })
            .sink(receiveCompletion: { [unowned self] completion in
                if case .failure(let error) = completion {
                    self.invalidCounryError = error as? InvalidCountryError
                }
            }, receiveValue: { [unowned self] userProfile in
                self.maxValue = userProfile.country
            })
    }
}
