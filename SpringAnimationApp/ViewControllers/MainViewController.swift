//
//  MainViewController.swift
//  SpringAnimationApp
//
//  Created by Денис Хафизов on 08.11.2023.
//

import UIKit
import SpringAnimation

final class MainViewController: UIViewController {

    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    
    @IBOutlet weak var mainView: SpringView!
    
    @IBOutlet weak var secondView: SpringView!
    @IBOutlet weak var changeAnimationButton: SpringButton!
    
    private var currentAnimation = Animation.getAnimation()
    private var nextAnimation: Animation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeAnimationButton.setTitle("Run \(currentAnimation.preset)", for: .normal)
    }
    
    @IBAction func changeAnimationPressed(_ sender: SpringButton) {
        startMainViewAnimation()
        startSecondViewAnimation()
        setupLabels()
        
        nextAnimation = Animation.getAnimation()
        currentAnimation = nextAnimation
        changeAnimationButton.setTitle("Run \(nextAnimation.preset)", for: .normal)
    }
    
    private func startMainViewAnimation() {
        mainView.animation = currentAnimation.preset
        mainView.curve = currentAnimation.curve
        mainView.force = currentAnimation.force
        mainView.duration = currentAnimation.duration
        mainView.delay = currentAnimation.delay
        
        mainView.animate()
    }
    
    private func startSecondViewAnimation() {
        secondView.animation = "fadeIn"
        secondView.curve = "linear"
        secondView.force = 1.2
        secondView.duration = 0.5
        secondView.delay = 0
        
        secondView.animate()
    }
    
    private func setupLabels() {
        presetLabel.text = currentAnimation.preset
        curveLabel.text = currentAnimation.curve
        forceLabel.text = String(currentAnimation.force)
        durationLabel.text = String(currentAnimation.duration)
        delayLabel.text = String(currentAnimation.delay)
    }
}
