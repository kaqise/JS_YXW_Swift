//
//  YXWUserPortMeController.swift
//  YXWang
//
//  Created by FengDing_Ping on 2017/8/30.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

import UIKit

class YXWUserPortMeController: YXWBaseController {
    
    fileprivate var sources : [String : String] = Dictionary()
    
    fileprivate lazy var headerView: YXWMeTopView = {
        let view = YXWMeTopView(frame: CGRect(x: 0, y: 0, width: Screen_W, height: Scale_H(h: 193)))
        return view
    }()
    
    fileprivate lazy var _tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.tableFooterView = UIView()
        tableView.separatorColor = HexColor(hex: "#F5F5F5")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sources["me_healthRecord"] = "健康档案"
        sources["me_family"] = "家人资料"
        sources["me_expertCollect"] = "专家收藏"
        sources["me_setting"] = "设置"
        
        automaticallyAdjustsScrollViewInsets = false
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    

}

extension YXWUserPortMeController{
    
    fileprivate func setup() {
        
        view.addSubview(_tableView)
        _tableView.tableHeaderView = headerView
        
        _tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        
    }
}

extension YXWUserPortMeController : UITableViewDelegate , UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: NSStringFromClass(UITableViewCell.self))
            cell?.textLabel?.font = Scale_Font(f: 15)
            cell?.textLabel?.textColor = HexColor(hex: "#333333")
            cell?.selectionStyle = .none
            cell?.accessoryType = .disclosureIndicator
        }
        
        cell?.imageView?.image = UIImage.init(named: Array(sources.keys)[indexPath.row])
        cell?.textLabel?.text = Array(sources.values)[indexPath.row]
        
        return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43.0
    }
}
