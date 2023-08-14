//
//  MinByViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 14.08.2023.
//

import Foundation

class MinByViewModel: ObservableObject {
    @Published var profiles: [Profile] = []
    @Published var minValue = ""
    
    func fetch() {
        let dataIn = [
            Profile(name: "Igor", city: "Moscow"),
            Profile(name: "Rebecca", city: "Atlanta"),
            Profile(name: "Christina", city: "Stuttgart"),
            Profile(name: "Lorenzo", city: "Rome"),
            Profile(name: "Oliver", city: "London")
        ]
        
        profiles = dataIn
        
        _ = dataIn.publisher
            .min(by: { currentItem, nextItem -> Bool in
                return currentItem.city < nextItem.city
            })
            .sink(receiveValue: { [unowned self] profile in
                self.minValue = profile.city
            })
    }
    
}
