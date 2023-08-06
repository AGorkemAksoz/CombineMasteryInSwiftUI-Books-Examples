//
//  FirstPipelineView.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 30.07.2023.
//

import SwiftUI

struct FirstPipelineView: View {
    @StateObject private var vm = FirstPipelineViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("First Pipeline",
                       subtitle: "Introduciton",
                       desc: "This is a simple pipeline you can create in Combine to validate a text field")
            HStack {
                TextField("Text", text: $vm.name)
                    .autocorrectionDisabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text(vm.validation)
            }
            .padding()
            
            Button("Cancel Subscription") {
                vm.validation = ""
                vm.cancellable?.cancel()
            }
        }
        .font(.title)
    }

}

struct FirstPipelineView_Previews: PreviewProvider {
    static var previews: some View {
        FirstPipelineView()
    }
}
