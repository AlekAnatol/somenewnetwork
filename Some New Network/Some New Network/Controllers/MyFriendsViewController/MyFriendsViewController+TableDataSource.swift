//
//  MyFriendsViewController+TableDataSource.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 12.01.2022.
//

import UIKit

extension MyFriendsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myFriendsTableView.dequeueReusableCell(withIdentifier: reuseIdentifierUniversalTableViewCell, for: indexPath) as? Universal__TableViewCell
        else {return UITableViewCell()}
    
        cell.configure(friend: friends[indexPath.row], completion: {[weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: self.fromMyFriendsToGallery, sender: self.friends[indexPath.row])
        })
        return cell
    }
}

