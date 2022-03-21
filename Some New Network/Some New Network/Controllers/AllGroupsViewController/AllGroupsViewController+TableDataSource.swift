//
//  AllGroupsViewController+TableDataSource.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 13.01.2022.
//

import UIKit

extension AllGroupsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = allGroupsTableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableViewCell, for: indexPath) as? Universal__TableViewCell
        else {return UITableViewCell()}
        
//        cell.configure(group: allGroups[indexPath.row], completion: {[weak self] in
//            guard let self = self else {return}
//            print(self.allGroups[indexPath.row])
//            //print(group)
//            if !self.isAlreadyAdded(index: indexPath.row) {
//
//                Storage.share.myGroups.append(Storage.share.cookingGroups[indexPath.row])
//            }
//        })
        
        cell.configure(group: allGroups[indexPath.row], completion: {[weak self] in
            guard let self = self else {return}
            print("add to my groups \(self.allGroups[indexPath.row].name)")
            
            DispatchQueue.main.async {
                self.realm.addGroupToMyGroups(group: self.allGroups[indexPath.row])
            }
        })
        return cell
    }
}
