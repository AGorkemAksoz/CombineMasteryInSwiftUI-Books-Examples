//
//  LongRunnningViewModel.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 31.07.2023.
//

import Combine
import Foundation

class LongRunningViewModel: ObservableObject {
    @Published var data = "Start Data"
    @Published var status = ""
    private var cancellablePipeline: AnyCancellable?
    
    init() {
        cancellablePipeline = $data
            .map({ [unowned self] value -> String in
                status = "Processing..."
                return value
            })
            .delay(for: 5, scheduler: RunLoop.main)
            .sink(receiveValue: { [unowned self] value in
                status = "Finished Status"
            })
    }
    
    func refreshData() {
        data = "Refreshed Data"
    }
    
    func cancel() {
        status = "Canceled"
        cancellablePipeline?.cancel()
    }
}
