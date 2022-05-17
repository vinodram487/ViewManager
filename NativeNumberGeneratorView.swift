//
//  NativeNumberGeneratorView.swift
//

import Foundation
import UIKit
import React

class NativeNumberGeneratorView: UIView {
    @objc var initialNumber: NSNumber = 0 {
        didSet {
            number = Int(truncating: initialNumber)
        }
    }
    
    @objc var number: Int = 0 {
        didSet {
            //randomNumberLabel.text = "\(number)"
        }
    }
    
    @objc var onNumberSend: RCTDirectEventBlock?
    
    var timer = Timer()
    
    
    @IBOutlet private var randomNumberLabel: UILabel!
    @IBOutlet private var randomNumberButton: UIButton!
    @IBOutlet private var sendToRNButton: UIButton!
    
    var vc: NativeNumberGeneratorViewController?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setUpView()
        //setUpViewController()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //setUpView()
        //setUpViewController()
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        //randomNumberLabel.text = "\(initialNumber)"
//    }
//    
//    private func setUpViewController() {
//        let vc = NativeNumberGeneratorViewController()
//        self.addSubview(vc.view)
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        vc = NativeNumberGeneratorViewController()
        print("initialNumber: \(initialNumber)")
        vc?.view.frame = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: 300) //bounds//CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: 300)
        if let vc = vc {
            self.addSubview(vc.view)
            vc.setUpView(onNumberSendFromContainer: onNumberSend, initialNumber: initialNumber)
            self.backgroundColor = .brown
            self.isUserInteractionEnabled = true
        }
    }
    
    private func setUpView() {
//        timer.invalidate()
//        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(sendToRNAction), userInfo: nil, repeats: true)

        randomNumberLabel = UILabel()
        randomNumberLabel.font = .systemFont(ofSize: 24)
        randomNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        randomNumberLabel.textAlignment = .right
        randomNumberLabel.text = "0"
        self.addSubview(randomNumberLabel)
        
        self.randomNumberButton = UIButton(type: .system)
        self.randomNumberButton.translatesAutoresizingMaskIntoConstraints = false
        self.randomNumberButton.setTitle("Generate", for: .normal)
        self.randomNumberButton.backgroundColor = .red
        self.randomNumberButton.addTarget(self, action: #selector(getRandomNumberAction), for: .touchUpInside)
        self.randomNumberButton.isUserInteractionEnabled = true
        self.addSubview(randomNumberButton)
        
        self.sendToRNButton = UIButton(type: .system)
        self.sendToRNButton.translatesAutoresizingMaskIntoConstraints = false
        self.sendToRNButton.setTitle("Send To RN", for: .normal)
        self.sendToRNButton.addTarget(self, action: #selector(sendToRNAction), for: .touchUpInside)
        self.sendToRNButton.isUserInteractionEnabled = true
        self.addSubview(sendToRNButton)
        
        NSLayoutConstraint.activate([
            self.randomNumberLabel.topAnchor.constraint(equalTo: self.centerYAnchor),
            self.randomNumberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.randomNumberButton.topAnchor.constraint(equalTo: randomNumberLabel.bottomAnchor, constant: 16),
            self.randomNumberButton.centerXAnchor.constraint(equalTo: randomNumberLabel.centerXAnchor),
            
            self.sendToRNButton.topAnchor.constraint(equalTo: randomNumberButton.bottomAnchor, constant: 16),
            self.sendToRNButton.centerXAnchor.constraint(equalTo: randomNumberLabel.centerXAnchor)
        ])
        self.bringSubviewToFront(sendToRNButton)
        self.isUserInteractionEnabled = true
    }
    
    @IBAction func getRandomNumberAction() {
        self.initialNumber = NSNumber(value:Int.random(in: 0...100))
        self.randomNumberLabel.text = "\(initialNumber)"
    }
    
    @IBAction func sendToRNAction() {
        if onNumberSend != nil {
            self.onNumberSend!(["nativeNumber": initialNumber])
        }
    }
}
