//
//  NativeNumberGeneratorViewController.swift
//

import UIKit
import React

class NativeNumberGeneratorViewController: UIViewController {
    
    @objc var initialNumber: NSNumber = 0
    
    @objc var number: Int = 0 
    @objc var onNumberSend: RCTDirectEventBlock?
    
    private var randomNumberLabel: UILabel!
    private var randomNumberButton: UIButton!
    private var sendToRNButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(onNumberSendFromContainer: RCTDirectEventBlock?, initialNumber: NSNumber) {
        //timer.invalidate()
        //timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(sendToRNAction), userInfo: nil, repeats: true)
        onNumberSend = onNumberSendFromContainer
        randomNumberLabel = UILabel()
        randomNumberLabel.font = .systemFont(ofSize: 24)
        randomNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        randomNumberLabel.textAlignment = .right
        randomNumberLabel.text = "\(initialNumber)"
        self.view.addSubview(randomNumberLabel)

        self.randomNumberButton = UIButton(type: .system)
        self.randomNumberButton.translatesAutoresizingMaskIntoConstraints = false
        self.randomNumberButton.setTitle("Generate", for: .normal)
        self.randomNumberButton.backgroundColor = .red
        self.randomNumberButton.addTarget(self, action: #selector(getRandomNumberAction), for: .touchUpInside)
        self.randomNumberButton.isUserInteractionEnabled = true
        self.view.addSubview(randomNumberButton)

        self.sendToRNButton = UIButton(type: .system)
        self.sendToRNButton.translatesAutoresizingMaskIntoConstraints = false
        self.sendToRNButton.setTitle("Send To RN", for: .normal)
        self.sendToRNButton.addTarget(self, action: #selector(sendToRNAction), for: .touchUpInside)
        self.sendToRNButton.isUserInteractionEnabled = true
        self.view.addSubview(sendToRNButton)

        NSLayoutConstraint.activate([
            self.randomNumberLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16),
            self.randomNumberLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            self.randomNumberButton.topAnchor.constraint(equalTo: randomNumberLabel.bottomAnchor, constant: 16),
            self.randomNumberButton.centerXAnchor.constraint(equalTo: randomNumberLabel.centerXAnchor),

            self.sendToRNButton.topAnchor.constraint(equalTo: randomNumberButton.bottomAnchor, constant: 16),
            self.sendToRNButton.centerXAnchor.constraint(equalTo: randomNumberLabel.centerXAnchor)
        ])
        self.view.bringSubviewToFront(sendToRNButton)
        self.view.isUserInteractionEnabled = true
        self.view.backgroundColor = .yellow
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.getRandomNumberAction))
        self.view.addGestureRecognizer(tapGesture)
    }

    @objc func getRandomNumberAction() {
        self.initialNumber = NSNumber(value:Int.random(in: 0...100))
        self.randomNumberLabel.text = "\(initialNumber)"
    }
    
    @objc func sendToRNAction() {
        if onNumberSend != nil {
            self.onNumberSend!(["nativeNumber": initialNumber])
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
