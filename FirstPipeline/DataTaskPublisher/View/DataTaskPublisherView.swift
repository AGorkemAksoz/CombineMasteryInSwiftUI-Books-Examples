//
//  DataTaskPublisherView.swift
//  FirstPipeline
//
//  Created by Gorkem on 9.08.2023.
//

import SwiftUI

struct DataTaskPublisherView: View {
    @StateObject private var vm = DataTaskPublisherViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("URLSession DataTaskPublisher",
                       subtitle: "Introduction",
                       desc: "URLSession has a dataTaskPublisher you can use to get data from a URL and run it through a pipeline.")
            
            List(vm.dataToView, id: \._id) { catFact in
                Text(catFact.text)
            }
            .font(.title3)
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

struct DataTaskPublisherView_Previews: PreviewProvider {
    static var previews: some View {
        DataTaskPublisherView()
    }
}
