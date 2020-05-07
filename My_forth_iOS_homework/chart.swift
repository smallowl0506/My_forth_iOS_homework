//
//  chart.swift
//  My_forth_iOS_homework
//
//  Created by User16 on 2020/5/7.
//  Copyright © 2020 steven. All rights reserved.
//

import Foundation
import SwiftUI

struct PieChart: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) ->Path {
        Path { (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

struct Chart: View {
    @ObservedObject var sightData = SightData()
    var angles: [Angle]
    var scoreCount: [Double] = [0,0,0,0,0,0]
    init (sightData: SightData)
    {
        var sum: Double = 0
        var scorePercentages: [Double] = [0,0,0,0,0,0]
        var startDegree: Double = 0
        for sight in sightData.sights{
            scoreCount[sight.grade] += 1
            sum += 1
        }
        for i in 0..<6{
            scorePercentages[i] = scoreCount[i] / sum
        }
        angles = [Angle]()
        for scorePercentage in scorePercentages{
            angles.append(.degrees(startDegree))
            startDegree += 360 * scorePercentage
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                DrawPieChart(angles: angles).padding(.top,20)
            }.navigationBarTitle("各名勝景點評分分佈")
        }
        
    }
}

struct Chart_Previews: PreviewProvider {
    static var previews: some View {
        Chart(sightData: SightData())
    }
}

struct DrawPieChart: View {
    var angles: [Angle]
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Circle().fill(Color.yellow)
                    Text("5分")
                    Circle().fill(Color.red)
                    Text("４分")
                    Circle().fill(Color.blue)
                    Text("３分")
                }
                HStack{
                    Circle().fill(Color.purple)
                    Text("２分")
                    Circle().fill(Color.gray)
                    Text("１分")
                    Circle().fill(Color.black)
                    Text("０分")
                }
            }
            .padding(.top,50)
            .frame(width:350, height: 30)
            ZStack{
                PieChart(startAngle:self.angles[5], endAngle: .zero)
                    .fill(Color.yellow)
                PieChart(startAngle:self.angles[4], endAngle: self.angles[5])
                    .fill(Color.red)
                PieChart(startAngle:self.angles[3], endAngle: self.angles[4])
                    .fill(Color.blue)
                PieChart(startAngle:self.angles[2], endAngle: self.angles[3])
                    .fill(Color.purple)
                PieChart(startAngle:self.angles[1], endAngle: self.angles[2])
                    .fill(Color.gray)
                PieChart(startAngle:self.angles[0], endAngle: self.angles[1])
                    .fill(Color.black)
            }
        }
    }
}
