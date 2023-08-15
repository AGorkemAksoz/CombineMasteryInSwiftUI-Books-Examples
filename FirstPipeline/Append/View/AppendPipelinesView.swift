//
//  AppendPipelinesView.swift
//  FirstPipeline
//
//  Created by Gorkem on 15.08.2023.
//

import SwiftUI

struct AppendPipelinesView: View {
    @StateObject private var vm = AppendPipelinesViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Append",
                       subtitle: "Pipelines",
                       desc: "Not only can you append values, you can also append whole pipelines so you get the values from another pipeline added to the end of the first pipeline.")
            
            List(vm.dataToView, id: \.self) { datum in
                Text(datum)
                    .fontWeight(datum.contains("READ") ? .bold : .regular)
            }
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

struct AppendPipelinesView_Previews: PreviewProvider {
    static var previews: some View {
        AppendPipelinesView()
    }
}
