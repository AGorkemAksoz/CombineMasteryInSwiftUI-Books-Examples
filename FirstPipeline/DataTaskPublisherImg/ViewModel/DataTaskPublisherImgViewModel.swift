//
//  DataTaskPublisherImgViewModel.swift
//  FirstPipeline
//
//  Created by Gorkem on 9.08.2023.
//

import Combine
import SwiftUI

class DataTaskPublisherImgViewModel: ObservableObject {
    @Published var imageView: Image?
    @Published var errorForAlert: ErrorForAlert?
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetch() {
        let url = URL(string: "https://d31ezp3r8jwmks.cloudfront.net/C3JrpZx1ggNrDXVtxNNcTz3t")!
        let validURL = URL(string: "https://i.fanatik.com.tr/i/fanatik/75/700x0/649bd27980a032218c403eca")!
        
        URLSession.shared.dataTaskPublisher(for: validURL)
            .map { $0.data }
            .tryMap { data in
                guard let uiImage = UIImage(data: data) else {
                    throw ErrorForAlert(message: "Did not receive a valid image.")
                }
                return Image(uiImage: uiImage)
            }
//            .receive(on: RunLoop.main)
//            .sink { [unowned self] completion in
//                if case .failure(let error) = completion {
//                    if error is ErrorForAlert {
//                        errorForAlert = error as? ErrorForAlert
//                    } else {
//                        errorForAlert = ErrorForAlert(message: "Details \(error.localizedDescription)")
//                    }
//                }
//            } receiveValue: { [unowned self] image in
//                imageView = image
//            }
            .replaceError(with: Image("blank.image"))
            .receive(on: RunLoop.main)
            .sink(receiveValue: {  [unowned self] image in
                imageView = image
            })
            .store(in: &cancellables)

    }
}
