//
//  ServiceVK.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 22.02.2022.
//

import Foundation
import RealmSwift

class ServiceVK {
    
    private let session: URLSession = {
        let configure = URLSessionConfiguration.default
        let session = URLSession(configuration: configure)
        return session
    }()
    
    private let scheme = "https"
    private let host = "api.vk.com"
    
    func loadData(method: ApiMethods) {
        guard Session.instance.token != nil else { return }
        
        var urlComponenets = urlSettings(method: method)
        urlComponenets.queryItems = queryItemsSettings(method: method)
        
        guard let url = urlComponenets.url  else {return}
        print(url)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error")
            }
            guard let data = data else {
                return
            }
            let jsonDecoder = JSONDecoder()
            
            if method == .friendsGet {
                //let jsonDecoder = JSONDecoder()
                
                do {
                    let result = try jsonDecoder.decode(FriendsModel.self, from: data).response.items
                    Storage.share.myFriends = result//.response.items
                    self.saveInfoInRealm(info: result)
                }
                catch {
                    print("Error")
                }
                
            }   else  if method == .myGroupsGet  {
               // let jsonDecoder = JSONDecoder()
                
                do {
                    let result = try jsonDecoder.decode(GroupsModel.self, from: data).response.items
                    Storage.share.myGroups = result//.response.items
                    self.saveInfoInRealm(info: result)//.response.items)
                    print("MY GROUPS LOADED \(result)")
                }
                catch {
                    print("Error")
                }
            }
            else  if method == .cookingGroupsGet {
                
                do {
                    let result = try jsonDecoder.decode(GroupsModel.self, from: data).response.items
                    Storage.share.cookingGroups = result//.response.items
                    self.saveInfoInRealm(info: result)//.response.items)
                }
                catch {
                    print("Error")
                }
            }
        }
        task.resume()
    }
    
    func loadPhotos() -> () {
        guard Session.instance.token != nil else { return }
        
        let session: URLSession = {
            let configure = URLSessionConfiguration.default
            let session = URLSession(configuration: configure)
            return session
        }()
        
        var urlComponenets = urlSettings(method: .getPhotos)
        urlComponenets.queryItems = queryItemsSettings(method: .getPhotos)
        
        for friend in Storage.share.myFriends {
            urlComponenets.queryItems?.append(URLQueryItem(name: "owner_id", value: String(friend.id)))
            
            guard let url = urlComponenets.url  else {return}
            
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("error")
                    var newElement = PhotoLikes()
                    newElement.photoURL = "Grisha"
                    newElement.photoLikesCount = 0
                    Storage.share.friendsPhotos[friend.id]?.append(newElement)
                }
                guard let data = data else { return }
                
                let jsonDecoder = JSONDecoder()
                do {
                    let result = try jsonDecoder.decode(PhotosModel.self, from: data)
                    
                    if result.response.count == 0 {
                        var newElement = PhotoLikes()
                        newElement.photoURL = "Grisha"
                        newElement.photoLikesCount = 0
                        Storage.share.friendsPhotos[friend.id]?.append(newElement)
                        //Storage.share.friendsPhotos[friend.id][0]. = ["1"]
                        return
                    } else {
                        var thisFriendPhotos = [PhotoLikes]()
                        guard let response = result.response.items else {return}
    
                        for photosResponse in response {
                            var newElement = PhotoLikes()
                            newElement.photoLikesCount = photosResponse.likes.likesCount
                                for photoSize in photosResponse.sizes {
                                    if photoSize.type == "m" {
                                        newElement.photoURL = photoSize.url
                                        thisFriendPhotos.append(newElement)
                                    }
                                }
                        }
                        print("For friend id \(friend.id) count of photos: \(thisFriendPhotos.count)")
                        Storage.share.friendsPhotos[friend.id] = thisFriendPhotos
                        
                    }
                }
                catch {
                    print("Error")
                }
            }
            task.resume()
        }
    }
        
        private func urlSettings(method: ApiMethods) -> URLComponents {
            var urlComponenets = URLComponents()
            urlComponenets.scheme = scheme
            urlComponenets.host = host
            urlComponenets.path = method.rawValue
            
            return urlComponenets
        }
        
        private func queryItemsSettings(method: ApiMethods) -> [URLQueryItem] {
            var queryItems = [URLQueryItem]()
            
            switch method {
            case .friendsGet:
                queryItems = [URLQueryItem(name: "access_token", value: Session.instance.token),
                              URLQueryItem(name: "v", value: "5.131"),
                              URLQueryItem(name: "count", value: "15"),
                              URLQueryItem(name: "fields", value: "photo_50")]
            case .myGroupsGet:
                queryItems = [URLQueryItem(name: "access_token", value: Session.instance.token),
                              URLQueryItem(name: "v", value: "5.131"),
                              URLQueryItem(name: "extended", value: "1")]
            case .cookingGroupsGet:
                queryItems = [URLQueryItem(name: "access_token", value: Session.instance.token),
                              URLQueryItem(name: "v", value: "5.131"),
                              URLQueryItem(name: "q", value: "Кулинария"),
                              URLQueryItem(name: "type", value: "group"),
                              URLQueryItem(name: "count", value: "10")]
            case .getPhotos:
                queryItems = [URLQueryItem(name: "access_token", value: Session.instance.token),
                              URLQueryItem(name: "album_id", value: "wall"),
                              URLQueryItem(name: "extended", value: "1"),
                              URLQueryItem(name: "v", value: "5.131"),
                              URLQueryItem(name: "count", value: "12")]
            }
            return queryItems
        }
    }

extension ServiceVK {
    func saveInfoInRealm <T: Object> (info: [T]) {
        do {
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            let realm = try Realm(configuration: config)
            //let realm = try Realm()
            print(realm.configuration.fileURL)
            realm.beginWrite()
            realm.add(info)
            try realm.commitWrite()
        }
        catch {
            print("ITS ERROR: \(error)")
        }
    }
}
