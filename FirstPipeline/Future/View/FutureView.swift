//
//  FutureView.swift
//  FirstPipeline
//
//  Created by Gorkem on 7.08.2023.
//

import SwiftUI

struct FutureView: View {
    @StateObject private var vm = FutureViewModel()
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Future",
                       subtitle: "Introduction",
                       desc: "The future publisher will publish one value, either immediatley or at some future time, from the closure provided to you.")
            
            
            Button("Say Hello") {
                vm.sayHello()
            }
            
            Text(vm.hello)
                .padding(.bottom)
            
            Button("Say Goodbye") {
                vm.sayGoodbye()
            }
            
            Text(vm.goodbye)
            
            Spacer()
        }
        .font(.title)
    }
}

struct FutureView_Previews: PreviewProvider {
    static var previews: some View {
        FutureView()
    }
}
