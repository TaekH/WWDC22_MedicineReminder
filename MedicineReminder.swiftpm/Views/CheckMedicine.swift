//
//  CheckMedicine.swift
//  MedicineReminder
//
//

import SwiftUI

struct CheckMedicine: View {
    
    @State var isTouch: Bool = true
    @StateObject var medicineInputStates = MedicineInputStateHolder()
    
    let halfDay: Int = 43200
    var useTime: Int { Int(medicineInputStates.date.timeIntervalSince(Date())) }
    var currentDay = Int(Date().getDate())
    var appointmentDay = 1
    
    func appointmentDayColor() -> Color {
        switch Calendar.current.dateComponents([.day], from: Date(), to: medicineInputStates.date).day! {
        case 11...20:
            return Color.blue
        case 6...10:
            return Color.green
        case 0...5:
            return Color.red
        default:
            return Color.black
        }
    }
    
    var body: some View {
        
        
        NavigationView {
                VStack(alignment: .center, spacing: 0) {
                    Spacer()
                    HStack(spacing: 0) {
                    Text("Medical Appointment : D-")
                            .foregroundColor(.black)
                        .font(.system(size: 32))
                        Int(medicineInputStates.date.timeIntervalSince(Date())) <= halfDay ? Text("None").font(.system(size: 32)): Text("\(Calendar.current.dateComponents([.day], from: Date(), to: medicineInputStates.date).day!)")
                            .font(.system(size: 50))
                            .foregroundColor(appointmentDayColor())
                    }
                    Int(medicineInputStates.date.timeIntervalSince(Date())) <= halfDay ? Text("").font(.system(size: 32)): Text("Medical Appointment : \(medicineInputStates.date.getDate())")
                    MedicineIcon(isTouch: $isTouch)
                        .font(.system(size: 20))
                        .padding(.vertical)
                    Spacer()
                }
                .navigationBarItems(trailing: NavigationLink {
                    MedicineInput(medicineInputStates: medicineInputStates)
                } label: {
                    VStack(alignment: .center) {
                        Image(systemName: "stethoscope")
                            .foregroundColor(.gray)
                        Text("Medicine Input")
                            .foregroundColor(.black)
                    }
                })
        }
        .navigationViewStyle(.stack)
    }
    
    struct CheckMedicine_Previews: PreviewProvider {
        static var previews: some View {
            CheckMedicine()
        }
    }
}
