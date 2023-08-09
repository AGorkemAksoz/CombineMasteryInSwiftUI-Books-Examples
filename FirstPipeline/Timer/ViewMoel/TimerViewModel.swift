//
//  TimerViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 9.08.2023.
//

import Combine
import Foundation


class TimerViewModel: ObservableObject {
    @Published var data: [String] = []
    @Published var interval: Double = 1
    
    private var timerCancellable: AnyCancellable?
    private var intervalCancellable: AnyCancellable?
    
    let timeFormatter = DateFormatter()
    
    init() {
        timeFormatter.dateFormat = "HH:mm:ss.SSS"
        
        intervalCancellable = $interval
            .dropFirst()
            .sink(receiveValue: { [unowned self] intervale in
                self.timerCancellable?.cancel()
                data.removeAll()
                start()
            })
    }
    
    func start() {
        timerCancellable = Timer
            .publish(every: interval, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { [unowned self] datum in
                data.append(timeFormatter.string(from: datum))
            })
    }
    
}
