//
//  YXWInspectionReportController.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/30.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWInspectionReportController: YXWBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNaviBar()
    }
}

//导航设置
extension YXWInspectionReportController{
    fileprivate func setupNaviBar() {
        title = "检查报告"
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "navigation_scanfIcon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(scanfAction))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "navagation_more")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(moreAction))
    }
}

//事件
extension YXWInspectionReportController{
    
    @objc fileprivate func scanfAction() {
        MYLog(message: "二维码")
    }
    
    @objc fileprivate func moreAction() {
        MYLog(message: "更多")
    }
}
