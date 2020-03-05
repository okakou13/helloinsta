//
//  UserPageViewController.swift
//  instaSample2
//
//  Created by 岡田昂典 on 2020/03/05.
//  Copyright © 2020 Kosuke Okada. All rights reserved.
//

import UIKit
import NCMB

class UserPageViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userDisplayNameLabel: UILabel!
    @IBOutlet weak var userIntroductionTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
            userImageView.layer.cornerRadius = userImageView.bounds.width / 2.0
            userImageView.layer.masksToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
          if let user = NCMBUser.current() {

              userDisplayNameLabel.text = user.object(forKey: "displayName") as? String
              userIntroductionTextView.text = user.object(forKey: "introduction") as? String
              self.navigationItem.title = user.userName

          let file = NCMBFile.file(withName: user.objectId, data: nil) as! NCMBFile
          file.getDataInBackground { (data, error) in
              if error != nil{
                  print(error)
              }else{
                  if data != nil {
                      let image = UIImage(data: data!)
                      self.userImageView.image = image
                  }
              }
          }

          }else{
              //NCMBuser == nil
             let storyboard = UIStoryboard(name: "SignIn", bundle: Bundle.main)
             let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootNavigationController")
             UIApplication.shared.keyWindow?.rootViewController = rootViewController
             //ログアウト状態の保持
             let ud = UserDefaults.standard
             ud.set(false, forKey: "isLogin")
             ud.synchronize()

          }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
    @IBAction func showMenu(_ sender: Any) {
        
           let alertController = UIAlertController(title: "メニュー", message: "メニューを選択してください", preferredStyle: .actionSheet)
           let signOutAction = UIAlertAction(title: "ログアウト", style: .default) { (action) in
               NCMBUser.logOutInBackground { (error) in
                   if error != nil {
                       print(error)
                   }else{
                       //ログアウト成功
                       let storyboard = UIStoryboard(name: "SignIn", bundle: Bundle.main)
                       let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootNavigationController")
                       UIApplication.shared.keyWindow?.rootViewController = rootViewController
                       //ログアウト状態の保持
                       let ud = UserDefaults.standard
                       ud.set(false, forKey: "isLogin")
                       ud.synchronize()
                       
                   }
               }
           }
           
           let deleteAction = UIAlertAction(title: "退会", style: .default) { (action) in
               let user = NCMBUser.current()
               user?.deleteInBackground(){ (error) in
                   if error != nil{
                       print(error)
                       
                   }else{
                       //ログアウト成功
                       let storyboard = UIStoryboard(name: "SignIn", bundle: Bundle.main)
                       let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootNavigationController")
                       UIApplication.shared.keyWindow?.rootViewController = rootViewController
                       //ログアウト状態の保持
                       let ud = UserDefaults.standard
                       ud.set(false, forKey: "isLogin")
                       ud.synchronize()
    
                   }
               }
           }
           let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { (action) in
               alertController.dismiss(animated: true, completion: nil)
           }
           alertController.addAction(signOutAction)
           alertController.addAction(deleteAction)
           alertController.addAction(cancelAction)
           
           self.present(alertController, animated: true,completion: nil)
           
       }
    

}
