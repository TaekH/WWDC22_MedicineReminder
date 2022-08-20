//
//  MedicineIcon.swift
//  MedicineReminder
//
//  Created by Taekhwan Han on 2022/04/21.
//

import SwiftUI

struct MedicineIcon: View {
    
    @Binding var isTouch: Bool
    
    var body: some View {
        Button {
            isTouch.toggle()
        } label: {
            VStack(alignment: .center, spacing: .zero) {
            Image(isTouch ? "Medicine": "hadMedicine")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 400)
                if isTouch {
                    Text("If you took medicine,")
                        .foregroundColor(.black)
                        .font(.system(size: 60))
                    Text("TOUCH!")
                        .foregroundColor(.red)
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                }
                else {
                 Text("You've already taken meds!\n")
                        .foregroundColor(.black)
                        .font(.system(size: 60))
                }
            }
        }

    }
}

struct MedicineIcon_Previews: PreviewProvider {
    static var previews: some View {
        MedicineIcon(isTouch: .constant(false))
    }
}
