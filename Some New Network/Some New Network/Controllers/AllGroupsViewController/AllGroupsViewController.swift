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
    
    //let allGroups = ["Meet cookers", "Little helpers", "Pancakes"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.loadData(method: .cookingGroupsGet)
        
        allGroupsTableView.dataSource = self
        allGroupsTableView.delegate = self
        
        allGroupsTableView.register(UINib(nibName: "Universal  TableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)

    }
    
}
