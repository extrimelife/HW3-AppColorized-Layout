//
//  ViewController.swift
//  AppColourChange-Layout
//
//  Created by roman Khilchenko on 06.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let colorView: UIView = {
        let viewColour = UIView()
        viewColour.translatesAutoresizingMaskIntoConstraints = false
        viewColour.backgroundColor = .cyan
        viewColour.layer.cornerRadius = 20
        return viewColour
    }()
    
    private let redStaticLabel: UILabel = {
        let staticRedLabel = UILabel()
        staticRedLabel.text = "Red:"
        staticRedLabel.textColor = .white
        return staticRedLabel
    }()
    
    private let greenStaticLabel: UILabel = {
        let staticGreenLabel = UILabel()
        staticGreenLabel.translatesAutoresizingMaskIntoConstraints = false
        staticGreenLabel.text = "Green:"
        staticGreenLabel.textColor = .white
        return staticGreenLabel
    }()
    
    private let blueStaticLabel: UILabel = {
        let staticBlueLabel = UILabel()
        staticBlueLabel.translatesAutoresizingMaskIntoConstraints = false
        staticBlueLabel.text = "Blue:"
        staticBlueLabel.textColor = .white
        return staticBlueLabel
    }()
    
    private let stackForStaticLabel:  UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var redDinamicLabel: UILabel = {
        getDinamicLabel()
    }()
    
    private lazy var greenDinamicLabel: UILabel = {
        getDinamicLabel()
    }()
    
    private lazy var blueDinamicLabel: UILabel = {
        getDinamicLabel()
    }()
    
    private let stackForDinamicLabel: UIStackView = {
        let viewStack = UIStackView()
        viewStack.translatesAutoresizingMaskIntoConstraints = false
        viewStack.axis = .vertical
        viewStack.distribution = .fillEqually
        viewStack.spacing = 20
        return viewStack
    }()
    
    private lazy var redSlider: UISlider = {
        let redSlider = getSlider(colour: .red)
        redSlider.addTarget(self, action: #selector(redSliderAction), for: .valueChanged)
        return redSlider
    }()
    
    private lazy var greenSlider: UISlider = {
        let greenSlider = getSlider(colour: .green)
        greenSlider.addTarget(self, action: #selector(greenSliderAction), for: .valueChanged)
        return greenSlider
    }()
    
    private lazy var blueSlider: UISlider = {
        let blueSlider = getSlider(colour: .blue)
        blueSlider.addTarget(self, action: #selector(blueSliderAction), for: .valueChanged)
        return blueSlider
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupColour()
    }
    
    @objc private func redSliderAction() {
        setupColour()
        redDinamicLabel.text = String(round(redSlider.value * 100) / 100)
    }
    
    @objc private func greenSliderAction() {
       setupColour()
        greenDinamicLabel.text = String(round(greenSlider.value * 100) / 100)
    }
    
    @objc private func blueSliderAction() {
        setupColour()
        blueDinamicLabel.text = String(round(blueSlider.value * 100) / 100)
    }
    
    //MARK: - Настраиваю динамический UILabel, чтобы не дублировать код при создании одинаковых UILabel
    private func getDinamicLabel() -> UILabel {
        let dinamicGreenLabel = UILabel()
        dinamicGreenLabel.translatesAutoresizingMaskIntoConstraints = false
        dinamicGreenLabel.text = "0.0"
        dinamicGreenLabel.textColor = .white
        return dinamicGreenLabel
    }
    
    //MARK: - Настраиваю UISlider чтобы дублировать код при создании одинаковых UISlider
    private func getSlider(colour: UIColor) -> UISlider {
        let redSlider = UISlider()
        redSlider.translatesAutoresizingMaskIntoConstraints = false
        redSlider.value = 0
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = colour
        return redSlider
    }
    
    private func setupLayout() {
        view.backgroundColor = .systemGray2
        [colorView, stackForStaticLabel, stackForDinamicLabel, redSlider, greenSlider, blueSlider] . forEach { view.addSubview($0) }
        [redStaticLabel, greenStaticLabel, blueStaticLabel] .forEach { stackForStaticLabel.addArrangedSubview($0) }
        [redDinamicLabel, greenDinamicLabel, blueDinamicLabel] .forEach { stackForDinamicLabel.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            colorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            colorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            colorView.heightAnchor.constraint(equalToConstant: 200),
            
            stackForStaticLabel.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 20),
            stackForStaticLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            stackForDinamicLabel.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 20),
            stackForDinamicLabel.leadingAnchor.constraint(equalTo: stackForStaticLabel.trailingAnchor, constant: 16),
            stackForDinamicLabel.widthAnchor.constraint(equalToConstant: 40),
            
            redSlider.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 16),
            redSlider.leadingAnchor.constraint(equalTo: stackForDinamicLabel.trailingAnchor, constant: 30),
            redSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            greenSlider.topAnchor.constraint(equalTo: redSlider.bottomAnchor, constant: 10),
            greenSlider.leadingAnchor.constraint(equalTo: stackForDinamicLabel.trailingAnchor, constant: 30),
            greenSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            blueSlider.topAnchor.constraint(equalTo: greenSlider.bottomAnchor, constant: 10),
            blueSlider.leadingAnchor.constraint(equalTo: stackForDinamicLabel.trailingAnchor, constant: 30),
            blueSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}

//MARK: - Расширение для смены цвета при движении UISlider
extension ViewController {
    func setupColour() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                        green: CGFloat(greenSlider.value),
                                blue: CGFloat(blueSlider.value), alpha: 1)
    }
}

