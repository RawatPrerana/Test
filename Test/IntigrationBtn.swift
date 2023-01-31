//
//  IntigrationBtn.swift
//  Test
//
//  Created by Prerana on 24/11/22.
//

import SwiftUI

struct IntigrationBtn: View {
    var body: some View {
        HStack{
            Slider()
            Slider()
            Slider()
            Slider()
        }.foregroundColor(.blue)
    }}


struct IntigrationBtn_Previews: PreviewProvider {
    static var previews: some View {
        IntigrationBtn()
    }
}


struct Slider: View {
    @State var click: Bool = false
   
    var body: some View {
       
        if click{
            Capsule()
                .frame(width: 20, height: 4)
                .onTapGesture {
                    click = !click
                }
        }else{
            Capsule()
                .stroke()
                .frame(width: 20, height: 4)
               
                .onTapGesture {
                    click = !click
                }
        }
       
    }
}
