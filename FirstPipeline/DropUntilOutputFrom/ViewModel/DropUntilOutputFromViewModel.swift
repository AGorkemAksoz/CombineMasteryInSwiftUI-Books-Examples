//
//  DropUntilOutputFromViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 16.08.2023.
//

import Combine
import Foundation

class DropUntilOutputFromViewModel: ObservableObject {
    @Published var data: [String] = []
    var startPipeline = PassthroughSubject<Bool, Never>()
    
    var cancellables: [AnyCancellable] = []
    let timeFormatter = DateFormatter()
    
    init() {
        timeFormatter.timeStyle = .medium
        
        Timer.publish(every: 0.5, on: .main, in: .common)
            .autoconnect()
            .drop(untilOutputFrom: startPipeline)
            .map { [unowned self] datum in
                return self.timeFormatter.string(from: datum)
            }
            .sink { [unowned self] datum in
                self.data.append(datum)
            }
            .store(in: &cancellables)
    }
}
