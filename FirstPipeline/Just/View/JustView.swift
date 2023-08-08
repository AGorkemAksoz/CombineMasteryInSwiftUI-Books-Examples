//
//  JustView.swift
//  FirstPipeline
//
//  Created by Gorkem on 8.08.2023.
//

import SwiftUI

struct JustView: View {
    @StateObject private var vm = JustViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Just",
                       subtitle: "Introduction",
                       desc: "The Just publisher can turn any object into a publisher if it doesn't already have one built-in. This means you can attach pipelines to any property or value")
            .layoutPriority(1)
            
            Text("This week's winner:")
            Text(vm.data)
                .bold()
            
            Form {
                Section(header: Text("Contest Participants").padding()) {
                    List(vm.dataToView, id: \.self) { item in
                        Text(item)
                    }
                }
            }
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

struct JustView_Previews: PreviewProvider {
    static var previews: some View {
        JustView()
    }
}
