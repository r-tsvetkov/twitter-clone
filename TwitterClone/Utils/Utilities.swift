//
// Created by Роман Цветков on 19.05.2020.
// Copyright (c) 2020 Roman Tsvetkov. All rights reserved.
//

import UIKit

class Utilities {

    static func createInputContainerView(withImage image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = image
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true

        view.addSubview(imageView)
        imageView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
        imageView.setDimensions(width: 24, height: 24)

        view.addSubview(textField)
        textField.anchor(
                left: imageView.rightAnchor,
                bottom: view.bottomAnchor,
                right: view.rightAnchor,
                paddingLeft: 8,
                paddingBottom: 8
        )

        let dividerView = UIView()
        dividerView.backgroundColor = .white
        view.addSubview(dividerView)
        dividerView.anchor(
                left: view.leftAnchor,
                bottom: view.bottomAnchor,
                right: view.rightAnchor,
                paddingLeft: 8,
                height: 0.76
        )

        return view
    }

    static func createTextField(withPlaceholder placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.textColor = .white
        textField.font = .systemFont(ofSize: 16)
        textField.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )

        return textField
    }

    static func createMainButton(withTitle title: String) -> UIButton {
        let button = UIButton()

        button.setTitle(title, for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)

        return button
    }

    static func createAttributedButton(_ firstPart: String, _ secondPart: String) -> UIButton {
        let button = UIButton(type: .system)

        let attributedTitle = NSMutableAttributedString(string: firstPart, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ])

        attributedTitle.append(
                NSMutableAttributedString(string: secondPart, attributes: [
                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                    NSAttributedString.Key.foregroundColor: UIColor.white
                ])
        )

        button.setAttributedTitle(attributedTitle, for: .normal)

        return button
    }
}
