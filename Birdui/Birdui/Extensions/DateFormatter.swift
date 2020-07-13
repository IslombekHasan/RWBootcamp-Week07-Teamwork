//
//  DateFormatter.swift
//  Birdui
//
//  Created by Islombek Hasanov on 7/12/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import Foundation

extension Date {
    func formattedString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM, HH:mm"
        return dateFormatter.string(from: self)
    }
}
