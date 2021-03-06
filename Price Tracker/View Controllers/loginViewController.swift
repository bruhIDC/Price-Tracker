//
//  loginViewController.swift
//  Price Tracker
//
//  Created by Chris lin on 3/27/18.
//  Copyright © 2018 bruhIDC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class loginViewController: UIViewController{
    
    let emptyAlertController = UIAlertController(title: "Error", message: "Please fill all fields", preferredStyle: .alert)
    let credentialAlertController = UIAlertController(title: "Error", message: "Incorrect e-mail or password", preferredStyle: .alert)
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil{
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: {(timer) in
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            })
        }
        emptyAlertController.addAction(OKAction)
        credentialAlertController.addAction(OKAction)
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onLogin(_ sender: Any) {
        let email = usernameField.text!
        let password = passwordField.text!
        if ((usernameField.text?.isEmpty)! || (passwordField.text?.isEmpty)!){
            present(emptyAlertController, animated: true) {
                // optional code for what happens after the alert controller has finis ma
            }
        }
        
        Auth.auth().signIn(withEmail: email, password: password){ (user,error) in
            if user != nil{
                print("successfully signed in")
                self.usernameField.text = ""
                self.passwordField.text = ""
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(error!.localizedDescription)")
                self.present(self.credentialAlertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let email = usernameField.text!
        let password = passwordField.text!
        if ((usernameField.text?.isEmpty)! || (passwordField.text?.isEmpty)!){
            present(emptyAlertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        }
        
        
        Auth.auth().createUser(withEmail: email, password: password){ user, error in
            if error == nil && user != nil {
                print("User created")
                //let uid = user?.uid
                self.usernameField.text = ""
                self.passwordField.text = ""
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(error!.localizedDescription)")
            }
            
        }
    
    }
    
    
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
