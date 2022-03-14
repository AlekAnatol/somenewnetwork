//
//  MyFriendsViewController.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 11.01.2022.
//

import UIKit

class MyFriendsViewController: UIViewController {
    
    
    @IBOutlet weak var myFriendsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    /*private*/ let service = ServiceVK()
    
    let fromMyFriendsToGallery = "fromMyFriendsToGallery"
    
    let sourceFriends = Storage.share.myFriends
    var friends = [Friends]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFriendsTableView.dataSource = self
        myFriendsTableView.delegate = self
        
        searchBar.delegate = self
        
        myFriendsTableView.register(UINib(nibName: "Universal  TableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUniversalTableViewCell)
        
        friends = Storage.share.myFriends
        service.loadPhotos()
    }
}


extension MyFriendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            friends = Storage.share.myFriends

        } else {
            friends = Storage.share.myFriends.filter({sourceFriendsItem in
                sourceFriendsItem.firstName.lowercased().contains(searchText.lowercased())
            })
        }
        myFriendsTableView.reloadData()
    }
}
