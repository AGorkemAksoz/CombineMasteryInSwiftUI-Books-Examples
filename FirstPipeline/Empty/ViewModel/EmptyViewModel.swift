//
//  EmptyViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 7.08.2023.
//

import Combine
import Foundation

class EmptyViewModel: ObservableObject {
    @Published var dataToView: [String] = []
    
    func fetch() {
        let dataIn = ["Value 1", "Value 2", "Value 3", "🧨", "Value 5", "Value 6"]
        
        _ = dataIn.publisher
            .tryMap{ [unowned self] item in
                if item == "🧨" {
                    throw self.bombDetectedError()
                }
                return item
            }
            .catch{ error in
                Empty(completeImmediately: true)
            }
            .sink(receiveValue: { [unowned self] item in
                self.dataToView.append(item)
            })
            
    }
    
    func bombDetectedError() -> Error {
        return NSError()
    }
}
