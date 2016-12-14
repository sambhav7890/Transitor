//
//  ExampleDataProvider.swift
//  Transitor
//
//  Created by Sebastian Boldt on 27.11.16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Transitor

struct DataObject {
    let presentation : TransitorPresentation
    let titleDescription : String
    let detailDescription : String
}

struct ExampleDataProvider {
    var data : [DataObject] = {
        
        /// Default Fade in with custom size
        let defaultFadeInPresentation = TransitorFadeInPresentation(widthForViewController: .halfscreen,
                                                               heightForViewController: .halfscreen)
        
        let defaultFadeInObject = DataObject(presentation: defaultFadeInPresentation, titleDescription: "Default Fade in Animation", detailDescription: "default values")
        
        /// Default slide in with custom size
        let defaultSlideInPresentation = TransitorSlideInPresentation(widthForViewController: .halfscreen,
                                                                 heightForViewController: .halfscreen)
        
        let defaultSlideInObject = DataObject(presentation: defaultSlideInPresentation ,
                                          titleDescription: "Default Slide in Animation",
                                         detailDescription: "Default slide in wth .halfscreen width and height")
        
        
        /// Fade in with blur and custom size
        let customBlurFadeInPresentation = TransitorFadeInPresentation(backgroundStyle: .blur(effectStyle: .light),
                                                            widthForViewController: .halfscreen,
                                                           heightForViewController: .halfscreen)
        
        let customBlurFadeInObject = DataObject(presentation: customBlurFadeInPresentation ,
                                            titleDescription: "Blurred Fade in",
                                           detailDescription: "Fade in Viewcontroller blurred  background .light")
        
        /// Custom slide in presentation with blur
        let customSlideInPresentation = TransitorSlideInPresentation(backgroundStyle: .blur(effectStyle: .dark),
                                                          widthForViewController: .halfscreen,
                                                         heightForViewController: .halfscreen)
        
        let customBlurSlideInObject = DataObject(presentation: customSlideInPresentation,
                                             titleDescription: "Blurred Slide in",
                                            detailDescription: "Slide in Viewcontroller with blurred background .dark")
        
        /// Corner Radius and Transitorness
        let customCornerSlideInPresentation = TransitorSlideInPresentation(cornerRadius: 15,
                                                             backgroundStyle: .blur(effectStyle: .dark),
                                                                   wibbliness: .wibblier,
                                                                    duration: .medium,
                                                               directionShow: .left,
                                                            directionDismiss: .right,
                                                      widthForViewController: .halfscreen,
                                                     heightForViewController: .halfscreen)
        
        let customCornerDirectionSlideInObject = DataObject(presentation:customCornerSlideInPresentation ,
                                                  titleDescription: "Blurred Slide in Custom Direction",
                                                 detailDescription: "Slide in Viewcontroller with custom corner radius, directions and jelliness")
        
        // Custom SlideOver
        let slideOverPresentation = TransitorSlideInPresentation(dismissCurve: .linear,
                                                        presentationCurve: .linear,
                                                             cornerRadius: 0,
                                                          backgroundStyle: .dimmed,
                                                                wibbliness: .none,
                                                                 duration: .normal,
                                                            directionShow: .left,
                                                         directionDismiss: .left,
                                                   widthForViewController: .halfscreen,
                                                  heightForViewController: .fullscreen,
                                                      horizontalAlignment: .left,
                                                        verticalAlignment: .top)
        
        let slideOver = DataObject(presentation: slideOverPresentation,
                               titleDescription: "SlideOver",
                              detailDescription: "halfscreen left side slide in menu")
        
        // Custom Alert
        let alertPresentation = TransitorSlideInPresentation(dismissCurve: .linear,
                                                    presentationCurve: .linear,
                                                         cornerRadius: 15,
                                                      backgroundStyle: .blur(effectStyle: .light),
                                                            wibbliness: .wibblier,
                                                             duration: .normal,
                                                        directionShow: .top,
                                                     directionDismiss: .top,
                                               widthForViewController: .fullscreen, // Lets use 10000 to see if marginGuards kick in
                                              heightForViewController: .custom(value:200) ,
                                                  horizontalAlignment: .center,
                                                    verticalAlignment: .top,
                                                         marginGuards: UIEdgeInsets(top: 30, left: 10, bottom: 30, right: 10))
        
        let alertObject = DataObject(presentation: alertPresentation,
                                 titleDescription: "Custom Notification",
                                detailDescription: "custom alert that comes from the top with blurred transition background")
        
        let data = [defaultFadeInObject,defaultSlideInObject,customBlurFadeInObject,customBlurSlideInObject,customCornerDirectionSlideInObject,slideOver,alertObject]
        
        return data
    }()
}
