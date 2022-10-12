//
//  Extension.swift
//  SportsQuant
//
//  Created by talal ahmad on 13/10/2022.
//

import Foundation
@objc
extension UserDefaults{
 
    
    public var User_First_Name:String?{
        get{
            return UserDefaults.standard.string(forKey: "User_First_Name")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "User_First_Name")
        }
    }
    public var User_Last_Name:String?{
        get{
            return UserDefaults.standard.string(forKey: "User_Last_Name")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "User_Last_Name")
        }
    }
    public var UserEmail:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserEmail")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserEmail")
        }
    }
    public var UserPhone:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserPhone")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserPhone")
        }
    }
    public var UserSocialLink:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserSocialLink")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserSocialLink")
        }
    }
    public var UserWebLink:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserWebLink")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserWebLink")
        }
    }
    public var UserAddress1:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserAddress1")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserAddress1")
        }
    }
    public var UserAddress2:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserAddress2")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserAddress2")
        }
    }

}
