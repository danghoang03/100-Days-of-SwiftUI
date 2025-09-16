//
//  ContentView.swift
//  Challenge1-Converter
//
//  Created by Hoàng Minh Hải Đăng on 16/09/25.
//

import SwiftUI

struct ContentView: View {
    let lengthUnit = ["m", "km", "ft", "yd", "mi"]
    @State private var inputValue: Double = 0
    @State private var inputUnit = "m"
    @State private var outputUnit = "m"
    @FocusState private var isFocused: Bool
    
    var convertedValue: Double {
        var input = Measurement(value: 0, unit: UnitLength.meters)
        var output = Measurement(value: 0, unit: UnitLength.meters)
    
        switch inputUnit {
        case "m":
            input = Measurement(value: inputValue, unit: .meters)
        case "km":
            input = Measurement(value: inputValue, unit: .kilometers)
        case "ft":
            input = Measurement(value: inputValue, unit: .feet)
        case "yd":
            input = Measurement(value: inputValue, unit: .yards)
        case "mi":
            input = Measurement(value: inputValue, unit: .miles)
        default:
            _ = 0
        }
        
        switch outputUnit {
        case "m":
            output = input.converted(to: .meters)
        case "km":
            output = input.converted(to: .kilometers)
        case "ft":
            output = input.converted(to: .feet)
        case "yd":
            output = input.converted(to: .yards)
        case "mi":
            output = input.converted(to: .miles)
        default:
            _ = 0
        }
        return output.value
    }
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Value") {
                    TextField("Type a number", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                }
                Section("Current Unit") {
                    Picker("Current Unit", selection: $inputUnit) {
                        ForEach(lengthUnit, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Target Unit") {
                    Picker("Target Unit", selection: $outputUnit) {
                        ForEach(lengthUnit, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Result") {
                    Text("\(convertedValue.formatted()) \(outputUnit)")
                }
            }
            .navigationTitle("Length Converter")
            .toolbar {
                if isFocused {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
