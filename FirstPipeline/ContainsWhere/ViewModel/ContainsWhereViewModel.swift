//
//  ContainsWhereViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 11.08.2023.
//

import Foundation


class ContainsWhereViewModel: ObservableObject {
    @Published var fruitName = ""
    @Published var vitaminA = false
    @Published var vitaminB = false
    @Published var vitaminC = false
    
    func fetch() {
        let incomingData = [
            Fruit(name: "Apples", nutritionalInformation: "Vitamin A, Vitamin C")
        ]
        
        _ = incomingData.publisher
            .sink(receiveValue: { [unowned self] fruit in
                fruitName = fruit.name
            })
        
        incomingData.publisher
            .contains { fruit -> Bool in
                fruit.nutritionalInformation.contains("Vitamin A")
            }
            .assign(to: &$vitaminA)
        
        incomingData.publisher
            .contains { fruit -> Bool in
                fruit.nutritionalInformation.contains("Vitamin B")
            }
            .assign(to: &$vitaminB)
        
        incomingData.publisher
            .contains { fruit -> Bool in
                fruit.nutritionalInformation.contains("Vitamin C")
            }
            .assign(to: &$vitaminC)
    }
}
