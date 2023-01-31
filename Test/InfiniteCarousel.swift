//
//  InfiniteCarousel.swift
//  Test
//
//  Created by Prerana on 24/11/22.
//

import SwiftUI

struct InfiniteCarousel: View {
  var tabs: [Tab]
    @Binding var currentIndex: Int
    var click = true
    @State var index = 2
    var body: some View {
        VStack{
            TabView(selection: $currentIndex){
                
                ForEach(0..<4) { i in
                    VStack{
                        Text("\(tabs[i].title)")
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            HStack{
                ForEach(0..<4) { t in
                   
                    if (currentIndex == t){
                        Indicator()
                    }else{
                        Capsule()
                            .foregroundColor(.blue)
                            .opacity(0.3)
                            .frame(width: 20, height: 4)
                    }
                }
               
            }
            
        }
    }
}

struct Indicator: View{
    var body: some View{
        Capsule()
            .foregroundColor(.blue)
            .frame(width: 20, height: 4)
    }
}

struct Home_Previews1: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
