//
//  urlTest.swift
//  Test
//
//  Created by Prerana on 20/12/22.
//

import SwiftUI
import MessageUI
import UIKit

struct urlTest: View {
    var body: some View{
        VStack{
            //            Link("OPEN", destination: URL(string: "https://mail.google.com/")!)
            //            Text("contact@duolop.com")
            //                 .onTapGesture {
            //                     if let url = URL(string: "https://mail.google.com/"), UIApplication.shared.canOpenURL(url){
            //                         UIApplication.shared.open(url)
            //                     }
            //                 }
            Button("open"){
                let email = "foo@bar.com"
                if let url = URL(string: "mailto:\(email)"){
                    UIApplication.shared.open(url)
                }
            }
        }
    }
}

struct urlTest_Previews: PreviewProvider {
    static var previews: some View {
        urlTest()
    }
}
