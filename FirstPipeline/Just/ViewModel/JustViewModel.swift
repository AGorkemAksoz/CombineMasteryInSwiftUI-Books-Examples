//
//  JustViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 8.08.2023.
//

import Combine
import Foundation

class JustViewModel: ObservableObject {
    @Published var data = ""
    @Published var dataToView = [String]()
    
    func fetch() {
        let dataIn = ["Julian", "Meredith", "Luan", "Daniel", "Marina"]
        
        _ = dataIn.publisher
            .sink(receiveValue: { [unowned self] item in
                self.dataToView.append(item)
            })
        
        if dataIn.count > 0 {
            Just(dataIn[3])
                .map { item in
                    item.uppercased()
                }
                .assign(to: &$data)
        }
    }
}
