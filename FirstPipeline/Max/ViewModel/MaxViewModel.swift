//
//  MaxViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 11.08.2023.
//

import Foundation

class MaxViewModel: ObservableObject {
    @Published var data: [String] = []
    @Published var maxValue = ""
    @Published var numbers: [Int] = []
    @Published var maxNumber = 0
    
    func fetch() {
        let dataIn = ["Aardvark", "Zebra", "Elephant"]
        data = dataIn
        dataIn.publisher
            .max()
            .assign(to: &$maxValue)
        
        let dataInNumbers = [900, 245, 783]
        numbers = dataInNumbers
        dataInNumbers.publisher
            .max()
            .assign(to: &$maxNumber)
    }
}
