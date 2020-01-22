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

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = ""
        userSunsignLabel.text = "Aries"
        getHoroscope(for: "aries")
    }
    
    @IBAction func segueSunSign(segue: UIStoryboardSegue) {
        
        guard let detailVC = segue.source as? UserChoiceTableViewController,
            let sign = detailVC.chosenSign,
            let name = detailVC.userInfo
        else {
            fatalError("failed to access UserChoiceTableViewController")
        }
        
        userNameLabel.text = name.name
        userSunsignLabel.text = sign
        getHoroscope(for: userSunsignLabel.text?.lowercased() ?? "Gemini")
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
    
}

