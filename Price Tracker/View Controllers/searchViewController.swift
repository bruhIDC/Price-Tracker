//
//  searchViewController.swift
//  Price Tracker
//
//  Created by Chris lin on 3/15/18.
//  Copyright © 2018 bruhIDC. All rights reserved.
//

import UIKit

class searchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    var products: [Product]!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if products != nil {
            return products!.count
        } else {
            return 0
        }
    }
    
    table

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
