//
//  ContentView.swift
//  Air take2
//
//  Created by Ted Hardy on 12/26/19.
//  Copyright © 2019 High Gravity Consulting. All rights reserved.
//

import SwiftUI

struct ScrollView: View {
//    @ObservedObject var viewModel: TimerModel = TimerModel()
    
/*    func timeString(time: Double) -> String {
        let hour = Double(time) / 3600
        let minute = Double((time.truncatingRemainder(dividingBy: 3600)) / 60)
        let second = Double((time.truncatingRemainder(dividingBy: 60)))
        return String(format: "%02ih %02im %02is", hour, minute, second)
    } */
    
/*    func timeString(time: Double) -> String {
        String(format: "%.1f", time)
    } */
    @State private var temporaryTimer: Double = 0
    @State private var startChime = false
    @State private var startChimeSelected = 0
    @State private var endChime = false
    @State private var endChimeSelected = 0
    @State private var reminderChime = false
    @State private var reminderChimeSelected = 0
    
    let reminderIntervals = [0, 1, 3, 5, 7, 10]
    let chimeList = ["Gong", "Bell", "Chime", "Ring"]
    
    var timerMinValue = 5.0
    var timerMaxValue = 120.0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Meditation Length")) {
                    VStack {
                        HStack {
                        Text("\(Int(timerMinValue))")
                        Slider(value: $temporaryTimer, in: timerMinValue...timerMaxValue, step: 0.1)
                            .frame(height: 20, alignment: .center)
                        Text("\(Int(timerMaxValue))")
                        }
                        Text("\(Int(temporaryTimer))")
                    }
                }
                Section(header: Text("Reminders")) {
                    VStack {
                        Toggle(isOn: $startChime) {
                        Text("Use starting chime?")
                        }
                        if startChime {
                            Picker("Start Chime Tone:", selection: $startChimeSelected) {
                                ForEach(0..<chimeList.count) {
                                    Text(self.chimeList[$0])
                                    //.tag[index]
                                }
                            }
                        }
                    }
                    VStack {
                            Toggle(isOn: $endChime) {
                                Text("Use ending chime?")
                            }
                            if endChime {
                                Picker("End Chime Tone:", selection: $endChimeSelected) {
                                    ForEach(0..<chimeList.count) {
                                        Text(self.chimeList[$0])
                                        //.tag[index]
                                    }
                                }
                            }
                        }
                    VStack {
                            Toggle(isOn: $reminderChime) {
                                Text("Use reminder chime?")
                            }
                            if reminderChime {
                                Picker("Reminder Chime Tone:", selection: $reminderChimeSelected) {
                                    ForEach(0..<chimeList.count) {
                                        Text(self.chimeList[$0])
                                        //.tag[index]
                                    }
                            }
                        }
                    }
                }
                Section {
                    VStack {
                        Text("Start Meditation placeholder for button")
                    }
                }.navigationBarTitle("Air - Meditation Timer")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView()
    }
}

/*        VStack(alignment: .center) {
            VStack {
                Section {
                Text("Air - Meditation Timer")
                    .font(.title)
                Spacer()
                HStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.blue)
                            .cornerRadius(20)
                            .shadow(radius: 8)
                        
                        Text(self.timeString(time: viewModel.elapsedDuration))
                            .italic()
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }
                .frame(width: UIScreen.main.bounds.width/1.5, height: 100)
                }
                Section {
                Spacer()
                
                Button(action: {
                    self.viewModel.startCountdown()
                        }) {
                            if viewModel.isDisabled {
                                Text("Start Meditation")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .frame(width: 300)
                                    .padding()
                                .background(Color.yellow.opacity(0.2))
                                    .cornerRadius(150)
                                    .shadow(radius: 2)
                            } else {
                                Text("Start Meditation")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .frame(width: 300)
                                    .padding()
                                    .background(Color.yellow)
                                    .cornerRadius(150)
                                    .shadow(radius: 2)
                                }
                        }
//                        .disabled(viewModel.isDisabled)
                        .padding(.bottom, 20)
                
                Button(action: {
                    self.viewModel.resetCountdown()
                }) {
                    if viewModel.isDisabled {
                        Text("Reset")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 300)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(150)
                            .shadow(radius: 2)
                    } else {
                        Text("Reset")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 300)
                            .padding()
                            .background(Color.yellow.opacity(0.2))
                            .cornerRadius(150)
                            .shadow(radius: 2)
                    }
                }
                Spacer()
                }
                Section {
                    HStack {
                        Text("Some junk here")
                        Slider(value: viewModel.$duration, in: viewModel.durationMinValue...viewModel.durationMaxValue)
                    }
                }
            }
        } */
/* Section {
    VStack(alignment: .center) {
        Text("Air - Meditation Timer")
        Spacer()
        HStack {
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .cornerRadius(20)
                    .shadow(radius: 8)
                    .zIndex(0)
                    .frame(width: 200, height: 100, alignment: .center)
                Text("HH : mm : ss")
                    .zIndex(1)
            }
        }
        Spacer()
        /*Button() {
            Text("Start Meditation")
        } */
        Spacer()
        /*Button() {
         Text("Reset"
         }*/
        Spacer()
    }
}*/
