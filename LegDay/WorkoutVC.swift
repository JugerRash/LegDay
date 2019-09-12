//
//  WorkoutVC.swift
//  LegDay
//
//  Created by juger rash on 11.09.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit
import Intents // this lib will allow us to use all features of siri

class WorkoutVC: UIViewController {
    
    //Outlets -:
    @IBOutlet private weak var typeLbl : UILabel!
    @IBOutlet private weak var timerLbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeLbl.isHidden = true
        timerLbl.isHidden = true
        
        INPreferences.requestSiriAuthorization { (status) in
            if status == INSiriAuthorizationStatus.authorized {
                print("Sirikit : Authorized")
            }else {
                print("Sirikit : unAuthorized")
            }
        }
    }
    


}

