//
//  ViewController.swift
//  Animation
//
//  Created by Perejro on 26/11/2024.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var animationInfoView: UIStackView!
    @IBOutlet weak var animationNameLabel: UILabel!
    @IBOutlet weak var animationDurationLabel: UILabel!
    @IBOutlet weak var animationForceLabel: UILabel!
    @IBOutlet weak var animationDampingLabel: UILabel!
    @IBOutlet weak var animationVelocityLabel: UILabel!
    @IBOutlet weak var animationCurveLabel: UILabel!
    
    private let store = DataStore.shared
    private lazy var nextAnimation = store.getAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationInfoView.isHidden = true
        addShadowToView(animationView)
        addGradientToView(view)
    }

    @IBAction func nextAnimationAction(_ sender: UIButton) {
        updateAnimationLabels();

        if animationInfoView.isHidden {
            animationInfoView.isHidden.toggle()
        }
        
        runAnimation()
        nextAnimation = store.getAnimation()
        
        sender.setTitle("Next: \(nextAnimation.stringName.uppercased())", for: .normal)
    }
    
    private func runAnimation() {
        animationView.animation = nextAnimation.stringName
        animationView.duration = nextAnimation.duration
        animationView.force = nextAnimation.force
        animationView.damping = nextAnimation.damping
        animationView.velocity = nextAnimation.velocity
        animationView.curve = nextAnimation.curveName

        animationView.animate()
    }
    
    private func updateAnimationLabels() {
        animationNameLabel.text = "Name: \(nextAnimation.stringName)"
        animationDurationLabel.text = "Duraration: \(format(nextAnimation.duration))"
        animationForceLabel.text = "Force: \(format(nextAnimation.force))"
        animationDampingLabel.text = "Damping: \(format(nextAnimation.damping))"
        animationVelocityLabel.text = "Velocity: \(format(nextAnimation.velocity))"
        animationCurveLabel.text = "Curve: \(nextAnimation.curveName)"
    }
    
    private func addGradientToView(_ view: UIView) {
        let gradientLayer = CAGradientLayer()

        gradientLayer.colors = [
            UIColor.systemOrange.withAlphaComponent(0.7).cgColor,
            UIColor.systemPink.withAlphaComponent(0.7).cgColor,
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
        
    private func addShadowToView(_ view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowRadius = 10
        view.layer.masksToBounds = false
    }
}

// MARK: - helpers
extension ViewController {
    func format(_ value: Double) -> String {
        String(format: "%.2f", value)
    }
}
