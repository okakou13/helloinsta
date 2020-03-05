//
//  SignInViewController.swift
//  instaSample2
//
//  Created by 岡田昂典 on 2020/03/05.
//  Copyright © 2020 Kosuke Okada. All rights reserved.
//

import UIKit
import NCMB

class SignInViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func signIn(_ sender: Any) {
        
        if (userIdTextField.text?.utf16.count)! > 0 && (passwordTextField.text?.utf16.count)! > 0 {
            
            NCMBUser.logInWithUsername(inBackground: userIdTextField.text!, password: passwordTextField.text!){ (user, error) in
                
                if error != nil {
                    print(error)
                }else{
                    //登録成功
                    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootTabBarController")
                    UIApplication.shared.keyWindow?.rootViewController = rootViewController
                    
                    let ud = UserDefaults.standard
                    ud.set(true, forKey: "isLogin")
                    ud.synchronize()
                    
                }
            }
            
        }
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
    }
    
    
    
}
