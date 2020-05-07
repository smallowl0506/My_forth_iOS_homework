//
//  SightData.swift
//  My_forth_iOS_homework
//
//  Created by User21 on 2020/4/30.
//  Copyright © 2020 steven. All rights reserved.
//

import Foundation
import Combine

class SightData: ObservableObject {
    var cancellable: AnyCancellable?
    @Published var sights = [Sight]()
    var number = 0
    
    init(){
        
        if let data = UserDefaults.standard.data(forKey: "sights") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Sight].self, from: data) {
                sights = decodedData
            }
        }
        
        cancellable = $sights
            .sink { (value) in
                let encoder = JSONEncoder()
                do {
                    let data = try encoder.encode(value)
                    UserDefaults.standard.set(data, forKey: "sights")
                } catch {
                    
                }
        }
    }
}
