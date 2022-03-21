//
//  MyFriendsViewController.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 11.01.2022.
//

import UIKit
import SwiftUI

class MyFriendsViewController: UIViewController {
    
    
    @IBOutlet weak var myFriendsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    /*private*/ let service = ServiceVK()
    private let realm = RealmCacheService()
    
    let fromMyFriendsToGallery = "fromMyFriendsToGallery"
    
    //let sourceFriends = Storage.share.myFriends
    var sourceFriends = [Friends]()
    var friends = [Friends]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFriendsTableView.dataSource = self
        myFriendsTableView.delegate = self
        
        searchBar.delegate = self
        
        myFriendsTableView.register(UINib(nibName: "Universal  TableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
        
        self.loadMyFriendsFromRealm()
        sourceFriends = friends
    }
}


extension MyFriendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            friends = sourceFriends
        } else {
            friends = sourceFriends.filter({sourceFriendsItem in
                sourceFriendsItem.firstName.lowercased().contains(searchText.lowercased())
            })
        }
        myFriendsTableView.reloadData()
    }
}

private extension MyFriendsViewController{
    
    func loadMyFriendsFromRealm() {
        DispatchQueue.main.async {
            let friendsFromRealm = self.realm.read(object: Friends.self)
            friendsFromRealm.forEach { self.friends.append($0) }
            self.myFriendsTableView.reloadData()
        }
    }
}
