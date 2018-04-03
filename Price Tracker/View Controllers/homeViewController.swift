//
//  homeViewController.swift
//  Price Tracker
//
//  Created by Chris lin on 3/15/18.
//  Copyright © 2018 bruhIDC. All rights reserved.
//

import UIKit
import AlamofireImage
import Firebase

class homeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var items: [Item]! = []

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.rowHeight = 200
        tableView.delegate = self
        tableView.dataSource = self
        loadItem()
        
    }
    
    func loadItem(){
        let ref = Database.database().reference().child("users").child((Auth.auth().currentUser?.uid)!).child("products")
        ref.observe(.childAdded){(snapshot: DataSnapshot) in
            if let dict = snapshot.value as? [String: Any]{
                
                let imgURL = dict["img"] as! String
                let price = "$" + (dict["price"] as! String)
                let productName = dict["productName"] as! String
                let itemURL = dict["url"] as! String
                let i = Item(name: productName, price: price, imgURL: imgURL, itemURL: itemURL)
                self.items.append(i)
                //print(i.productName)
                self.tableView.reloadData()
            }
            /*for i in self.items{
                print(i.productName)
            }*/
        }
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items != nil {
            return items.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! itemCell
        let i = self.items[indexPath.row]
        cell.item = i
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                let item = items[indexPath.row]
                let pdvc = segue.destination as! productDetailViewController
                pdvc.product = item
            }
        }
    }

    @IBAction func onLogout(_ sender: Any) {
        try! Auth.auth().signOut()
        print("Signed Out")
        performSegue(withIdentifier: "logoutSegue", sender: nil)
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
