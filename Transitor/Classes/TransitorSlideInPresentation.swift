//
//  TransitorSlideInPresentation.swift
//  Created by Sambhav Shah on 14/12/2016
//

public struct TransitorSlideInPresentation: TransitorPresentation, AlignablePresentation {
    
    // TransitorPresentation Protocol conformance
    public private(set) var dismissCurve: TransitorConstants.TransitorCurve = .linear
    public private(set) var presentationCurve: TransitorConstants.TransitorCurve = .linear
    public private(set) var cornerRadius: Double = 0.0
    public private(set) var backgroundStyle: TransitorConstants.BackgroundStyle = .none
    public private(set) var wibbliness: TransitorConstants.Wibbliness
    public private(set) var duration : TransitorConstants.Duration = .normal // Duration the ViewController needs to kick in
    public private(set) var widthForViewController: TransitorConstants.Size = .fullscreen
    public private(set) var heightForViewController: TransitorConstants.Size = .fullscreen
    public private(set) var marginGuards: UIEdgeInsets = .zero
    
    // Unique
    public private(set) var directionShow: TransitorConstants.Direction = .left // Direction the ViewController slides in from
    public private(set) var directionDismiss: TransitorConstants.Direction = .left // Direction the ViewController slides out to
    
    // Alginable
    public private(set) var horizontalAlignment: TransitorConstants.HorizontalAlignment = .center
    public private(set) var verticalAlignemt: TransitorConstants.VerticalAlignment = .center
    
    public init(dismissCurve: TransitorConstants.TransitorCurve = .linear,
                presentationCurve: TransitorConstants.TransitorCurve = .linear,
                cornerRadius: Double = 0.0,
                backgroundStyle: TransitorConstants.BackgroundStyle = .dimmed,
                wibbliness: TransitorConstants.Wibbliness = .none,
                duration: TransitorConstants.Duration = .normal,
                directionShow: TransitorConstants.Direction = .top,
                directionDismiss: TransitorConstants.Direction = .top,
                widthForViewController: TransitorConstants.Size = .fullscreen,
                heightForViewController: TransitorConstants.Size = .fullscreen,
                horizontalAlignment: TransitorConstants.HorizontalAlignment = .center,
                verticalAlignment: TransitorConstants.VerticalAlignment = .center,
                marginGuards: UIEdgeInsets = .zero) {
        
        self.dismissCurve = dismissCurve
        self.presentationCurve = presentationCurve
        self.cornerRadius = cornerRadius
        self.backgroundStyle = backgroundStyle
        self.wibbliness = wibbliness
        self.duration = duration
        self.directionShow = directionShow
        self.directionDismiss = directionDismiss
        self.widthForViewController = widthForViewController
        self.heightForViewController = heightForViewController
        self.verticalAlignemt = verticalAlignment
        self.horizontalAlignment = horizontalAlignment
        self.marginGuards = marginGuards
    }
}
