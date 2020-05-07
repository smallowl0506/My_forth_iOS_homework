//
//  ContentView.swift
//  My_forth_iOS_homework
//
//  Created by User21 on 2020/4/30.
//  Copyright © 2020 steven. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var sightData = SightData()
    var body: some View {
        VStack{
            TabView {
                SightList(sightData: self.sightData)
                    .tabItem {
                        Text("編輯名勝")
                        Image(systemName: "music.house.fill")
                }
                Chart(sightData: self.sightData)
                    .tabItem{
                    Image(systemName: "chart.pie.fill")
                    Text("評分圓餅圖")
                }
            }
            .accentColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
