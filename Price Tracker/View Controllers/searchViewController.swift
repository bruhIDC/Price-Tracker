//
//  searchViewController.swift
//  Price Tracker
//
//  Created by Chris lin on 3/15/18.
//  Copyright © 2018 bruhIDC. All rights reserved.
//

import UIKit
import Firebase

class searchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    var products: [Product]!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 198
        searchBar.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if products != nil {
            return products!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! searchCell
        
        cell.product = products[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let searchItem = searchText.replacingOccurrences(of: " ", with: "%20")
        
        if searchItem.count > 3 {
            
            APIManager().getItems(searchQuery: searchItem) { (products: [Product]?, error: Error?) in
                self.products = products
                self.tableView.reloadData()
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let p = products[indexPath.row]
        /*let prod = [
            "productName": p.productName,
            "price": p.price,
            "id": p.id,
            "img": p.imgStringURL,
            "url": p.itemURL
        
        ]*/
        let ref = Database.database().reference()
        let rref = ref.child("users").child((Auth.auth().currentUser?.uid)!).child("products").child(p.id)
        rref.setValue(["productName": p.productName,
                       "price": p.price!,
                       "img": p.imgStringURL!,
                       "url": p.itemURL])
        
        navigationController?.popViewController(animated: true)

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
