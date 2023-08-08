//
//  Future_OnlyRunsOnceView.swift
//  FirstPipeline
//
//  Created by Gorkem on 8.08.2023.
//

import SwiftUI

struct Future_OnlyRunsOnceView: View {
    @StateObject private var vm = Future_OnlyRunsOnceViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Future",
                       subtitle: "Only Runs Once",
                       desc: "Another thing that sets the Future publisher apart is that it only runs one time. It will store its value after being run and then never run again.")
            
            Text(vm.firstResult)
            
            Button("Run again") {
                vm.runAgain()
            }
            
            Text(vm.secondResult)
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

struct Future_OnlyRunsOnceView_Previews: PreviewProvider {
    static var previews: some View {
        Future_OnlyRunsOnceView()
    }
}
