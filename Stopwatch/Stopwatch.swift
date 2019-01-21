//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Diego Rodrigues de Oliveira on 1/14/19.
//  Copyright © 2019 Langara. All rights reserved.
//

import Foundation


class Stopwatch{
    
    private var startTime: Date?
    private var currentTime: Double = 0.0
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime{
            return currentTime + -startTime.timeIntervalSinceNow
        } else{
            return 0
        }
    }
    
    
    
    
    var isRunning: Bool {
        return startTime != nil
    }
    
    func start(){
        startTime = Date()
      
        
    }
    func stop(){
        
        currentTime = elapsedTime
        startTime = nil
    }
    func resume(){
        
        
         print(currentTime)
        startTime = Date()
        
    }
    func reset(){
        startTime = nil
        currentTime = 0
    }
    
}
