//
//  File.swift
//  
//
//  Created by 한택환 on 2022/08/08.
//

import Foundation

extension Date {
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.locale = Locale(identifier: "ko")
        return dateFormatter.string(from: self).capitalized
    }
}
