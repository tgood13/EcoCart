//
//  CartViewController.swift
//  EcoCart
//
//  Created by Troy Good on 2/2/20.
//  Copyright © 2020 tgood. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  @IBOutlet weak var totalGHG: UILabel!
  
  @IBAction func calculateGHG(_ sender: UIButton) {
    
      let foodData = ["Lamb": 39.2, "Beef":27.0, "Cheese": 13.5, "Pork":12.1, "Farmed Salmon":11.9, "Turkey":10.9, "Chicken":6.9, "Canned Tuna":6.1, "Eggs":4.8, "Potatoes":2.9, "Rice":2.7, "Peanut Butter":2.5, "Nuts": 2.3, "Yogurt":2.2, "Broccoli":2.0, "Tofu":2.0, "Dry Beans":2.0, "Milk (2%)":1.9, "Tomatoes":1.1, "Lentils":0.9]
    
    var totalGHGnum = 0.0
    
    let cells = self.tableView.visibleCells as! Array<CartViewCell>

    for cell in cells {
      let num = Double(cell.quantityInput.text!)
      
      totalGHGnum = totalGHGnum + (num!)*(foodData[String(cell.foodTitle.text!)]!)/1000
    }
    
    totalGHG.text = String(format: "%0.2f", totalGHGnum)
  }
  
  let foods = ["Beef", "Lamb", "Cheese", "Pork", "Farmed Salmon", "Turkey", "Chicken", "Canned Tuna", "Eggs",
  "Potatoes", "Rice", "Peanut Butter", "Nuts", "Yogurt", "Broccoli", "Tofu", "Dry Beans", "Milk (2%)",
  "Tomatoes", "Lentils"]
  

  
  var tableFoods = [] as [String]
  

    override func viewDidLoad() {
        super.viewDidLoad()
      for (key,value) in UserDefaults.standard.dictionaryRepresentation() {
        if foods.contains(key) {
          tableFoods.append(key)
        }
      }
      tableView.dataSource = self
      tableView.delegate = self
      
      

        // Do any additional setup after loading the view.
    }

  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableFoods.count
  }

  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartViewCell
    
    cell.foodTitle.text = tableFoods[indexPath.row]
    
    
    return cell
  }
  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
