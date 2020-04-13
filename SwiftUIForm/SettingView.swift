//
//  SettingView.swift
//  SwiftUIForm
//
//  Created by Chang Sophia on 4/11/20.
//  Copyright © 2020 Chang Sophia. All rights reserved.
//

import SwiftUI

struct SettingView: View {
      
        private var displayEngines = ["Alphabetical", "Show Favorite First", "Show Buy Already"]
       
        @State private var selectedEngines = 0
        @State private var showBuyAlready = true
        @State private var maxPriceLevel = 5 {
            didSet {
                if maxPriceLevel > 5 {
                    maxPriceLevel = 5
                }
                if maxPriceLevel < 1 {
                    maxPriceLevel = 1
                }
            }
        }
        
        var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("SORT PREFERENCE")) {
                        
                        Picker(selection: $selectedEngines, label:
                        Text("Display Choice")) {
                            
                            ForEach(0 ..< displayEngines.count, id:\.self) {
                                Text(self.displayEngines[$0])
                            }
                        }
                        
                    }
                    Section(header: Text("FILTER PREFERENCE")) {
                        
                        Toggle(isOn: $showBuyAlready) {
                             Text("Show Buy Already")
                        }
                        Stepper(onIncrement: {
                            self.maxPriceLevel += 1
                        }, onDecrement: {
                            self.maxPriceLevel -= 1
                        }) {
                            Text("Show\(String(repeating: "$", count: maxPriceLevel)) or below")
                        }
                    }
                }
            .navigationBarTitle("Setting")
            }
        }
    }


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
