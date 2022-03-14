//
//  MyFriendsViewController+TableViewDelegate.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 12.01.2022.
//

import UIKit

extension MyFriendsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForCellTableView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromMyFriendsToGallery,
           let destinationController = segue.destination as? GalleryViewController,
           let friend = sender as? Friends {
            
            print(friend.id)
            print(Storage.share.friendsPhotos)
            destinationController.fotoArray = Storage.share.friendsPhotos[friend.id] ?? [PhotoLikes(photoURL: "https://sun9-21.userapi.com/c10956/u18286/-7/w_45ece801.jpg", photoLikesCount: 0)]
            //destinationController.fotoArray = ["1"]
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
