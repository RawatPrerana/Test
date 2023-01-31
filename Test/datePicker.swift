//
//  datePicker.swift
//  Test
//
//  Created by Prerana on 08/01/23.
//

import SwiftUI

struct datePicker: View {
    @State var selectedDate = Date()
//        init() {
//            UIPickerView.appearance().bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 300))
//        }
    
    var body: some View {
        VStack{
//                Picker("", selection: $selectedDate){
//                    ForEach(0...10, id: \.self){
//                        Text("\($0)")
//                            .padding()
//                    }
//                }
//                .pickerStyle(.wheel)
//            Section{
            DatePicker(selection: $selectedDate, displayedComponents: .date) {}
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
//            }
//                                .background(
//                                backgroundView())
            
        }
    }
}

struct backgroundView: View{
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white)
                .frame(height: 100)
                VStack{
                    Spacer()
                    Divider()
                    Spacer()
                    Divider()
                    Spacer()
                }
        }
    }
}

struct datePicker_Previews: PreviewProvider {
    static var previews: some View {
        datePicker()
    }
}
//
//protocol PickerStyle {}
