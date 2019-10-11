//
//  ViewController.swift
//  FireBaseExercise
//
//  Created by Camilo Cabana on 10/11/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { authResult, error in
          // ...
            if error != nil {
                print("error creating a user")
            } else {
                let db = Firestore.firestore()
                // Add a new document with a generated ID
                var ref: DocumentReference? = nil
                ref = db.collection("users").addDocument(data: [
                    "email": self.email.text as Any,
                    "password": self.password.text as Any,
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                    let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ViewInfoController") as! ViewInfoController
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                print("user created")
            }
        }
    }
    
    @IBAction func signIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { authResult, error in
            if error != nil {
                print("error signing In")
            } else {
                print("sign in")
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ViewInfoController") as! ViewInfoController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
          // ...
        }
    }
    
}

