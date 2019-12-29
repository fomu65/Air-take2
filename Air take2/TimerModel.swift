//
//  TimerModel.swift
//  Air take2
//
//  Created by Ted Hardy on 12/26/19.
//  Copyright © 2019 High Gravity Consulting. All rights reserved.
//

import SwiftUI

class TimerModel: ObservableObject {
    @Published var timer:  Timer?
    @Published var duration = 10.0
    @Published var elapsedDuration: Double = 0.0
    @Published var startChime = false
    @Published var startChimeSound = ""
    @Published var endChime = false
    @Published var endChimeSound = ""
    @Published var reminder = false
    @Published var reminderInterval = 0.0
    @Published var isDisabled = false
    
    let durationMinValue = 0.0
    let durationMaxValue = 120.0
    let initialDuration = 600.0
    
    func startCountdown() {
        let runningDuration = duration
        
        if let _ = timer { return }
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {timer in
            if self.elapsedDuration >= runningDuration {
                timer.invalidate()
                self.isDisabled = false
            }
            else {
                self.elapsedDuration += 0.1
                print("\(self.elapsedDuration)")
            }
        }
        isDisabled = true
    }
    
    func resetCountdown() {
        timer?.invalidate()
        timer = nil
        elapsedDuration = 0.0
        isDisabled = false
    }
}
