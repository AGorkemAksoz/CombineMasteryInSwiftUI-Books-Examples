//
//  DataTaskPublisherImgView.swift
//  FirstPipeline
//
//  Created by Gorkem on 9.08.2023.
//

import SwiftUI

struct DataTaskPublisherImgView: View {
    @StateObject private var vm = DataTaskPublisherImgViewModel()
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("DataTaskPublisher",
                       subtitle: "For Images",
                       desc: "You can use the dataTaskPublisher operator to download images with a URL.")
            
            vm.imageView?
                .resizable()
                .scaledToFit()
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
        .alert(item: $vm.errorForAlert) { errorForAlert in
            Alert(title: Text(errorForAlert.title),
                  message: Text(errorForAlert.message))
        }
    }
}

struct DataTaskPublisherImgView_Previews: PreviewProvider {
    static var previews: some View {
        DataTaskPublisherImgView()
    }
}
