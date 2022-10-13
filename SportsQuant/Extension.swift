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
    public var UserSummary:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserSummary")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserSummary")
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
    public var UserEducationToMonth:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserEducationToMonth")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserEducationToMonth")
        }
    }
    public var UserEducationFromMonth:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserEducationFromMonth")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserEducationFromMonth")
        }
    }
    public var UserEducationToYear:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserEducationToYear")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserEducationToYear")
        }
    }
    public var UserEducationFromYear:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserEducationFromYear")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserEducationFromYear")
        }
    }
    public var UserEducationSchoolName:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserEducationSchoolName")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserEducationSchoolName")
        }
    }
    public var UserEducationPresentSelected:Bool{
        get{
            return UserDefaults.standard.bool(forKey: "UserEducationPresentSelected")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserEducationPresentSelected")
        }
    }
    public var UserWorkHistoryPresentSelected:Bool{
        get{
            return UserDefaults.standard.bool(forKey: "UserWorkHistoryPresentSelected")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserWorkHistoryPresentSelected")
        }
    }
    public var UserWorkToMonth:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserWorkToMonth")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserWorkToMonth")
        }
    }
    public var UserWorkFromMonth:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserWorkFromMonth")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserWorkFromMonth")
        }
    }
    public var UserWorkToYear:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserWorkToYear")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserWorkToYear")
        }
    }
    public var UserWorkFromYear:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserWorkFromYear")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserWorkFromYear")
        }
    }
    public var UserWorkCompanyName:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserWorkCompanyName")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserWorkCompanyName")
        }
    }
    public var UserWorkCompanyLocation:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserWorkCompanyLocation")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserWorkCompanyLocation")
        }
    }
    public var UserWorkCompanyInPosition:String?{
        get{
            return UserDefaults.standard.string(forKey: "UserWorkCompanyInPosition")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "UserWorkCompanyInPosition")
        }
    }
}
