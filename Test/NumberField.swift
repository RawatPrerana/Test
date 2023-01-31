//
//  NumberField.swift
//  Test
//
//  Created by Prerana on 21/12/22.
//

import SwiftUI
import Combine

struct NumberField: View {
    @State private var numOfPeople = ""

       var body: some View {
           TextField("Total number of people", text: $numOfPeople)
               .keyboardType(.numberPad)
               .onReceive(Just(numOfPeople)) { newValue in
                   let filtered = newValue.filter { "0123456789".contains($0) }
                   if filtered != newValue {
                       self.numOfPeople = filtered
                   }
               }
       }
   }
            
struct NumberField_Previews: PreviewProvider {
    static var previews: some View {
        NumberField()
    }
}
