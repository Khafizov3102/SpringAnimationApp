//
//  Animation.swift
//  SpringAnimationApp
//
//  Created by Денис Хафизов on 08.11.2023.
//

import Foundation

struct Animation {
    let preset: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    static func getAnimation() -> Animation {
        let dataStore = DataStore.shared
        
        let presetIndex = Int.random(in: 0..<dataStore.presets.count)
        let curveIndex = Int.random(in: 0..<dataStore.curves.count)
        let forceNumber = (Double.random(in: 0...2) * 100).rounded() / 100
        let durationNumber = (Double.random(in: 0...2) * 100).rounded() / 100
        let delayNumber = (Double.random(in: 0...1) * 100).rounded() / 100
        
        return Animation(
            preset: dataStore.presets[presetIndex],
            curve: dataStore.curves[curveIndex],
            force: forceNumber,
            duration: durationNumber,
            delay: delayNumber
        )
    }
}
