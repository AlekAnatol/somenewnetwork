//
//  MyGroupsViewController.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 11.01.2022.
//

import UIKit

class MyGroupsViewController: UIViewController {
    
    @IBOutlet weak var myGroupsTableView: UITableView!
    
    //let sourceGroups = Storage.share.myGroups
    var myGroups = [Groups]()
    
    private let service = ServiceVK()
     var realm = RealmCacheService()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myGroups.removeAll()
        loadAMyGroupsFromRealm()
        myGroupsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myGroupsTableView.dataSource = self
        myGroupsTableView.delegate = self
        
        myGroupsTableView.register(UINib(nibName: "Universal  TableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
        
        service.loadData(method: .cookingGroupsGet)
        
        //myGroups.removeAll()
        //loadAMyGroupsFromRealm()
        //myGroupsTableView.reloadData()
    }
}

private extension MyGroupsViewController{
    
    func loadAMyGroupsFromRealm() {
        DispatchQueue.main.async {
            let myGroupsFromRealm = self.realm.readGroups(isMember: true)
            myGroupsFromRealm.forEach { self.myGroups.append($0) }
            self.myGroupsTableView.reloadData()
        }
    }
}
