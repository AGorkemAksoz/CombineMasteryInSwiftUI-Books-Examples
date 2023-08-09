//
//  SequenceViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 9.08.2023.
//

import Combine
import Foundation


class SequenceViewModel: ObservableObject {
    @Published var dataToView: [String] = []
    var cancellables: Set<AnyCancellable> = []
    
    // Process values
    func fetch() {
        var dataIn = ["Paul", "Lem", "Scott", "Chirs", "Kaya", "Mark", "Adam", "Jared"]
        
        dataIn.publisher
            .sink { completion in
                print(completion)
            } receiveValue: { [unowned self] datum in
                self.dataToView.append(datum)
                print(datum)
            }
            .store(in: &cancellables)
        
        
        // These values will NOT go through the pipeline.
        // The pipeline finishes after publishing the initial set.
        dataIn.append(contentsOf: ["Rod", "Sean", "Karin"])

    }
}
