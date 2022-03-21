//
//  MyGroupsViewController+TableViewDelegate.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 13.01.2022.
//

import UIKit

extension MyGroupsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForCellTableView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myGroups[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //myGroups.remove(at: indexPath.row)
        DispatchQueue.main.async {
            print(self.myGroups[indexPath.row].name)
            self.realm.deleteGroupFromMyGroups(group: self.myGroups[indexPath.row])
        }
        myGroups.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .right)
    }
}
