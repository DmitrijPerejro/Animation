//
//  Animation.swift
//  Animation
//
//  Created by Perejro on 26/11/2024.
//

import Foundation
import SpringAnimation

struct Animation {
    enum AnimationType: String, CaseIterable {
        case pop
        case slideLeft
        case slideRight
        case slideDown
        case slideUp
        case squeezeLeft
        case squeezeRight
        case squeezeDown
        case squeezeUp
        case fadeIn
        case fadeOut
        case fadeOutIn
        case fadeInLeft
        case fadeInRight
        case fadeInDown
        case fadeInUp
        case zoomIn
        case zoomOut
        case fall
        case shake
        case flipX
        case flipY
        case morph
        case squeeze
        case flash
        case wobble
        case swing
    }
    
    enum AnimationCurve: String, CaseIterable {
        case easeIn
        case easeOut
        case easeInOut
        case linear
        case spring
        case easeInSine
        case easeOutSine
        case easeInOutSine
        case easeInQuad
        case easeOutQuad
        case easeInOutQuad
        case easeInCubic
        case easeOutCubic
        case easeInOutCubic
        case easeInQuart
        case easeOutQuart
        case easeInOutQuart
        case easeInQuint
        case easeOutQuint
        case easeInOutQuint
        case easeInExpo
        case easeOutExpo
        case easeInOutExpo
        case easeInCirc
        case easeOutCirc
        case easeInOutCirc
        case easeInBack
        case easeOutBack
        case easeInOutBack
    }

    let name: AnimationType
    let duration: Double
    let force: Double
    let curve: AnimationCurve
    let damping: Double
    let velocity: Double
    
    var stringName: String {
        name.rawValue
    }
    
    var curveName: String {
        curve.rawValue
    }
    
    static func make() -> Animation {
        Animation(
            name: Animation.AnimationType.allCases.randomElement() ?? Animation.AnimationType.zoomIn,
            duration: Double.random(in: 2...5),
            force: Double.random(in: 1...3),
            curve: Animation.AnimationCurve.allCases.randomElement() ?? Animation.AnimationCurve.easeIn,
            damping: Double.random(in: 1...3),
            velocity: Double.random(in: 1...3)
        )
    }
}
