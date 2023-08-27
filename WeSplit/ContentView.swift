//
//  ContentView.swift
//  WeSplit
//
//  Created by Julian Miño on 24/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    @State private var value = 0
    @State private var oldValue = 0
    
    @FocusState private var amountIsFocused

    private let tipPercentages: [Int] = [0, 10, 15, 20, 25]
    private let currencyCode = Locale.current.currency?.identifier ?? "USD"
    
    private var tipPerPerson: Double {
        let tipValue: Double = checkAmount * Double(tipPercentage) / 100
        return tipValue / Double(numberOfPeople)
    }
    
    private var totalPerPerson: Double {
        let tipValue: Double = checkAmount * Double(tipPercentage) / 100
        let checkTotal: Double = checkAmount + tipValue
        let totalPerPerson: Double = checkTotal / Double(numberOfPeople)
        return totalPerPerson
    }
        
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: currencyCode))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2...100, id: \.self) { number in
                            Text("\(number) people")
                        }
                    }.pickerStyle(.menu)
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) { percentage in
                            Text("\(percentage)% tip")
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: currencyCode))
                } header: {
                    Text("Total per person")
                }
                
                Section {
                    Text(tipPerPerson, format: .currency(code: currencyCode))
                } header: {
                    Text("Tip per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
