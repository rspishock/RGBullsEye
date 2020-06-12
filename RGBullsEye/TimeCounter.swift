//
//  TimeCounter.swift
//  RGBullsEye
//
//  Created by Ryan Spishock on 6/12/20.
//  Copyright © 2020 Ryan Spishock. All rights reserved.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    var timer: Timer?
    @Published var counter = 0
    
    @objc func updateCounter() {
        counter += 1
    }
    
    init() {
        timer = Timer.scheduledTimer(timeInterval:1, target: self, selector:#selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
