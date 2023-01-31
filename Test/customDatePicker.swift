//
//  customDatePicker.swift
//  Test
//
//  Created by Prerana on 12/01/23.
//

import SwiftUI

struct customDatePicker: View {
    @State var a = "Hello"
    var body: some View {
        CustomPicker(selected: $a)
    }
}

var data = ["23","24","25","26","27","28","29"]

struct CustomPicker: UIViewRepresentable {
    @Binding var selected: String
    func makeCoordinator() -> Coordinator {
        return CustomPicker.Coordinator(parent1: self)
    }
    
    
    func makeUIView(context: UIViewRepresentableContext<CustomPicker>) -> UIPickerView {
        let picker = UIPickerView()
        
        picker.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIView(_ uiView: UIPickerView, context: UIViewRepresentableContext<CustomPicker>) {
        
    }
    
    class Coordinator: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
        var parent: CustomPicker
        init(parent1: CustomPicker) {
            parent = parent1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return data.count
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        

        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 155, height: 77))
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
            
            label.text = data[row]
            label.textColor = UIColor(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 40, weight: .regular)
                       
            view.backgroundColor = .clear
            
            view.addSubview(label)
            
            view.clipsToBounds = true
            view.layer.cornerRadius = view.bounds.height / 2
            pickerView.subviews[1].alpha = 0
            //Border Color
//            view.layer.borderWidth = 2.5
//            view.layer.borderColor = UIColor.white.cgColor
            return view
        }
        
        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
           
            return 155
        }
        
        //Height of row
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 77
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.parent.selected = data[row]
        }
        
    }
}

struct customDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        customDatePicker()
    }
}
