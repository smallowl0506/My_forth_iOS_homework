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
 @State private var height = 30
 @State private var like = true
    var editSight: Sight?

 var body: some View {
    Form {
        TextField("名稱", text: $name)
        Stepper("高度 \(height)", value: $height, in:
        30...100)
         Toggle("我愛", isOn: $like)
    }
     .navigationBarTitle("增加新景點")
     .navigationBarItems(trailing: Button("儲存") {
        let sight = Sight(name: self.name, height: self.height,like: self.like)
        
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
                self.height = editSight.height
                self.like = editSight.like
            }
        }
    }
}


struct SightEditor_Previews: PreviewProvider {
    static var previews: some View {
        SightEditor(sightData: SightData())
    }
}


