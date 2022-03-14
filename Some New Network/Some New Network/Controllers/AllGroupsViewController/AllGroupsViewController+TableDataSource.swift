//
//  AllGroupsViewController+TableDataSource.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 13.01.2022.
//

import UIKit

extension AllGroupsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Storage.share.cookingGroups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = allGroupsTableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableViewCell, for: indexPath) as? Universal__TableViewCell
        else {return UITableViewCell()}
        
        //        cell.configure(image: UIImage(named: Storage.share.allGroupsNames[indexPath.row]),
        //                       name: Storage.share.allGroupsNames[indexPath.row],
        //                       description: Storage.share.allGroupsDescription[Storage.share.allGroupsNames[indexPath.row]])
        //        cell.configure(group: Storage.share.allGroups[indexPath.row])
        
        cell.configure(group: Storage.share.cookingGroups[indexPath.row], completion: {[weak self] in
            guard let self = self else {return}
            print(Storage.share.cookingGroups[indexPath.row])
            if !self.isAlreadyAdded(index: indexPath.row) {
                Storage.share.myGroups.append(Storage.share.cookingGroups[indexPath.row])
            }
        })
        return cell
    }
}
