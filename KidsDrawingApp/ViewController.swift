//
//  ViewController.swift
//  KidsDrawingApp
//
//  Created by HebaMac on 7/18/20.
//  Copyright © 2020 HSAAA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // declarations .....................
    let canvas = Canvas()

    let undobtn : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("UNDO", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(backbtnClicked), for: .touchUpInside)
        return button
    }()
    
    let clearbtn : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CLEAR", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(clearbtnClicked), for: .touchUpInside)
        return button
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        //slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    var blackbtn : ColoredButton = ColoredButton()
    let redbtn : ColoredButton = ColoredButton()
    let yellowbtn : ColoredButton = ColoredButton()
    let bluebtn : ColoredButton = ColoredButton()
    let greenbtn : ColoredButton = ColoredButton()
    
    // functions ..................
    
    @objc fileprivate func sliderValueChanged(s: UISlider) {
        //canvas.updateStrokeWidth(width: slider.value)
        print(s.value)
    }
    
    @objc func updateColor(sender: UIButton){
        let color = sender.backgroundColor ?? .black
        canvas.updateStrokeColor(newColor: color)
    }
    
    override func loadView() {self.view = canvas}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.backgroundColor = .white
        
        stackViewLayout()
        initializeAllColoredButton()
    }
    
    func initializeAllColoredButton (){
        
        blackbtn.addTarget(self, action: #selector(updateColor), for: .touchUpInside)
        blackbtn.setColor(color: .black)
        redbtn.addTarget(self, action: #selector(updateColor), for: .touchUpInside)
        redbtn.setColor(color: .red)
        yellowbtn.addTarget(self, action: #selector(updateColor), for: .touchUpInside)
        yellowbtn.setColor(color: .yellow)
        bluebtn.addTarget(self, action: #selector(updateColor), for: .touchUpInside)
        bluebtn.setColor(color: .blue)
        greenbtn.addTarget(self, action: #selector(updateColor), for: .touchUpInside)
        greenbtn.setColor(color: .green)
    }
    
    @objc func backbtnClicked() {canvas.undoDrawing()}
    @objc func clearbtnClicked() {canvas.clearDrawing()}
    
    
    func stackViewLayout (){
        let colorStack = UIStackView(arrangedSubviews: [
            blackbtn,
            redbtn,
            yellowbtn,
            greenbtn,
            bluebtn,
            ])
        
        let stackView = UIStackView(arrangedSubviews: [
            undobtn,
            clearbtn,
            colorStack,
            slider
            ])
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        // stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

}

