//
//  AppendPipelinesViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 15.08.2023.
//

import Combine
import Foundation

class AppendPipelinesViewModel: ObservableObject {
    @Published var dataToView: [String] = []
    
    var emails: AnyCancellable?
    
    func fetch() {
        let unread = ["New from Meng", "What Shai Mishali says about Combine"]
            .publisher
            .prepend("UNREAD")
        
        let read = ["Donny Wals Newsletter", "Dave Verwer Newsletter", "Paul Hudson Newsletter"]
            .publisher
            .prepend("READ")
        
        emails = unread
            .append(read)
            .sink(receiveValue: { [unowned self] datum in
                self.dataToView.append(datum)
            })
    }
}
