//
//  SightList.swift
//  My_forth_iOS_homework
//
//  Created by User21 on 2020/4/30.
//  Copyright © 2020 steven. All rights reserved.
//

import Foundation
import SwiftUI

struct SightList: View {
 @ObservedObject var sightData = SightData()
 @State private var showEditSight = false
 var body: some View {
 NavigationView {
    List {
        ForEach(sightData.sights) { (sight) in
            NavigationLink(destination: SightEditor(sightData:
                self.sightData,editSight: sight)) {
             SightRow(sight: sight)
             }
            
        }
        .onDelete { (indexSet) in
        self.sightData.sights.remove(atOffsets: indexSet)
        }
    }
    .navigationBarTitle("世界景觀")
    .navigationBarItems(leading: EditButton(),trailing: Button(action: {
        self.showEditSight = true
    }, label: {
    Image(systemName: "plus.circle.fill")
    }))
    .sheet(isPresented: $showEditSight) {
        NavigationView {
         SightEditor(sightData: self.sightData)
        }
       
    }
    }
 }

}

struct SightList_Previews: PreviewProvider {
    static var previews: some View {
        SightList()
    }
}

