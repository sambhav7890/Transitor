//
//  TransitorStyle.swift
//  Created by Sambhav Shah on 14/12/2016

import Foundation

/// Datamodel Types which will be used to create a TransitorPresentationObject
public struct TransitorConstants {

	public struct TransitionInteractive: OptionSet {
		public let rawValue: Int
		public init(rawValue: Int) { self.rawValue = rawValue }

		static let Presentation: TransitionInteractive = TransitionInteractive(rawValue: 1)
		static let Dismissal: TransitionInteractive = TransitionInteractive(rawValue: 2)
	}

    public enum HorizontalAlignment {
        case left
        case right
        case center
    }
    
    public enum VerticalAlignment {
        case top
        case bottom
        case center
    }
    
    public enum Size {
        case fullscreen
        case halfscreen
        case custom(value: CGFloat)
    }
    
    public enum BackgroundStyle {
        case dimmed
        case blur(effectStyle: UIBlurEffectStyle)
        case none
    }
    
    /// Will the ViewController be shown or dismissed?
    public enum PresentationType {
        case show
        case dismiss
    }
    
    /// Direction the Viewcontroller should fly out or come in from
    public enum Direction {
        case top
        case bottom
        case left
        case right
    }
    
    public enum Wibbliness {
        case none
        case wibbly
        case wibblier
        case wibbliest
        
        func convertWibbliness() -> Transitor {
            
            var damping = 1.0
            var velocity = 0
            
            switch self {
            case .none:
                ()
            case .wibbly:
                damping = 0.7
                velocity = 2
            case .wibblier:
                damping = 0.5
                velocity = 3
            case .wibbliest:
                damping = 0.2
                velocity = 4
            }
            
            return Transitor(damping:CGFloat(damping),velocity:CGFloat(velocity))
        }
    }
    
    public enum Duration : TimeInterval {
        case ultraSlow = 2.0
        case slow = 1.0
        case medium = 0.5
        case normal = 0.35
        case fast = 0.2
        case reallyFast = 0.1
    }
    
    public enum TransitorCurve {

        case easeInEaseOut
        case easeIn
        case easeOut
        case linear
        
        public func getAnimationOptionForTransitorCurve() -> UIViewAnimationOptions {
            switch self {
                case .easeInEaseOut:
                    return .curveEaseInOut
                case .easeIn:
                    return .curveEaseIn
                case .easeOut:
                    return .curveEaseOut
                case .linear:
                    return .curveLinear
            }
        }
    }

}
