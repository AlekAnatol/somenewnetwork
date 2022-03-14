//
//  MyGroupsViewController.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 11.01.2022.
//

import UIKit

class MyGroupsViewController: UIViewController {
    
    @IBOutlet weak var myGroupsTableView: UITableView!
    
    let sourceGroups = Storage.share.myGroups
    var groups = [Group]()
    
    private let service = ServiceVK()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myGroupsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myGroupsTableView.dataSource = self
        myGroupsTableView.delegate = self
        
        myGroupsTableView.register(UINib(nibName: "Universal  TableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
        
        service.loadData(method: .cookingGroupsGet)
        
    }
}
