//
//  SightRow.swift
//  My_forth_iOS_homework
//
//  Created by User21 on 2020/4/30.
//  Copyright © 2020 steven. All rights reserved.
//

import Foundation
import SwiftUI

struct SightRow: View {

 var sight: Sight
 var body: some View {
    HStack {
        Text(sight.name)
            Spacer()
        Text("\(sight.grade) 分")
        Image(systemName: sight.gone ? "star.fill" :
            "star")
     }

 }
}
