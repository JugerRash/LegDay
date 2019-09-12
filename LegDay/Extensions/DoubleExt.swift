//
//  DoubleExt.swift
//  LegDay
//
//  Created by juger rash on 12.09.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import Foundation


extension Double {
    
    func convertToClockTime() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        
        return String(format: "%0d:%02d", minutes , seconds)
    }
    
}
