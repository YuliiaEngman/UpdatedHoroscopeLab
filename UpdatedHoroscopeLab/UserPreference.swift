//
//  UserPreference.swift
//  UpdatedHoroscopeLab
//
//  Created by Yuliia Engman on 1/22/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import Foundation
//
//enum UnitMeasurement: String {
//    case miles = "Miles"
//    case kilometers = "Kilometers"
//}
//
//enum SportImage: String {
//    case bike = "bike"
//    case run = "run"
//}

struct UserPreferenceKey {
    static let userName = "User Name"
    static let userSunsign = "User Sunsign"
   // static let userSignDescription = "Sign Description"
}
// for which key we have to do 2 functions - update and get

class UserPreference {
    
    // a Singleton's initializer NEEDS to be private - this ensures that
    // ONLY one instance of this class is used throughout the application
    
    private init() {}
    
    //private let standard = UserDefaults.standard
        
    static let shared = UserPreference()
    
    // set a user default value (object)
    func updateUserName(with name: String) {
        //storing or persisting the unit measurement value to UserDefaults (device or similar as permanent storage)
        
        // THIS IS ONE LINE OF CODE THAT MAKES USER
        // UserDefaults.standard is a Singleton in iOS that gives us access to saving and retriewing stored data in the device or simulator
    UserDefaults.standard.set(name, forKey: UserPreferenceKey.userName)
        
        // key is "Unit Measurement"
        // value is either "Miles" or "Kilometers"
        // UserDefaults: ["Unit Measurement" : "Kilometers"]
    }
    
    // retrieve a user defaults value (object)
    // we have to type casting to the value we expect
    func getUserName() -> String? {
       guard let userName = UserDefaults.standard.object(forKey: UserPreferenceKey.userName) as? String else {
            return nil
        }
        return userName
    }
    
    func updateUserSunSign(with sign: String) {
        UserDefaults.standard.set(sign, forKey: UserPreferenceKey.userSunsign)
    }
    
    func getUserSunSign() -> String? {
        guard let userSunsign = UserDefaults.standard.object(forKey: UserPreferenceKey.userSunsign) as? String else {
            return nil
        }
        return userSunsign
    }
    
}

