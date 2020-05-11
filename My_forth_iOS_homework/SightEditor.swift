//
//  SightEditor.swift
//  My_forth_iOS_homework
//
//  Created by User21 on 2020/4/30.
//  Copyright © 2020 steven. All rights reserved.
//

import Foundation
import SwiftUI

struct SightEditor: View {
 @Environment(\.presentationMode) var presentationMode
    var sightData: SightData
 @State private var name = ""
 @State private var grade = 1
 @State private var gone = true
    var editSight: Sight?
    
@State private var selectedName = "台北101"
var places = ["台北101", "倫敦眼", "雪梨歌劇院", "埃及金字塔","艾非爾鐵塔","美國大峽谷","大堡礁","尼加拉瓜瀑布","萬里長城","聖母峰","帆船酒店","東京鐵塔","雙子星大樓","凱旋門","羅馬競技場","比薩斜塔","自由女神像","大笨鐘","泰姬瑪哈陵","土耳其棉堡","聖彼得大教堂","米蘭大教堂","巴黎聖母院","雅典衛城","基督像","伏見稻荷大社"]

 var body: some View {
    Form {
        VStack {
            Image(selectedName)
            .resizable()
            .scaledToFit()
            .frame(width: 350, height: 250)
            Picker(selection: self.$selectedName, label: Text("我要的景點")) {
                ForEach(self.places, id: \.self) { (place) in
                    Text(place)
                }
            }
            .pickerStyle(WheelPickerStyle())
            Text("我選擇的景點是\(self.selectedName)")
        }
        Stepper("我給的評分是 \(grade)", value: $grade, in:
        0...5)
         Toggle("我去過", isOn: $gone)
    }
     .navigationBarTitle("增加新景點")
     .navigationBarItems(trailing: Button("儲存") {
        let sight = Sight(name: self.selectedName, grade: self.grade,gone: self.gone)
        
        if let editSight = self.editSight {
            let index = self.sightData.sights.firstIndex {
                $0.id == editSight.id
                }!
            self.sightData.sights[index] = sight
        } else {
            self.sightData.sights.insert(sight, at: 0)
        }
         
        
        self.presentationMode.wrappedValue.dismiss() 
     })
        .onAppear {
        
            if let editSight = self.editSight {
                self.name = editSight.name
                self.grade = editSight.grade
                self.gone = editSight.gone
            }
        }
    }
}


struct SightEditor_Previews: PreviewProvider {
    static var previews: some View {
        SightEditor(sightData: SightData())
    }
}


