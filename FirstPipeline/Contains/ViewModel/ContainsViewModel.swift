//
//  ContainsViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 11.08.2023.
//

import Combine
import Foundation


class ContainsViewModel: ObservableObject {
    @Published var description = ""
    @Published var airConditioning = false
    @Published var heating = false
    @Published var basement = false
    
    private var cancllables: [AnyCancellable] = []
    
    func fetch() {
        let incomingData = ["3 Bedrooms", "2 Bathrooms", "Air Conditioning", "Basement"]
        
        incomingData.publisher
            .prefix(2)
            .sink { [unowned self] item in
                description += item + "\n"
            }
            .store(in: &cancllables)
        
        incomingData.publisher
            .contains("Air Conditioning")
            .assign(to: &$airConditioning)
        
        incomingData.publisher
            .contains("Heating")
            .assign(to: &$heating)
        
        incomingData.publisher
            .contains("Basement")
            .assign(to: &$basement)
    }
}
