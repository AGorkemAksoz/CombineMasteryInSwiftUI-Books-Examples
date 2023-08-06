//
//  CurrentValueSubject_IntroViewModel.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 1.08.2023.
//

import Combine
import Foundation

class CurrentValueSubject_IntroViewModel: ObservableObject {
    @Published var selection = "No Name Selected"
//    var selection = CurrentValueSubject<String, Never>("No Name Selected")
    var selectionSame = CurrentValueSubject<Bool, Never>(false)
    var cancellables = [AnyCancellable]()
    
    init() {
        $selection
            .map { [unowned self] newValue -> Bool in
                if newValue == selection{
                    return true
                } else {
                    return false
                }
            }
            .sink { [unowned self] value in
                selectionSame.value = value
                objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}
