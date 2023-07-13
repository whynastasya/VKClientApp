//
//  NewsFeedHeader.swift
//  vk
//
//  Created by nastasya on 13.07.2023.
//

import UIKit

final class NewsFeedHeader: UIView {
    
    private var buttons = [UIButton]()
    private var selectorView = UIView()
    private var selectedSegmentedTintColor = UIColor.white
    private var textColor = UIColor.gray
    private var buttonTitles = ["Новости", "Для вас", "Актуальное"]
    private var selectedIndex = 0
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    
    private func updateView() {
        setupButtons()
        setupStackView()
        setupSelectorView()
    }
    
    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func setupSelectorView() {
        let selectorWidth = frame.width / CGFloat(self.buttonTitles.count)
        selectorView = UIView(frame: CGRect(x: 0, y: self.frame.height, width: selectorWidth, height: 2))
        selectorView.backgroundColor = selectedSegmentedTintColor
        addSubview(selectorView)
    }
    
    private func setupButtons() {
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setAttributedTitle(NSAttributedString(string: buttonTitle, attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .bold)]), for: .normal)
            button.tintColor = textColor
            button.addTarget(self, action: #selector(buttonAction(_ :)), for: .touchUpInside)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectedSegmentedTintColor, for: .normal)
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        for (buttonIndex, button) in buttons.enumerated() {
            button.setTitleColor(textColor, for: .normal)
            if button == sender {
                let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
                selectedIndex = buttonIndex
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                button.setTitleColor(selectedSegmentedTintColor, for: .normal)
            }
        }
    }
}
