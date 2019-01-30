//
//  mathStuff.swift
//  sailPower
//
//  Created by Zachary Weiss on 12/20/18.
//  Copyright © 2018 WSE. All rights reserved.
//

import Foundation

class mathStuff{
    //Angle Major order
    let grid:[[Double]] = [
        [2.89,3.81,4.58,5.18,5.93,6.21,6.13],
        [3.41,4.43,5.25,5.84,6.55,6.88,6.89],
        [3.87,4.95,5.78,6.32,7.06,7.34,7.35],
        [5.09,6.22,7.04,7.51,7.92,8.06,8.08],
        [5.75,6.87,7.60,7.95,8.28,8.41,8.45],
        [6.09,7.24,7.86,8.22,8.55,8.70,8.76],
        [6.33,7.53,8.09,8.38,8.77,8.94,9.04],
        [6.50,7.63,8.20,8.58,8.95,9.17,9.34],
        [6.36,7.53,8.13,8.58,9.24,9.53,9.73],
        [5.87,7.08,7.81,8.28,9.02,9.68,10.10],
        [4.76,6.09,7.09,7.76,8.60,9.29,9.96],
        [4.38,5.71,6.73,7.53,8.45,9.14,9.81],
        [3.79,4.99,6.09,6.99,8.13,8.85,9.50],
        [3.21,4.27,5.31,6.22,7.65,8.47,9.12],
        [2.98,3.98,4.97,5.89,7.36,8.26,8.92]
    ]
    
    let speeds:[Double] = [6,8,10,12,16,20,24]
    let angels:[Double] = [33,36,39,50,60,70,80,90,105,120,135,140,150,165,180]
    
    private func getPercent(value:Double, index:Int, array:[Double]) -> Double{
        return  (value - array[index]) / (array[index + 1] - array[index])
    }
    
    private func getLowIndex(value:Double, array:[Double]) -> Int{
        var newVal:Double = value
        
        if (value ==  array[array.count - 1]){
            newVal -= 1
        }
        
        for index in 0 ..< array.count - 1 {
            if (newVal >= array[index] && newVal < array[index + 1]){
                return index
            }
        }
        return -1
    }
    
    func calcMaxSpeed (currSpeed:Double, currAngle:Double) -> Double{
        let speedIndexLow = getLowIndex(value: currSpeed, array: speeds)
        let angleIndexLow = getLowIndex(value: currAngle, array: angels)
        
        let lowLow = grid[angleIndexLow][speedIndexLow]
        let lowHigh = grid[angleIndexLow][speedIndexLow + 1]
        let highLow = grid[angleIndexLow + 1][speedIndexLow]
        let highHigh = grid[angleIndexLow + 1][speedIndexLow + 1]
        
        
        let speedPercent = getPercent(value: currSpeed, index: speedIndexLow, array: speeds)
        let anglePercent = getPercent(value: currAngle, index: angleIndexLow, array: angels)
        
        
        let angleLowAverage = lowLow * (1 - speedPercent) + lowHigh * speedPercent
        let angleHighAverage = highLow * (1 - speedPercent) + highHigh * speedPercent
        
        
        return angleLowAverage * (1 - anglePercent) + angleHighAverage * anglePercent
    }
    
    
}
