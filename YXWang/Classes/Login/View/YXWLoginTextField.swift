//
//  YXWLoginTextField.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/29.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWLoginTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textAlignment = .center
        contentVerticalAlignment = .center
        borderStyle = .bezel
        tintColor = HexColor(hex: "#FFFFFF")
        font = Scale_Font(f: 14)
        textColor = HexColor(hex: "#E4E4E4")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.masksToBounds = true
        layer.cornerRadius = self.bounds.size.height / 2
        layer.borderColor = HexColor(hex: "#FFFFFF").cgColor
        layer.borderWidth = 1
        
        
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        setValue(Scale_Font(f: 14), forKeyPath: "_placeholderLabel.font")
        setValue(HexColor(hex: "#E4E4E4"), forKeyPath: "_placeholderLabel.textColor")
        return super.placeholderRect(forBounds: bounds)
        
    }
    
    
    func showAnnimation() {
        let baseAnnimation = CABasicAnimation(keyPath: "transform.translation.x")
        baseAnnimation.fromValue = -5
        baseAnnimation.toValue = 5
        baseAnnimation.duration = 0.1
        baseAnnimation.autoreverses = true
        baseAnnimation.repeatCount = 2
        baseAnnimation.isRemovedOnCompletion = true
        layer.add(baseAnnimation, forKey: nil)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
