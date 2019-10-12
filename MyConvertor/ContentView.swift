//
//  ContentView.swift
//  Convert
//
//  Created by Ross on 10/12/19.
//  Copyright © 2019 Ross. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = ""
    @State private var inputUnit = 1
    @State private var outputUnit = 1
    
    let inputUnits = ["Seconds", "Minutes", "Hours", "Days"]
    let outputUnits = ["Seconds", "Minutes", "Hours", "Days"]
    
    var inValue: Double{
        let inpValue = Double(inputValue) ?? 0
        let result = inpValue * 60
        
        return result
    }
    
    var body: some View {
        NavigationView{
        Form{
            Section{
                TextField("Input value", text: $inputValue)
            }
            
            Section(header: Text("Initial Unit")){
                Picker("Initial unit", selection: $inputUnit){
                    ForEach(0 ..< inputUnits.count){
                        Text("\(self.inputUnits[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Output Unit")){
                Picker("Output unit", selection: $outputUnit){
                    ForEach(0 ..< outputUnits.count){
                        Text("\(self.outputUnits[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Converted value")){
                Text("\(inValue)")
            }
            }.navigationBarTitle("MyConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
