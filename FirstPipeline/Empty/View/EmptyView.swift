//
//  EmptyView.swift
//  FirstPipeline
//
//  Created by Gorkem on 7.08.2023.
//

import SwiftUI

struct EmptyView: View {
    @StateObject private var vm = EmptyViewModel()
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Empty",
                       subtitle: "Introduction",
                       desc: "The Empty publisher will send nothing down the pipeline.")
            
            List(vm.dataToView, id: \.self) { item in
                Text(item)
            }
            
            DescView("The item after Value 3 caused an error. The empty publisher was then used and the pipeline finished immediately.")
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
