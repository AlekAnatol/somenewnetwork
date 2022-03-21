//
//  MyGroupsViewController+TableDataSource.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 13.01.2022.
//

import UIKit

extension MyGroupsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myGroupsTableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableViewCell, for: indexPath) as? Universal__TableViewCell
        else {return UITableViewCell()}
        
        cell.configure(group: myGroups[indexPath.row], completion: {
            print(self.myGroups[indexPath.row].name)
        })
//        cell.configure(group: Storage.share.myGroups[indexPath.row], completion: {
//            print(Storage.share.myGroups[indexPath.row].name)
//        })
        
        return cell
    }
}
