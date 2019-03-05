//
//  BasicLayoutController.swift
//
//  Created by Home on 2019.
//  Copyright 2017-2018 NoStoryboardsAtAll Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import UIKit

// creating enumerations for describing tap location in horizontal and vertical
enum VerticalLocation: Int {
    case top
    case bottom
}
enum HorizontalLocation: Int {
    case left
    case right
}

// tuple type that will be store the location of the view
typealias PointLocation = (VerticalLocation, HorizontalLocation)

class AnimateAutoLayoutController: UIViewController {
    // constant view's side length
    let sideLength: CGFloat = 69.0
    
    // view to animate
    lazy var animatedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.layer.cornerRadius = 13.0
        view.layer.masksToBounds = true
        return view
    }()
    
    // variable to store size constraints (will never change)
    var sizeConstraints: [NSLayoutConstraint] = []
    
    // variable to store inital view location constraints
    // (at the start of the app the view ) will be placed at the center of the screen
    var initialConstraints: [NSLayoutConstraint] = []
    
    // location constraints for all cases
    var topLeftConstraints: [NSLayoutConstraint] = []
    var topRightConstraints: [NSLayoutConstraint] = []
    var bottomLeftConstraints: [NSLayoutConstraint] = []
    var bottomRightConstraints: [NSLayoutConstraint] = []

    // Do any additional setup here
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // Setup your view and constraints here
    override func loadView() {
        super.loadView()
        prepareView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func prepareView() {
        // prepare the constraints
        sizeConstraints = [
            animatedView.heightAnchor.constraint(equalToConstant: sideLength),
            animatedView.widthAnchor.constraint(equalToConstant: sideLength)
        ]
        
        initialConstraints = [
            animatedView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            animatedView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ]
        
        topLeftConstraints = [
            animatedView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sideLength),
            animatedView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: sideLength)
        ]
        
        topRightConstraints = [
            animatedView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -sideLength),
            animatedView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: sideLength)
        ]
        
        bottomLeftConstraints = [
            animatedView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sideLength),
            animatedView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -sideLength)
        ]
        
        bottomRightConstraints = [
            animatedView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -sideLength),
            animatedView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -sideLength)
        ]
        
        // add view to superview
        view.addSubview(animatedView)
        // activate initial constraints
        NSLayoutConstraint.activate(sizeConstraints + initialConstraints)
    }
}
