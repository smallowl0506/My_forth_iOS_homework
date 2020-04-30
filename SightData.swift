//
//  SightData.swift
//  My_forth_iOS_homework
//
//  Created by User21 on 2020/4/30.
//  Copyright © 2020 steven. All rights reserved.
//

import Foundation

class SightData: ObservableObject {
 @Published var sights = [Sight]()
 var number = 0
}
