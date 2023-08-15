//
//  AppendViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 15.08.2023.
//

import Combine
import Foundation

class AppendViewModel: ObservableObject {
    @Published var dataToView: [String] = []
    var cancellable: AnyCancellable?
    
    func fetch() {
        let dataIn = ["Amsterdam", "Oslo", "* Helsinki", "Prague", "Budapest"]
        
        cancellable = dataIn.publisher
            .append("* - May change")
            .sink(receiveValue: { [unowned self] datum in
                self.dataToView.append(datum)
            })
    }
}
