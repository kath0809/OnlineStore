//
//  Data+Prettyprint.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 25/09/2024.
//

import Foundation


extension Data {
    func prettyPrint() {
        
        let stringValue = String(data: self, encoding: .utf8)
        
        // Printer ut stringValue, hvis den blir nil -> feilmelding "No Data"
        print(stringValue ?? "No Data")
        
    }
}
