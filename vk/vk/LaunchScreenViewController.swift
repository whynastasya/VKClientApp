//
//  LaunchScreenViewController.swift
//  vk
//
//  Created by nastasya on 15.07.2023.
//

import UIKit

final class LaunchScreenViewController: UIViewController {
    
    private var circles = [Circle]()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue.withAlphaComponent(0.98)
        for index in 0..<3 {
            let circle = Circle(frame: CGRectMake(0, view.center.y, 16, 16))
            circle.center.x = view.center.x + CGFloat((index - 1)*20)
            circle.alpha = 1 - CGFloat(Double(index) * 0.4)
            circles.append(circle)
            view.addSubview(circle)
        }
        animate()
    }
    
    private func animate() {
        UIView.animate(withDuration: 5, delay: 0, options: [.autoreverse], animations: { [self] in
            circles[0].alpha = 0.4
            circles[2].alpha = 1
        }, completion: { [self] _ in
            let authorizationViewController = AuthorizationViewController()
            authorizationViewController.modalPresentationStyle = .fullScreen
            present(authorizationViewController, animated: true)
        })
    }
    
}
