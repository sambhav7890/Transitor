//
//  TransitorFadeInPresentation.swift
//  Created by Sambhav Shah on 14/12/2016
//

import Foundation

public struct TransitorFadeInPresentation: TransitorPresentation, AlignablePresentation {
    
    // Transitor Presentation Protocol conformance
    public private(set) var dismissCurve: TransitorConstants.TransitorCurve = .linear
    public private(set) var presentationCurve: TransitorConstants.TransitorCurve = .linear
    public private(set) var cornerRadius: Double = 0.0
    public private(set) var backgroundStyle: TransitorConstants.BackgroundStyle = .dimmed
    public private(set) var duration : TransitorConstants.Duration = .normal // Duration the ViewController needs to kick in
    public private(set) var widthForViewController: TransitorConstants.Size = .fullscreen
    public private(set) var heightForViewController: TransitorConstants.Size = .fullscreen
    public private(set) var marginGuards: UIEdgeInsets = .zero

    // Alginable
    public private(set) var horizontalAlignment: TransitorConstants.HorizontalAlignment = .center
    public private(set) var verticalAlignemt: TransitorConstants.VerticalAlignment = .center
    
    public init(dismissCurve: TransitorConstants.TransitorCurve = .linear,
                presentationCurve: TransitorConstants.TransitorCurve = .linear,
                cornerRadius: Double = 0.0,
                backgroundStyle: TransitorConstants.BackgroundStyle = .dimmed,
                duration: TransitorConstants.Duration = .normal,
                widthForViewController: TransitorConstants.Size = .fullscreen,
                heightForViewController: TransitorConstants.Size = .fullscreen,
                marginGuards: UIEdgeInsets = .zero) {
        
        self.dismissCurve = dismissCurve
        self.presentationCurve = presentationCurve
        self.cornerRadius = cornerRadius
        self.backgroundStyle = backgroundStyle
        self.duration = duration
        self.widthForViewController = widthForViewController
        self.heightForViewController = heightForViewController
        self.marginGuards = marginGuards
    }
    
}
