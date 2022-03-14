//
//  LoginViewController.swift
//  Some New Network
//
//  Created by Екатерина Алексеева on 28.12.2021.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!

    
    let fromLoginToTabbarSegue = "fromLoginToTabbar"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        fillFriendsData()
//        fillAllGroupsData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let recignizer = UITapGestureRecognizer(target: self, action: #selector(onTop))
        recignizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(recignizer)
        
    }
    
    @objc func onTop() {
        self.view.endEditing(true)
    }
    
    @objc func keyboardDidHide() {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    @objc func keyboardDidShow(_ notification: Notification ) {
        guard let keyBoardHeight = ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as?  NSValue)?.cgRectValue)?.height else {return}
        
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyBoardHeight - 10, right: 0)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text else {return}
        
        performSegue(withIdentifier: fromLoginToTabbarSegue, sender: nil)
        
//        if login == "root", password == "1234" {
//            print("Success")
//            performSegue(withIdentifier: fromLoginToTabbarSegue, sender: nil)
//
//
//        } else {
//            //         Создаем контроллер
//            let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
//            // Создаем кнопку для UIAlertController
//            let action = UIAlertAction(title: "OK", style: .cancel, handler:  nil)
//            // Добавляем кнопку на UIAlertController
//            alert.addAction(action)
//            // Показываем UIAlertController
//            present(alert, animated: true, completion: nil)
//
//            print("Login error")
//        }
    }
    
//    func fillFriendsData () {
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
//        
//    
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
