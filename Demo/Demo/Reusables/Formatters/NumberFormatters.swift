//
//  NumberFormatters.swift
//  Demo
//
//  Created by CypherPoet on 3/15/20.
// ✌️
//

import Foundation


enum NumberFormatters {
    static let decimalDisplayFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        return formatter
    }()
}
