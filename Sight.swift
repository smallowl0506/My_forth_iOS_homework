//
//  Sight.swift
//  My_forth_iOS_homework
//
//  Created by User21 on 2020/4/30.
//  Copyright © 2020 steven. All rights reserved.
//

import Foundation

struct Sight : Identifiable,Codable {
 let id = UUID() 
 var name: String
 var grade: Int
 var gone: Bool
}
