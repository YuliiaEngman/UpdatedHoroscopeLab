//
//  UserChoiceTableViewController.swift
//  UpdatedHoroscopeLab
//
//  Created by Yuliia Engman on 1/22/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit

class UserChoiceTableViewController: UITableViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var chosenSign = ""
    var userInfo: UserInfo?
    
private let horoscopesSigns = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        
        //textField.delegate = self
    }
 
    @IBAction func horoscopeButtonPressed(_ sender: UIButton) {
    }
    
}

extension UserChoiceTableViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return horoscopesSigns.count
    }
}

extension UserChoiceTableViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return horoscopesSigns[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenSign = horoscopesSigns[row]
    }
}

extension UserChoiceTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    
        userInfo?.name = textField.text ?? ""
        return true
    }
}
