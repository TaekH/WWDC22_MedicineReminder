//
//  SwiftUIView.swift
//  
//
//  Created by 한택환 on 2022/08/07.
//

import SwiftUI

final class MedicineInputStateHolder: ObservableObject {
    @Published var isSelectedDoseTime: Int = 0
    @Published var medicineType: String = ""
    @Published var numOfMedicine = ""
    @Published var date = Date()
}
