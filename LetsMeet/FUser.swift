//
//  FUser.swift
//  LetsMeet
//
//  Created by 최기훈 on 2022/03/06.
//

import Foundation
import Firebase


class FUser: Equatable {
    
    static func == (lhs: FUser, rhs: FUser) -> Bool {
        lhs.objectId == rhs.objectId
        
    }
    let objectId: String = ""
    
    
    class func registerUserWith(email: String, password: String, userName: String, city: String, isMale: Bool, dateOfBirth: Date, completion: @escaping (_ error : Error?) -> Void) {
            
        print("register success")
        print("register", Date())
        
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            
            completion(error)
            
            if error == nil{
                
                authData!.user.sendEmailVerification { (error) in
                    print("auth email verification sent", error?.localizedDescription)
                }
                //create user in database
            }
            
            
        }
    }
    
    
    
}
