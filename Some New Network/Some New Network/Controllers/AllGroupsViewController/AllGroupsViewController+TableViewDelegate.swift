//
//  AllGroupsViewController+TableViewDelegate.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 13.01.2022.
//

import UIKit

extension AllGroupsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForCellTableView
    }
    
//    func isAlreadyAdded(index: Int) -> Bool {
//        return Storage.share.myGroups.contains { myGroupsItem in
//            myGroupsItem.name == Storage.share.cookingGroups[index].name
//        }
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
