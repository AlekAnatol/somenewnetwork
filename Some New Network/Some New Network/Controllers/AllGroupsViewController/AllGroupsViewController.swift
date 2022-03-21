//
//  AllGroupsViewController.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 11.01.2022.
//

import UIKit

class AllGroupsViewController: UIViewController {

    
    @IBOutlet weak var allGroupsTableView: UITableView!
    
    private let service = ServiceVK()
    let realm = RealmCacheService()
    var allGroups = [Groups]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allGroupsTableView.dataSource = self
        allGroupsTableView.delegate = self
        
        allGroupsTableView.register(UINib(nibName: "Universal  TableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)

        loadAllGroupsFromRealm()
    }
}

private extension AllGroupsViewController{
    
    func loadAllGroupsFromRealm() {
        DispatchQueue.main.async {
            let allGroupsFromRealm = self.realm.readGroups(isMember: false)
            allGroupsFromRealm.forEach { self.allGroups.append($0) }
            self.allGroupsTableView.reloadData()
        }
    }
}
