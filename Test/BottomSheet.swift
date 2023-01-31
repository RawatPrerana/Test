//
//  BottomSheet.swift
//  Test
//
//  Created by Prerana on 14/12/22.
//

import SwiftUI

struct BottomSheet: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BottomSheet_Previews: PreviewProvider {
    struct preview:View{
        var body: some View{
            VStack{
                Spacer()
                VStack{
                    
                    Text("OK")
                }
                .frame(maxWidth: .infinity, minHeight: 16)
                }
            
                .background(Color.gray)
        }
    }
    static var previews: some View {
        preview()
    }
}
