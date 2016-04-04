//
//  ViewController.swift
//  rxObserves
//
//  Created by mac on 16/4/2.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import RxAlamofire
import Alamofire

typealias dogType = AnimatableSectionModel<String, Dog>


let host = "https://stg-rxswift.leanapp.cn"

class ViewController: UIViewController{

    let disposeBag = DisposeBag()
    
    let sections = Variable([dogType]())
    
    let dataSource = RxTableViewSectionedReloadDataSource<dogType>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tableView = UITableView.init(frame: view.frame)
        tableView.dataSource = nil
        tableView.delegate = nil
        view.addSubview(tableView)
        
        skinTableViewDataSource(dataSource)
        
        sections.asObservable()
        .bindTo(tableView.rx_itemsWithDataSource(dataSource))
        .addDisposableTo(disposeBag)
        
        let manager = Manager.sharedInstance
        manager.rx_responseJSON(.GET, host + "/users")
    }
    
    private func skinTableViewDataSource(dataSource: RxTableViewSectionedReloadDataSource<dogType>){
    
        dataSource.configureCell = { (_,tableV,indexPath,element) in
            
            let cell = tableV.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
            cell.textLabel?.text = element.value.name
            cell.detailTextLabel?.text = String.init(element.value.age)
            
            return cell
        }
    
    
    }
}






