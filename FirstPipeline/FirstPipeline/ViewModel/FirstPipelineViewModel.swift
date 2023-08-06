//
//  FirstPipelineViewModel.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 29.07.2023.
//

import Combine
import Foundation

class FirstPipelineViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var validation: String = ""
    var cancellable: AnyCancellable?
    
    init() {
        
        cancellable = $name
            .map {
                print("name property is now: \(self.name)")
                print("Value received is: \($0)")
                return $0.isEmpty ? "❌" : "✅"
            }
            .sink { [unowned self] value in
                self.validation = value
            }
    }
}
