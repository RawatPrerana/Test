//
//  ContentView.swift
//  Test
//
//  Created by Prerana on 22/11/22.
//

import SwiftUI

//struct ContentView: View {
//    let text: [CarousalView] = [CarousalView(title: "Beyond Relationship"),
//                                CarousalView(title: "Private Chat"),
//                                CarousalView(title: "Shared Space"),
//                                CarousalView(title: "Safe and secure")]
//    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
//   @State var currentIndex = 0
//
//    var body: some View {
//        VStack{
//            TabView(selection: $currentIndex){
//                ForEach(0..<text.count){i in
//                text[i]
//                }
//
//            } .tabViewStyle(.page(indexDisplayMode: .never))
//
//                 IndicatorView(currentIndex: $currentIndex)
//
//        }
//        .onReceive(timer, perform: {_ in
//            if currentIndex < text.count{
//                currentIndex += 1
//            }
//            if currentIndex == text.count{
//                currentIndex = 0
//            }
//    })
//
//    }
//}
//
//
//struct IndicatorView: View{
//    @Binding var currentIndex: Int
//    var position: Int{
//        -42+28*currentIndex
//    }
//    var body: some View{
//        ZStack{
//            HStack{
//
//                ForEach(0..<4){i in
//                    Indicator1()
//                        .opacity(0.3)
//                }
//            }
//            ForEach(0..<4){i in
//
//                Indicator1()
//                    .offset(x: CGFloat(position))
//            }
//        }
//    .animation(.default, value: position)
//
//    }
//}
//
//struct Indicator1: View {
//    var body: some View {
//       Capsule()
//            .foregroundColor(.blue)
//            .frame(width: 20, height: 4)
//
//
//
//        }
//   }



//struct CarousalView: View {
//   @State var title: String
//    var body: some View {
//
//        Text(title)
//
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
