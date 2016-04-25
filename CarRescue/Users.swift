//
//  Users.swift
//  CarRescue
//
//  Created by jacky nguyen on 4/20/16.
//  Copyright © 2016 jackyCode.com. All rights reserved.
//

import Foundation
import Parse

class Users: NSObject {
    var userAvatar: String?
    var emailVerification: Bool?
    var phone: String?
    var updateAt: NSDate?
    var userName: String?
    var createdAt: NSDate?
    var password: String?
    var email: String?
    var dictionary:NSDictionary?

    
    // Singleton 
    //static let sharedInstance = Users()
    init(userName: String?, password: String?) {
        self.userName = userName
        self.password = password
    }
    
    static var _currentUser: Users!
    
    class var currentUser:Users? {
        get {
            return _currentUser
        } set {
            _currentUser = currentUser
        }
    }
    
    func signUp(userName:String, password:String, completion:(result:Bool?, error:String?) -> ()) {
        let user = PFUser()
        
        user.username = userName
        user.password = password
        
        user.signUpInBackgroundWithBlock { (success:Bool, error:NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? String
                completion(result: false, error: errorString)
            } else {
                completion(result: true, error: nil)
            }
        }
    }
    
    func logIn(userName:String, password:String, completion:(result:PFUser?, error:String?) -> ()) {
        PFUser.logInWithUsernameInBackground(userName, password: password) { (user, error:NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? String
                completion(result: nil, error: errorString)
            } else {
                Users.currentUser = Users(userName: user?.username, password: user?.password)
                completion(result:user, error:nil)
            }
        }
    }
    
    func logOut() {
        PFUser.logOut()
        Users.currentUser = nil
    }
    
    
}
