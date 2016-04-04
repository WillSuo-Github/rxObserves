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

typealias dogType = AnimatableSectionModel<String, Dog>

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
        
    }
    
    private func skinTableViewDataSource(dataSource: RxTableViewSectionedReloadDataSource<dogType>){
    
        dataSource.configureCell = { ()
            
            
        }
    
    
    }
}






