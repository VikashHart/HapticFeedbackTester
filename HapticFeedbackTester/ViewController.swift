//
//  ViewController.swift
//  HapticFeedbackTester
//
//  Created by Vikash Hart on 5/26/20.
//  Copyright © 2020 Vikash Hart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        label.layer.cornerRadius = 22
        label.layer.masksToBounds = true
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var hapticButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pow")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .red
        button.addTarget(self,
                         action: #selector(tapped),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var i = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        view.backgroundColor = .white
        setupTextLabel()
        setupHapticButton()
    }

    @objc private func tapped() {
        i += 1
        print("Running \(i)")

        switch i {
        case 1:
            textLabel.text = "Error feedback"
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.error)

        case 2:
            textLabel.text = "Success feedback"
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.success)

        case 3:
            textLabel.text = "Warning feedback"
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.warning)

        case 4:
            textLabel.text = "Impact occured: light"
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.prepare()
            generator.impactOccurred()

        case 5:
            textLabel.text = "Impact occured: medium"
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.prepare()
            generator.impactOccurred()

        case 6:
            textLabel.text = "Impact occured: heavy"
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.prepare()
            generator.impactOccurred()

        default:
            textLabel.text = "Selection changed"
            let generator = UISelectionFeedbackGenerator()
            generator.prepare()
            generator.selectionChanged()
            i = 0
        }
    }

    private func setupTextLabel() {
        view.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            textLabel.heightAnchor.constraint(equalToConstant: 44),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupHapticButton() {
        view.addSubview(hapticButton)
        NSLayoutConstraint.activate([
            hapticButton.heightAnchor.constraint(equalToConstant: 60),
            hapticButton.widthAnchor.constraint(equalToConstant: 60),
            hapticButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hapticButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
        ])
    }
}

