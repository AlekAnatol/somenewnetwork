//
//  MyPageViewController.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 11.01.2022.
//

import UIKit

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var avatarView: AvatarView!
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeCookerLabel: UILabel!
    @IBOutlet weak var inProfessionLabel: UILabel!
    @IBOutlet weak var sinceBornLabel: UILabel!
    
    @IBOutlet weak var firstPurpleView: UIView!
    @IBOutlet weak var secondPurpleView: UIView!
    @IBOutlet weak var thirdPurpleView: UIView!
    
    private let service = ServiceVK()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImage.layer.cornerRadius = avatarView.layer.cornerRadius
        avatarView.layer.opacity = 0.5
        nameLabel.layer.opacity = 0.5
        homeCookerLabel.layer.opacity = 0.5
        inProfessionLabel.layer.opacity = 0.5
        sinceBornLabel.layer.opacity = 0.5
        
        service.loadData(method: .friendsGet)
        //service.loadData(method: .myGroupsGet)
        //fillAllGroupsData()
        
        animatePurplePoints(totalCount: 1)
    }
    
    func animatePurplePoints(totalCount: Int, currentCount: Int = 0) {
        
        if currentCount < totalCount {
        
        UIView.animate(withDuration: 0.5) {[weak self] in
            self?.firstPurpleView.alpha = 1
            self?.secondPurpleView.alpha = 0
            self?.thirdPurpleView.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {[weak self] in
                self?.firstPurpleView.alpha = 0.5
                self?.secondPurpleView.alpha = 1
                self?.thirdPurpleView.alpha = 0
            } completion: { _ in
                UIView.animate(withDuration: 0.5) {[weak self] in
                    self?.firstPurpleView.alpha = 0
                    self?.secondPurpleView.alpha = 0.5
                    self?.thirdPurpleView.alpha = 1
                } completion: { _ in
                    UIView.animate(withDuration: 0.5) {[weak self] in
                        self?.firstPurpleView.alpha = 0
                        self?.secondPurpleView.alpha = 0
                        self?.thirdPurpleView.alpha = 0.5
                    }
                completion: { [weak self] _ in
                    self?.animatePurplePoints(totalCount: totalCount, currentCount: currentCount + 1)
                }
                }
            }
        }
        } else {
            firstPurpleView.alpha = 0
            secondPurpleView.alpha = 0
            thirdPurpleView.alpha = 0
            
            avatarView.layer.opacity = 1
            nameLabel.layer.opacity = 1
            homeCookerLabel.layer.opacity = 1
            inProfessionLabel.layer.opacity = 1
            sinceBornLabel.layer.opacity = 1
        }
    }
    
    
 //   func fillFriendsData () {
        
        
//        let friend1 = Friend(name: "Masha", avatar: "Masha", fotos: ["Masha1", "Masha2", "Masha3", "Masha4", "Masha5"])
//        let friend2 = Friend(name: "Grisha", avatar: "Grisha", fotos: ["Grisha1", "Grisha2", "Grisha3"])
//        let friend3 = Friend(name: "Pasha", avatar: "Pasha", fotos: ["Pasha1", "Pasha2", "Pasha3", "Pasha4", "Pasha5", "Pasha6"])
//        let friend4 = Friend(name: "Sasha", avatar: "Sasha", fotos: ["Sasha1", "Sasha2", "Sasha3", "Sasha4"])
//
//        Storage.share.myFriends.append(friend1)
//        Storage.share.myFriends.append(friend2)
//        Storage.share.myFriends.append(friend3)
//        Storage.share.myFriends.append(friend4)
//    }
        
    
//    func fillAllGroupsData() {
//
//        let group1 = Group(name: "Little helpers", avatar: "Little helpers", description: "We can teach your children to cook")
//        Storage.share.myGroups.append(group1)
//
//        for index in 0 ... Storage.share.allGroupsNames.count - 1 {
//
//            let group = Group(name: Storage.share.allGroupsNames[index],
//                              avatar: Storage.share.allGroupsNames[index],
//                              description: Storage.share.allGroupsDescription[Storage.share.allGroupsNames[index]])
//            Storage.share.allGroups.append(group)
//        }
//
//    }
}

