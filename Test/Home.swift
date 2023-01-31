//
//  Home.swift
//  Test
//
//  Created by Prerana on 24/11/22.
//

import SwiftUI

struct Home: View {
  
        @State var tabs: [Tab] = [
            Tab(title: "Beyond Relationship"),
            Tab(title: "Private Chat"),
            Tab(title: "Shared Space"),
            Tab(title: "Safe and Secure")
        ]
        
        @State var currentIndex: Int = 0
    var body: some View{
            VStack{
                InfiniteCarousel(tabs: tabs, currentIndex: $currentIndex)
                Text("\(currentIndex)")
               
            }
        }
    }


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct View1: View {
    var body: some View{
        Image("Vector")
    }
}

struct View2: View {
    var body: some View{
        Text("View2")
    }
}
