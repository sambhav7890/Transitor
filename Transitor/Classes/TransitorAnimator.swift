//  TransitorAnimator.swift
//  Created by Sambhav Shah on 14/12/2016

import UIKit

/// # TransitorAnimator
/// A TransitorAnimator is an UIViewControllerTransitionsDelegate with some extra candy.
/// Basically the TransitorAnimator is the main class to use when working with Transitor.
/// You need to create a TransitorAnimator and assign it as a transitionDelegatae to your ViewController.
/// After you did this you need to set the presentation style to custom so the VC asks its custom delegate.

public class TransitorAnimator : NSObject {
    
    fileprivate var presentation: TransitorPresentation
    private weak var viewController : UIViewController?
    
    
    /// ## designated initializer
    /// - Parameter presentation: a custom Presentation Object
    public init(presentation: TransitorPresentation) {
        self.presentation = presentation
        super.init()
    }
    
    /// ## prepare
    /// Call this function to prepare the viewController you want to present
    /// - Parameter viewController: viewController that should be presented in a custom way
    public func prepare(viewController: UIViewController) {
        viewController.modalPresentationStyle = .custom
        viewController.transitioningDelegate = self
    }
}

/// ## UIViewControllerTransitioningDelegate Implementation
/// The TransitorAnimator needs to conform to the UIViewControllerTransitioningDelegate protocol
/// it will provide a custom Presentation-Controller that tells UIKit which extra Views the presentation should have
/// it also provides the size and frame for the controller that wants to be presented
extension TransitorAnimator: UIViewControllerTransitioningDelegate {
    
    
    /// Gets called from UIKit if presentatioStyle is custom and transitionDelegate is set
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let transitorPresentationController = TransitorPresentationController(presentedViewController: presented, presentingViewController: presenting, presentation: presentation)
        return transitorPresentationController
    }
    
    /// Each Presentation has two directions
    /// Inside a Presention Object you can specify some extra parameters
    /// This Parameters will be passed to a custom animator that handles the presentation animation (duration, direction etc.)
    public func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            if let presentation = self.presentation as? TransitorSlideInPresentation {
                return SlideInPresentationAnimator(direction: presentation.directionShow, presentationType: .show, presentation: presentation)
            } else if let presentation = self.presentation as? TransitorFadeInPresentation {
                return FadeInPresentationAnimator(presentationType: .show, presentation: presentation)
            } else {
                return nil
            }
    }
    
    public func animationController(forDismissed dismissed: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            if let presentation = self.presentation as? TransitorSlideInPresentation {
                return SlideInPresentationAnimator(direction: presentation.directionDismiss, presentationType: .dismiss, presentation: presentation)
            } else if let presentation = self.presentation as? TransitorFadeInPresentation {
                return FadeInPresentationAnimator(presentationType: .dismiss, presentation: presentation)
            } else {
                return nil
            }
    }
}
