//
//  AutoLayout_practice.swift
//  week01
//
//  Created by 정교은 on 4/24/26.
//

import UIKit

class AutoLayout_Practice: UIViewController {
    
    var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    func setUI() {
        [yellowView, greenView, blackView, blueView].forEach{self.view.addSubview($0)}
        
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: view.topAnchor),
            yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            yellowView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
            yellowView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)
        ])
        
        NSLayoutConstraint.activate([
            greenView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor),
            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
            greenView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
            greenView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)
        ])
        
        NSLayoutConstraint.activate([
            blackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blackView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            blackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
            blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)
        ])
        
        NSLayoutConstraint.activate([
            blueView.leadingAnchor.constraint(equalTo: blackView.trailingAnchor),
            blueView.topAnchor.constraint(equalTo: blackView.bottomAnchor),
            blueView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
            blueView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)
        ])
    }
}
