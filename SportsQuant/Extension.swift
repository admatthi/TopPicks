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
    public var UserToMonth:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserToMonth")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserToMonth")
        }
    }
    public var UserFromMonth:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserFromMonth")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserFromMonth")
        }
    }
    public var UserToYear:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserToYear")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserToYear")
        }
    }
    public var UserFromYear:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserFromYear")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserFromYear")
        }
    }
    public var UserschoolName:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserschoolName")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserschoolName")
        }
    }
    
}
