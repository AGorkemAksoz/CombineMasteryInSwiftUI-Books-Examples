//
//  CancellingMulitPipeViewModel.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 31.07.2023.
//

import Combine
import Foundation

class CancellingMulitPipeViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var firstNameValidation: String = ""
    @Published var lastName: String = ""
    @Published var lastNameValidation: String = ""
    
    private var validationCancellables: Set<AnyCancellable> = []
    
    init() {
        $firstName
            .map { $0.isEmpty ? "❌" : "✅"}
            .sink { [unowned self] value in
                self.firstNameValidation = value
            }
            .store(in: &validationCancellables)
        
        $lastName
            .map { $0.isEmpty ? "❌" : "✅"}
            .sink { [unowned self] value in
                self.lastNameValidation = value
            }
            .store(in: &validationCancellables)
    }
    
    func cancelAllValidations() {
        validationCancellables.removeAll()
    }
}
