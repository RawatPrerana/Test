//
//  TabPickerView.swift
//  Test
//
//  Created by Prerana on 10/01/23.
//

import SwiftUI

struct TabPickerView: View {
   @State var index = 0
    @State var firstIndex = -1
    @State var secondIndex = +1
    var body: some View {
        HStack{
            VStack{
                TabView(selection: $index){
                    ForEach(0..<5, id: \.self){i in
                        Text(String(i))
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                    TabView(selection: $index){
                        ForEach(0..<5, id: \.self){i in
                            Text(String(i))
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                
            }
        }
    }
}

struct TabPickerView_Previews: PreviewProvider {
    static var previews: some View {
        TabPickerView()
    }
}
