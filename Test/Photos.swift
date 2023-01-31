//
//  Photos.swift
//  Test
//
//  Created by Prerana on 14/12/22.
//

import SwiftUI
import PhotosUI

struct Photos: View {
    @State var ispresented = false
    var body: some View {
        VStack{
            Image("")
            Button("Gallery", action: {
                ispresented.toggle()
            })
            .sheet(isPresented: $ispresented){
                photoPicker()
            }
        }
    }
}

struct photoPicker: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1
        
        let controller = PHPickerViewController(configuration: config)
        return controller
    }
   
}

struct Photos_Previews: PreviewProvider {
    static var previews: some View {
        Photos()
    }
}
