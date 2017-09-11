//
//  YXWBaseNavigationController.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/30.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage.init(named: "Navigation_BackImage"), for: .default)
        
        var textAttrs : [String : AnyObject] = Dictionary()
        textAttrs[NSFontAttributeName] = UIFont.systemFont(ofSize: 16)
        textAttrs[NSForegroundColorAttributeName] = HexColor(hex: "#FFFFFF")
        
        navigationBar.titleTextAttributes = textAttrs
        
    }
    
    fileprivate lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "Login_Back"), for: .normal)
        button.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
        return button
    }()
    
     @objc fileprivate func backBtnAction() {
        popViewController(animated: true)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count > 0 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
            viewController.hidesBottomBarWhenPushed = true
            interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        } 
        super.pushViewController(viewController, animated: animated)
    }

}
