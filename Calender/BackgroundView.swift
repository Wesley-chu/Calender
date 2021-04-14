//
//  backgroundView.swift
//  Calender
//
//  Created by 朱偉綸 on 2021/4/4.
//

import Foundation
import UIKit


class BackgroundView:UIView{
    var backgroundColorOfView = UIColor(hexString: "#808080", alpha: 0.5)
    var checkIfisHidden = true
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = backgroundColorOfView
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapBackgroundView))
        self.frame = UIScreen.main.bounds
        self.isHidden = true
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func tapBackgroundView(){
        self.isHidden = !self.isHidden
        self.checkIfisHidden = !self.checkIfisHidden
    }
    
}
