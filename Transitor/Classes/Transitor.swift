//
//  Transitor.swift
//  Created by Sambhav Shah on 14/12/2016


import Foundation

public struct Transitor {
    
    public var damping: CGFloat
    public var velocity: CGFloat
    
    init(damping: CGFloat = 1.0, velocity: CGFloat = 1.0) {
        self.damping = damping
        self.velocity = velocity
    }
}
