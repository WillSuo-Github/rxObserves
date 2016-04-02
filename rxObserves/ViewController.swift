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

typealias dogTypes = AnimatableSectionModel<String, Dog>

class ViewController: UIViewController {

    var dogs :Array = [Dog(age: 12, name: "dagou"),Dog(age: 11, name: "xiaogou"),Dog(age: 13, name: "laogou")]
    let sections = Variable([dogTypes]())
    
    let disposebag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tableView = UITableView.init(frame: view.frame)
        
        tableView.dataSource = nil
        tableView.delegate = nil
        view.addSubview(tableView)

        
        
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        let dataSource = RxTableViewSectionedReloadDataSource<dogTypes>()
        
        dataSource.configureCell = { (ss,tableV,indexPath,element ) in
            
            let cell = tableV.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
            cell.textLabel?.text = element.value.name
            
            return cell
        }
        
        sections.asObservable()
            .bindTo(tableView.rx_itemsWithDataSource(dataSource))
            .addDisposableTo(disposebag)
        
        sections.value = [dogTypes(model: "", items: self.dogs)]
        
        
        tableView.rx_modelSelected(IdentifiableValue<Dog>)
            .subscribeNext {
                print($0)
            }
            .addDisposableTo(disposebag)
    
//        sections.asObservable()
//            .bindTo(tableView.rx_itemsWithCellIdentifier("cell", cellType: UITableViewCell.self)) { (index, element, cell) in
//                print(index)
//                cell.textLabel?.text = element.name
//                cell.detailTextLabel?.text = "\(element.age)"
//        }.addDisposableTo(disposebag)
        
        
        
//        
//        tableView.rx_modelSelected(Dog).subscribeNext { (dog) in
//            let alert = UIAlertController.init(title: "message", message: dog.name, preferredStyle: UIAlertControllerStyle.Alert)
//            alert.addAction(UIAlertAction.init(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
//            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
//        }.addDisposableTo(disposebag)
        
//        Observable.just([1,2,2,3,3])
//            .bindTo(tableView.rx_itemsWithCellIdentifier("cell", cellType: UITableViewCell.self)) { (_, element, cell) in
//                cell.textLabel?.text = "\(element)"
//            }.addDisposableTo(disposebag)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

