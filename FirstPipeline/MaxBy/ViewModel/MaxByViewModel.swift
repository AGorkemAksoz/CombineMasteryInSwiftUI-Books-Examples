//
//  MaxByViewModel.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 13.08.2023.
//

import Foundation


class MaxByViewModel: ObservableObject {
    @Published var profiles: [Profile] = []
    @Published var maxValue = ""
    
    func fetch() {
        let dataIn = [
            Profile(name: "Igor", city: "Moscow"),
            Profile(name: "Rebecca", city: "Atlanta"),
            Profile(name: "Christina", city: "Stuttgart"),
            Profile(name: "Lorenzo", city: "Rome"),
            Profile(name: "Oliver", city: "Lonodon")
        ]
        
        profiles = dataIn
        
        _ = dataIn.publisher
            .max(by: { currentProfile, nextProfile -> Bool in
                currentProfile.city < nextProfile.city
            })
             .sink(receiveValue: { [unowned self] profile in
                maxValue = profile.city
            })
    }
}
