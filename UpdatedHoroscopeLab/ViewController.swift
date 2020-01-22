//
//  ViewController.swift
//  UpdatedHoroscopeLab
//
//  Created by Yuliia Engman on 1/19/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userSunsignLabel: UILabel!
    @IBOutlet weak var sunsignDescriptionTextView: UITextView!
    
    var passedName = "" {
        didSet{
            DispatchQueue.main.async {
                self.userNameLabel.text = self.passedName
                UserDefaults.standard.set(self.passedName, forKey: "userNameLabel")
            }
        }
    }
    
    var passedSunsign = "" {
        didSet{
            DispatchQueue.main.async {
                self.userSunsignLabel.text = self.passedSunsign
                self.getHoroscope(for: self.passedSunsign)
                UserDefaults.standard.set(self.passedSunsign, forKey: "userSunsignLabel")
            }
        }
    }
    
    private func getHoroscope(for sign: String) {
        HoroscopeAPIClient.fetchHoroscope(for: sign.lowercased(), completion: { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error \(appError)")
            case .success(let gotHoroscope):
                DispatchQueue.main.async {
                    self?.sunsignDescriptionTextView.text = gotHoroscope.horoscope
                }
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = ""
        userSunsignLabel.text = "Aries"
        getHoroscope(for: "aries")
    }


}

