//
//  viewTest.swift
//  Test
//
//  Created by Prerana on 11/01/23.
//

import SwiftUI

struct viewTest: View {
//    @State var click: Bool = false
//    var printDate = 1
//    var offset = 0
    
    var body: some View {
        VStack{
//            Text("\(printDate)")
//            ScrollView(showsIndicators: false){
//                ForEach(0..<10){ _ in
//                    Text("\(printDate)")
//                }
//            }
//            .frame(height: 60)
        }
    }
}

var navigationArray = [SoundPlayer(sound: 1007), collapsableList(), IntigrationBtn()] as [Any]

struct viewTest_Previews: PreviewProvider {
    static var previews: some View {
        viewTest()
    }
}
