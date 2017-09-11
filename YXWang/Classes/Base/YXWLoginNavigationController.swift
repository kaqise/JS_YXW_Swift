//
//  YXWLoginNavigationController.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/29.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWLoginNavigationController: UINavigationController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if navigationBar.isHidden == false {
            
            setNavigationBarHidden(true, animated: animated)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.childViewControllers.count > 0 {
            let backButton = UIButton()
            backButton.setImage(UIImage.init(named: "Login_Back"), for: .normal)
            backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            viewController.view.addSubview(backButton)
            backButton.snp.makeConstraints({ (make) in
                make.left.equalTo(Scale_W(w: 19))
                make.top.equalTo(Scale_H(h: 33))
            })
            interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func backAction() {
        
        popViewController(animated: true)
    }
    
}
