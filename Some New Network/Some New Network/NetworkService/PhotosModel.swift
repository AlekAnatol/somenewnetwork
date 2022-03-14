//
//  PhotosModel.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 03.03.2022.
//

import Foundation
import RealmSwift

struct PhotosModel: Decodable {
    let response: PhotosResponse
}

struct PhotosResponse: Decodable {
    let count: Int
    let items: [PhotoInfo]?
}

struct PhotoInfo: Decodable {
    let ownerID: Int
    let sizes: [Size]
    let likes: LikesResponse
    
    enum CodingKeys: String, CodingKey {
        case ownerID = "owner_id"
        case sizes
        case likes
    }
    
}

class Size: Object, Decodable {
    @objc dynamic var url = ""
    @objc dynamic var type = ""
}

struct LikesResponse: Decodable {
    let likesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case likesCount = "count"
    }
}
