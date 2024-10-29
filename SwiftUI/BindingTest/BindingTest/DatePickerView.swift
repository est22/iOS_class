//
//  DatePickerView.swift
//  BindingTest
//
//  Created by Lia An on 10/29/24.
//

import SwiftUI

struct DatePickerView: View {
    @State var selectedDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return formatter
    }
    var body: some View {
        VStack{
            Text(selectedDate, formatter: dateFormatter)
                .font(.title).padding(.top, 15)
            DatePicker(selection: $selectedDate,label: {
                Text("일자를 선택하세요")
            }).padding()
            List {
                DatePicker("클릭", selection: $selectedDate, in: Date()...Date().addingTimeInterval(3600 * 24 * 7), displayedComponents: [.date])
            }
        }
    }
}

#Preview {
    DatePickerView()
}
