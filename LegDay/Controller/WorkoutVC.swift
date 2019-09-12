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
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleSiriRequest), name: NSNotification.Name(rawValue: "workoutStartedNotification"), object: nil)
        
        
        INPreferences.requestSiriAuthorization { (status) in
            if status == INSiriAuthorizationStatus.authorized {
                print("Sirikit : Authorized")
            }else {
                print("Sirikit : unAuthorized")
            }
        }
    }
    
    @objc func handleSiriRequest(){
        guard let intent = DataService.instance.userWorkoutIntent , let goalValue = intent.goalValue , let workoutName = intent.workoutName?.spokenPhrase else {
            typeLbl.isHidden = true
            timerLbl.isHidden = true
            return
        }
        
        typeLbl.isHidden = false
        timerLbl.isHidden = false
        
        typeLbl.text = "TYPE: \(workoutName.capitalized) "
        timerLbl.text = "\(goalValue.convertToClockTime()) LEFT"
        
    }


}

