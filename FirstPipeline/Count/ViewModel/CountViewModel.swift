//
//  CountViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 11.08.2023.
//

import Foundation

class CountViewModel: ObservableObject {
    @Published var title = ""
    @Published var data: [String] = []
    @Published var count = 0
    
    func fetch() {
        title = "Major Rivers"
        let dataIn = ["Mississippi", "Nile", "Yangtze", "Danube", "Ganges", "Amazon", "Volga", "Rhine"]
        
        data = dataIn
        
        dataIn.publisher
            .count()
            .assign(to: &$count)
    }
}
