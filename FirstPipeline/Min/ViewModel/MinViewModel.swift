//
//  MinViewModel.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 13.08.2023.
//

import Foundation

class MinViewModel: ObservableObject {
    @Published var data: [String] = []
    @Published var minData = ""
    @Published var numbers: [Int] = []
    @Published var minNumber = 0
    
    func fetch() {
        let dataIn = ["Aarvdrak", "Zebra", "Elephant"]
        data = dataIn
        dataIn.publisher
            .min()
            .assign(to: &$minData)
        
        let dataInNumbers = [900, 245, 783]
        numbers = dataInNumbers
        dataInNumbers.publisher
            .min()
            .assign(to: &$minNumber)
    }
}
