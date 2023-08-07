//
//  Future_ImmediateViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 7.08.2023.
//

import Combine
import Foundation

class Future_ImmediateViewModel: ObservableObject {
    @Published var data = ""
    
    func fetch() {
        _ = Future<String, Never> { [unowned self] promise in
            self.data = "Hello, my friend 👋🏻"
        }
    }
}
