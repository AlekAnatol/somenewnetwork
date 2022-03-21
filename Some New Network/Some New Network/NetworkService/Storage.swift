//
//  Storage.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 13.01.2022.
//

import UIKit

class Storage: NSObject {
    static var share = Storage()
    
    private override init() {
        super.init()
    }
    
    //let allGroupsNames = ["Meet cookers", "Little helpers", "Pancakes", "Best fish recepies", "Italian souces"]
    //let allGroupsDescription = ["Meet cookers": "We are NOT vegans", "Little helpers": "We can teach your children to cook", "Pancakes": "All fillings", "Best fish recepies": "Yummi!", "Italian souces": "Mama mia!"]
    //var cookingGroups = [Groups]()
    //var myGroups = [Groups]()
    //var myFriends = [Friends]()
    var friendsPhotos = [Int: [PhotoLikes]]()
}

struct PhotoLikes {
    var photoURL = String()
    var photoLikesCount = Int()
}
