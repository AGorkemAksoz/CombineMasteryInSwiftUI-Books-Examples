//
//  DropUntilOutputFromView.swift
//  FirstPipeline
//
//  Created by Gorkem on 16.08.2023.
//

import SwiftUI

struct DropUntilOutputFromView: View {
    @StateObject private var vm = DropUntilOutputFromViewModel()
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("drop(untilOutputFrom: )",
                       subtitle: "Introduction",
                       desc: "This operator will prevent items from being published until it gets data from another publisher")
            
            Button("Open Pipeline") {
                vm.startPipeline.send(true)
            }
            
            List(vm.data, id: \.self) { datum in
                Text(datum)
            }
            
            Spacer()
            
            Button("Close Pipeline") {
                vm.cancellables.removeAll()
            }
        }
        .font(.title)
    }
}

struct DropUntilOutputFromView_Previews: PreviewProvider {
    static var previews: some View {
        DropUntilOutputFromView()
    }
}
