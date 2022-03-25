//
//  FUser.swift
//  LetsMeet
//
//  Created by 최기훈 on 2022/03/06.
//

import Foundation
import Firebase
import UIKit

class FUser: Equatable {
    
    static func == (lhs: FUser, rhs: FUser) -> Bool {
        lhs.objectId == rhs.objectId
        
    }
    let objectId: String
    var email: String
    var username: String
    var dateOfBirth: Date
    var isMale: Bool
    var avatar: UIImage?
    var profession: String
    var jobTitle: String
    var about: String
    var city: String
    var country: String
    var height: Double
    var lookingFor: String
    var avatarLink: String
    var likedIdArray: [String]?
    var imageLinks: [String]?
    let registeredDate = Date()
    var pushId: String?
    
    var userDictionary: NSDictionary{
        return NSDictionary(objects: [
            self.objectId,
            self.email,
            self.username,
            self.dateOfBirth,
            self.isMale,
            self.profession,
            self.jobTitle,
            self.about,
            self.city,
            self.country,
            self.height,
            self.lookingFor,
            self.avatarLink,
            
            self.likedIdArray ?? [],
            self.imageLinks ?? [],
            self.registeredDate,
            self.pushId
        ],
                            forKeys: [kOBJECTID as NSCopying,
                                      kEMAIL as NSCopying,
                                      kUSERNAME as NSCopying,
                                      kDATEOFBIRTH as NSCopying,
                                      kISMALE as NSCopying,
                                      kPROFESSION as NSCopying,
                                      kJOBTITLE as NSCopying,
                                      kABOUT as NSCopying,
                                      kCITY as NSCopying,
                                      kCOUNTRY as NSCopying,
                                      kHEIGHT as NSCopying,
                                      kLOOKINGFOR as NSCopying,
                                      kAVATARLINK as NSCopying,
                                      kLIKEIDARRAY as NSCopying,
                                      kIMAGELINKS as NSCopying,
                                      kREGISTERDDATE as NSCopying,
                                      kPUSHID as NSCopying as NSCopying
        
        ])
    }
    
    //MARK: - initialize
    init(_objectId: String, _email: String, _username: String, _city: String, _dateOfBirth: Date, _isMale: Bool, _avatarLink: String = "") {
        objectId = _objectId
        email = _email
        username = _username
        dateOfBirth = _dateOfBirth
        isMale = _isMale
        profession = ""
        jobTitle = ""
        about = ""
        city = _city
        country = ""
        height = 0.0
        lookingFor = ""
        avatarLink = _avatarLink
        likedIdArray = []
        imageLinks = []
    }
    
    
    class func registerUserWith(email: String, password: String, userName: String, city: String, isMale: Bool, dateOfBirth: Date, completion: @escaping (_ error : Error?) -> Void) {
            
        print("register success")
        
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            
            completion(error)
            
            if error == nil{
                
                authData!.user.sendEmailVerification { (error) in
                    print("auth email verification sent", error?.localizedDescription)
                }
                //create user in database
                
                if authData?.user != nil {
                    
                    let user = FUser(_objectId: authData!.user.uid, _email: email, _username: userName, _city: city, _dateOfBirth: dateOfBirth, _isMale: isMale)
                    
                    user.saveUserLocally()
                    
                    
                }
            }
            
            
        }
    }
    
    func saveUserLocally() {
        
    }
    
    
    
}
