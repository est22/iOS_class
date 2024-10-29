//
//  GaugeView.swift
//  BindingTest
//
//  Created by Lia An on 10/29/24.
//

import SwiftUI

struct GaugeView: View {
    @State private var progress: Double = 0.0
    @State private var current: Double = 0.0
    var minValue: Double
    var maxValue: Double
    
    var body: some View {

        VStack{
            Gauge(value: progress, label: {
                Text("진행상황")
            }).padding()
            
            HStack{
                Button("+") {progress += 0.1}
                Button("-") {progress -= 0.1}
            }
            Gauge(value: current, in: minValue...maxValue) {
                Text("속도")
            } currentValueLabel: {
                Text("\(Int(current))")
            } minimumValueLabel: {
                Text("\(Int(minValue))")
            } maximumValueLabel: {
                Text("\(Int(maxValue))")
            }.padding()
            Button("증가") {
                current += 1
            }

        }
    }
}

#Preview {
    GaugeView(minValue: 0.0, maxValue: 10.0)
}
