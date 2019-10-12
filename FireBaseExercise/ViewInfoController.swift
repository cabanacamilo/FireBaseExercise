//
//  ViewInfoController.swift
//  FireBaseExercise
//
//  Created by Camilo Cabana on 10/11/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit
import Firebase

var users = [User]()

class ViewInfoController: UIViewController {
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var password: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getAllIfo()
        
        email.text = Auth.auth().currentUser?.email
        
    }
    
    func getAllIfo() {
        let db = Firestore.firestore()
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                var user = User(email: "", password: "")
                for document in querySnapshot!.documents {
                    user.email = document.data()["email"] as! String
                    user.password = document.data()["password"] as! String
                    users.append(user)
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signOutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            print("sign out")
            navigationController?.popToRootViewController(animated: true)
        } catch { print("could not sign out")}
    }
    
}
