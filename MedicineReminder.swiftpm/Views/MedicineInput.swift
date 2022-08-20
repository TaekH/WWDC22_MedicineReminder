//
//  MedicineInput.swift
//  MedicineReminder
//
//  Created by 한택환 on 2022/04/21.
//

import SwiftUI

struct MedicineInput: View {
    @ObservedObject var medicineInputStates: MedicineInputStateHolder
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            HStack(alignment: .top) {
                Spacer()
                Text("Only doctors or guardians")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .padding(.trailing, 30)
            }
            Group {
            InputMedicineType(medicineInputStates: medicineInputStates)
            InputMedicineNum(medicineInputStates: medicineInputStates)
            InputAppointmentDate(medicineInputStates: medicineInputStates)
            SelectDoseTimeOption(medicineInputStates: medicineInputStates)
            }
            .padding(.bottom, 50)
            Spacer()
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Spacer()
                Text("Done")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .padding(15)
                    .background(.red)
                    .cornerRadius(30)
                Spacer()
            }
        }
    }
}

struct InputMedicineNum: View {
    @ObservedObject var medicineInputStates: MedicineInputStateHolder
    
    var body: some View {
        HStack() {
            Image(systemName: "pills.fill")
                .foregroundColor(.gray)
                .font(.system(size: 80))
            TextField("Numbers of Medicine", value: $medicineInputStates.numOfMedicine, formatter: NumberFormatter())
                .foregroundColor(.gray)
                .font(.system(size: 30))
        }
        
    }
}

struct InputMedicineType: View {
    @ObservedObject var medicineInputStates: MedicineInputStateHolder
    var body: some View {
        HStack() {
            Image(systemName: "pills.circle")
                .foregroundColor(.gray)
                .font(.system(size: 80))
            TextField("Medicine type : ", text: $medicineInputStates.medicineType)
                .font(.system(size: 30))
                .foregroundColor(.gray)
        }
    }
}

struct InputAppointmentDate: View {
    @ObservedObject var medicineInputStates: MedicineInputStateHolder
    var body: some View {
        HStack() {
            Image(systemName: "calendar")
                .foregroundColor(.gray)
                .font(.system(size: 80))
            VStack(alignment: .leading) {
                Text("Please enter a date")
                    .foregroundColor(.gray)
                    .font(.system(size: 30))
                DatePicker("Please enter a date", selection: $medicineInputStates.date, in: Date()...)
                    .labelsHidden()
            }
        }
    }
}

struct SelectDoseTimeOption: View {
    @ObservedObject var medicineInputStates: MedicineInputStateHolder
    let doseTimeOptions: [String] = ["one times", "two times", "three times"]
    
    var body: some View {
        HStack {
            Image(systemName: "clock.badge.checkmark")
                .foregroundColor(.gray)
                .font(.system(size: 80))
                .padding(.trailing, 20)
            VStack (alignment: .leading){
                Text("Dose time")
                    .foregroundColor(.gray)
                    .font(.system(size: 30))
                HStack {
                    ForEach(doseTimeOptions.indices, id:\.self) { index in
                        Button {
                            medicineInputStates.isSelectedDoseTime = index
                        } label: {
                            Text(doseTimeOptions[index])
                                .font(.system(size: 18))
                                .foregroundColor(medicineInputStates.isSelectedDoseTime == index ? .white : .gray)
                                .padding(.vertical, 9)
                                .padding(.horizontal, 10)
                                .background(RoundedRectangle(cornerRadius: 15).foregroundColor(medicineInputStates.isSelectedDoseTime == index ? .red : .white))
                                .overlay(RoundedRectangle(cornerRadius: 15)
                                    .stroke(medicineInputStates.isSelectedDoseTime == index ? .clear : .gray))
                        }
                    }
                }
            }
        }
    }
}

struct MedicineInput_Previews: PreviewProvider {
    static var previews: some View {
        MedicineInput(medicineInputStates: MedicineInputStateHolder())
    }
}
