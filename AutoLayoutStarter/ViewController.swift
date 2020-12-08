//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
    
    // create purple rectangle
    let purpleView: UIView = {
        let purpleRect = UIView(frame: CGRect.zero)
        purpleRect.translatesAutoresizingMaskIntoConstraints = false
        purpleRect.backgroundColor = .purple
        return purpleRect
    }()
    
    // create red rectangle
    let redView: UIView = {
        let redRect = UIView(frame: CGRect.zero)
        redRect.translatesAutoresizingMaskIntoConstraints = false
        redRect.backgroundColor = .red
        return redRect
    }()
    
    // create two orange rectangles
    let orangeView1: UIView = {
        let orangeRect = UIView(frame: CGRect.zero)
        orangeRect.translatesAutoresizingMaskIntoConstraints = false
        orangeRect.backgroundColor = .orange
        return orangeRect
    }()
    
    let orangeView2: UIView = {
        let orangeRect = UIView(frame: CGRect.zero)
        orangeRect.translatesAutoresizingMaskIntoConstraints = false
        orangeRect.backgroundColor = .orange
        return orangeRect
    }()
    
    // create three blue rectangles
    let blueView1: UIView = {
        let blueRect = UIView(frame: CGRect.zero)
//        let rect = CGRect(x: 0, y: 0, width: 50, height: 50)
//        let blueRect = UIView(frame: rect)
        blueRect.translatesAutoresizingMaskIntoConstraints = false
        blueRect.backgroundColor = .blue
        return blueRect
    }()
    
    let blueView2: UIView = {
        let blueRect = UIView(frame: CGRect.zero)
//        let rect = CGRect(x: 0, y: 0, width: 50, height: 50)
//        let blueRect = UIView(frame: rect)
        blueRect.translatesAutoresizingMaskIntoConstraints = false
        blueRect.backgroundColor = .blue
        return blueRect
    }()
    
    let blueView3: UIView = {
        let blueRect = UIView(frame: CGRect.zero)
//        let rect = CGRect(x: 0, y: 0, width: 50, height: 50)
//        let blueRect = UIView(frame: rect)
        blueRect.translatesAutoresizingMaskIntoConstraints = false
        blueRect.backgroundColor = .blue
        return blueRect
    }()
    
//    let blueRectCintainer: UIView = {
//        let rect = UIView(frame: CGRect.zero)
//        rect.translatesAutoresizingMaskIntoConstraints = false
//        return rect
//    }()
    
    
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    // add subviews
    mainView.addSubview(purpleView)
    mainView.addSubview(redView)
    redView.addSubview(orangeView1)
    redView.addSubview(orangeView2)
//    mainView.addSubview(blueRectCintainer)
//    blueRectCintainer.addSubview(blueView1)
//    blueRectCintainer.addSubview(blueView2)
//    blueRectCintainer.addSubview(blueView3)
    setupLayout()
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
    
    // purple rectangle layout
    let purpleViewConstraints = [
        purpleView.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -90),
        purpleView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
        purpleView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6),
        purpleView.heightAnchor.constraint(equalToConstant: 70)
    ]
    NSLayoutConstraint.activate(purpleViewConstraints)
    
    // red rectangle layout
    let redViewConstraints = [
        redView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
        redView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
        redView.widthAnchor.constraint(equalToConstant: 250),
        redView.heightAnchor.constraint(equalToConstant: 70)
    ]
    NSLayoutConstraint.activate(redViewConstraints)
    
    // orange rectangle 1 layout
    let orangeView1Constraints = [
        orangeView1.topAnchor.constraint(equalTo: redView.topAnchor, constant: 10),
        orangeView1.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 10),
        orangeView1.widthAnchor.constraint(equalToConstant: 130),
        orangeView1.heightAnchor.constraint(equalToConstant: 50)
    ]
    NSLayoutConstraint.activate(orangeView1Constraints)
    
    // orange rectangle 2 layout
    let orangeView2Constraints = [
        orangeView2.topAnchor.constraint(equalTo: redView.topAnchor, constant: 10),
        orangeView2.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: -10),
        orangeView2.widthAnchor.constraint(equalToConstant: 90),
        orangeView2.heightAnchor.constraint(equalToConstant: 50)
    ]
    NSLayoutConstraint.activate(orangeView2Constraints)
    
    // blue rectangles layout
//    let blueRectCintainerConstraints = [
//        blueRectCintainer.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
//        blueRectCintainer.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
//        blueRectCintainer.widthAnchor.constraint(equalToConstant: 50),
//        blueRectCintainer.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.7)
//    ]
//    NSLayoutConstraint.activate(blueRectCintainerConstraints)
//
    let blueView1Constraints = [
        blueView1.widthAnchor.constraint(equalToConstant: 70),
        blueView1.heightAnchor.constraint(equalToConstant: 70)
//        blueView1.centerXAnchor.constraint(equalTo: blueRectCintainer.centerXAnchor),
//        blueView1.topAnchor.constraint(equalTo: blueRectCintainer.topAnchor)
    ]
    NSLayoutConstraint.activate(blueView1Constraints)
    
    let blueView2Constraints = [
        blueView2.widthAnchor.constraint(equalToConstant: 70),
        blueView2.heightAnchor.constraint(equalToConstant: 70)
//        blueView2.centerXAnchor.constraint(equalTo: blueRectCintainer.centerXAnchor),
//        blueView2.centerYAnchor.constraint(equalTo: blueRectCintainer.centerYAnchor)
    ]
    NSLayoutConstraint.activate(blueView2Constraints)
    
    let blueView3Constraints = [
        blueView3.widthAnchor.constraint(equalToConstant: 70),
        blueView3.heightAnchor.constraint(equalToConstant: 70)
//        blueView3.centerXAnchor.constraint(equalTo: blueRectCintainer.centerXAnchor),
//        blueView3.bottomAnchor.constraint(equalTo: blueRectCintainer.bottomAnchor)
    ]
    NSLayoutConstraint.activate(blueView3Constraints)
    
    // below UIStackView didn't work
    let blueRectsStackView = UIStackView(arrangedSubviews: [
                                            blueView1, blueView2, blueView3])
    blueRectsStackView.translatesAutoresizingMaskIntoConstraints = false
    blueRectsStackView.axis = .vertical
    blueRectsStackView.alignment = .center
    blueRectsStackView.distribution = .equalSpacing
//    blueRectsStackView.spacing = 20

    mainView.addSubview(blueRectsStackView)
    NSLayoutConstraint.activate([
        blueRectsStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
        blueRectsStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
        
        blueRectsStackView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.7),
        blueRectsStackView.widthAnchor.constraint(equalToConstant: 100)
    ])
    
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

