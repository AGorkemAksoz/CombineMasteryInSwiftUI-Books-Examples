//
//  Published_IntroductionView.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 1.08.2023.
//

import SwiftUI

struct Published_IntroductionView: View {
    @StateObject private var vm = Published_IntroductionViewModel()
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Published",
                       subtitle: "Introduction",
                       desc: "The @Published property wrapper has a built-in that you can access with the dolar sign ($).")
            TextEditor(text: $vm.data)
                .border(Color.gray, width: 1)
                .frame(height: 200)
                .padding()
            
            Text("\(vm.characterCount)/\(vm.characterLimit)")
                .foregroundColor(vm.countColor)
        }
        .font(.title)
    }
}

struct Published_IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        Published_IntroductionView()
    }
}
