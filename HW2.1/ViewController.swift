//
//  ViewController.swift
//  HW2.1
//
//  Created by Nikolai  on 06.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var firstButton = UIButton()
    var secondBitton = UIButton()
    var thirdButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstButton = createButton(title: "First Button")
        secondBitton = createButton(title: "Second Medium Button")
        thirdButton = createButton(title: "Third Button")
        
        createConstraint()
        
        thirdButton.addTarget(self, action: #selector(thirdButtonPressed), for: .touchUpInside)
        
        firstButton.startAnimatingPressActions()
        secondBitton.startAnimatingPressActions()
        thirdButton.startAnimatingPressActions()
        
    }
    
    func createButton(title: String) -> UIButton {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.title = title
        button.configuration?.baseForegroundColor = .white
        button.configuration?.baseBackgroundColor = .systemBlue
        
        button.configuration?.image = UIImage(systemName: "arrow.right.circle.fill")
        button.configuration?.imagePlacement = .trailing
        button.configuration?.imagePadding = 8
        
        button.configuration?.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        return button
    }
    
    func createConstraint() {
        view.addSubview(firstButton)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(secondBitton)
        secondBitton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondBitton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10),
            secondBitton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(thirdButton)
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thirdButton.topAnchor.constraint(equalTo: secondBitton.bottomAnchor, constant: 10),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    @objc func thirdButtonPressed() {
        let vc = SecondViewController()
        self.present(vc, animated: true)
    }
    

}

extension UIButton {
    
    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.85, y: 0.85))
    }
    
    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }
    
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [.curveEaseInOut,
                                 .allowUserInteraction],
                       animations: {
                        button.transform = transform
            }, completion: nil)
    }
    
}


