//
//  TimerConnectViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 9.08.2023.
//

import Combine
import Foundation


class TimerConnectViewModel: ObservableObject {
    @Published var data: [String] = []
    private var timerPublisher = Timer.publish(every: 0.2, on: .main, in: .common)
    private var timerCancellable: Cancellable?
    private var cancellables: Set<AnyCancellable> = []
    
    let timeFormatter = DateFormatter()
    
    init() {
        timeFormatter.dateFormat = "HH:mm:ss.SSS"
        timerPublisher
            .sink { [unowned self] datum in
                data.append(timeFormatter.string(from: datum))
            }
            .store(in: &cancellables)
    }
    
    func start() {
        timerCancellable = timerPublisher.connect()
    }
    
    func stop() {
        timerCancellable?.cancel()
        data.removeAll()
    }
}
