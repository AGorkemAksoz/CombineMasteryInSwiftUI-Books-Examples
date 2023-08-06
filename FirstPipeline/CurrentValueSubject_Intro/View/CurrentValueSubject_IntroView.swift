//
//  CurrentValueSubject_IntroView.swift
//  FirstPipeline
//
//  Created by Ali Görkem Aksöz on 2.08.2023.
//

import SwiftUI

struct CurrentValueSubject_IntroView: View {
    @StateObject private var vm = CurrentValueSubject_IntroViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("CurrentValueSubject",
                       subtitle: "Introduction",
                       desc: "The CurrentSubjectValue publisher will publish its existing value and also new values when it gets them.")
            
            Button("Select Lorenzo") {
                vm.selection.value = "Lorenzo"
            }
            
            Button("Select Ellen") {
                vm.selection.value = "Ellen"
            }
            
            Text(vm.selection.value)
                .foregroundColor(vm.selectionSame.value ? .red : .green)
        }
        .font(.title)
    }
}

struct CurrentValueSubject_IntroView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentValueSubject_IntroView()
    }
}
