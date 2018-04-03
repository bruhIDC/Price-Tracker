//
//  productDetailViewController.swift
//  Price Tracker
//
//  Created by Chris lin on 3/15/18.
//  Copyright © 2018 bruhIDC. All rights reserved.
//

import UIKit

class productDetailViewController: UIViewController {
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var price: UILabel!
    
    var product: Item!
    @IBAction func openURL(_ sender: Any) {
        UIApplication.shared.open(URL(string: product.itemURL!)!, options: [:])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        price.text = product.price
        if product.imgStringURL != nil{
            productImg.af_setImage(withURL: URL(string: product.imgStringURL!)!)
        }
        // Do any additional setup after loading the view.
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
