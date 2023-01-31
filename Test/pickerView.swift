//
//  pickerView.swift
//  Test
//
//  Created by Prerana on 08/01/23.
//

import SwiftUI

struct pickerView: View {
    @State private var selectedDate = 0
    var date = Date()
    var body: some View {
        HStack{
                //                Picker(selection: $selectedDate, label: Text("Date")){
                //                    DatePicker(selection: $selectedDate, displayedComponents: .date){}
                //                    Text("0").tag(0)
                //                    Text("9").tag(1)
                //
                //                    Text("8").tag(2)
                
                ScrollView(showsIndicators: false){
                        ForEach(months, id: \.self){i in
                            GeometryReader{ geometry in
                                Text(i)
                                    .frame(
                                        width: geometry.frame(in: .global).width,
                                        height: geometry.frame(in: .global).height
                                            )
                            }
                            .padding()
                    }
                }
                ScrollView(showsIndicators: false){
                    ForEach(1...31, id: \.self){i in
                        GeometryReader{ geometry in
                            Text("\(i)")
                                .frame(
                                    width: geometry.frame(in: .global).width,
                                    height: geometry.frame(in: .global).height
                                        )
                        }
                            .padding()
                    }
                }
                ScrollView(showsIndicators: false){
                    ForEach(1900...2023, id: \.self){i in
                        GeometryReader{ geometry in
                            Text(String(i))
                                .frame(
                                    width: geometry.frame(in: .global).width,
                                    height: geometry.frame(in: .global).height
                                        )
                        }
                            .padding()
                    }
                }
            }
        .frame(height: 150)
            .overlay{
                HStack{
                    VStack{
                        Spacer()
                        Divider()
                        Spacer()
                        Divider()
                        Spacer()
                    }
                    VStack{
                        Spacer()
                        Divider()
                        Spacer()
                        Divider()
                        Spacer()
                    }
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
        var months: [String]{
            return [
                "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
            ]
        }
}

struct pickerView_Previews: PreviewProvider {
    static var previews: some View {
        pickerView()
    }
}
