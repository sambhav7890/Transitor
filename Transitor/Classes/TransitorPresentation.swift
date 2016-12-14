//
//  TransitorPresentation.swift
//  Created by Sambhav Shah on 14/12/2016
//

import Foundation


/// The TransitorPresentation protocol defines which properties a basic presentation should provide

/// Maybe we could use a class hierarchy to abstract all the different types better than using protocol for that
public protocol TransitorPresentation {
	var duration: TransitorConstants.Duration { get }
	var widthForViewController: TransitorConstants.Size { get  }
	var heightForViewController: TransitorConstants.Size { get }
	var backgroundStyle : TransitorConstants.BackgroundStyle { get }
	var cornerRadius: Double { get }
	var presentationCurve : TransitorConstants.TransitorCurve { get }
	var dismissCurve : TransitorConstants.TransitorCurve { get }

	/// If the width or height is bigger than the container we are working in, marginGuards will kick in and limit the size the specified margins
	var marginGuards: UIEdgeInsets { get }
}

/// If a presentation is Alginable it provides vertical and horizontal alignment options
public protocol AlignablePresentation {
	var verticalAlignemt : TransitorConstants.VerticalAlignment { get }
	var horizontalAlignment : TransitorConstants.HorizontalAlignment { get }
}
