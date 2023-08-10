//
//  AllSatisfyView.swift
//  FirstPipeline
//
//  Created by Gorkem on 10.08.2023.
//

import SwiftUI

struct AllSatisfyView: View {
    @State private var number = ""
    @State private var resultVisible = false
    
    @StateObject private var vm = AllSatisfyViewModel()
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("AllSatisfy",
                       subtitle: "Introduction",
                       desc: "Use allSatisfy operator to test all items against a condition. If all items satisfy your criteria, a true is returned, else a false is returned.")
            .layoutPriority(1)
            
            HStack {
                TextField("add a number", text: $number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                Button {
                    vm.add(number: number)
                    number = ""
                } label: {
                    Image(systemName: "plus")
                }
            }
            .padding()
            
            List(vm.numbers, id: \.self) { number in
                Text("\(number)")
            }
            Spacer()
            Button("Fibonacci Numbers?") {
                vm.allFibonacciCheck()
                resultVisible = true
            }
            Text(vm.allFibonacciNumbers ? "Yes" : "No")
        }
        .padding(.bottom)
        .font(.title)
    }
}

struct AllSatisfyView_Previews: PreviewProvider {
    static var previews: some View {
        AllSatisfyView()
    }
}
