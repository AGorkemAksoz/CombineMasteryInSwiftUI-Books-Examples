//
//  AppendView.swift
//  FirstPipeline
//
//  Created by Gorkem on 15.08.2023.
//

import SwiftUI

struct AppendView: View {
    @StateObject private var vm = AppendViewModel()
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Append",
                       subtitle: "Introduction",
                       desc: "The append operator will add data after the publisher sends out all of its data.")
            Text("Cities to tour")
            List(vm.dataToView, id: \.self) { datum in
                Text(datum)
            }
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

struct AppendView_Previews: PreviewProvider {
    static var previews: some View {
        AppendView()
    }
}
