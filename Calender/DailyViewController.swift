//
//  dailyViewController.swift
//  Calender
//
//  Created by 朱偉綸 on 2021/4/13.
//

import Foundation
import UIKit

class DailyViewController : UIViewController {
    
    @IBOutlet weak var timeView: UIStackView!
    
    override func viewDidLoad() {
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        timeView.addGestureRecognizer(longPressGestureRecognizer)
        
    }
    
    @objc func longPress(recognizer:UILongPressGestureRecognizer){
        print("test1")
        var location = recognizer.location(in: timeView)
        print(location)
        
        
    }
    
    
    
    
    
    
    
    
    
    
}
