//
//  ViewController.swift
//  EcoCart
//
//  Created by Troy Good on 2/1/20.
//  Copyright © 2020 tgood. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

  @IBOutlet weak var collectionView: UICollectionView!
  
   let selected = UserDefaults.standard

  let foods = ["Beef", "Lamb", "Cheese", "Pork", "Farmed Salmon", "Turkey", "Chicken", "Canned Tuna", "Eggs",
  "Potatoes", "Rice", "Peanut Butter", "Nuts", "Yogurt", "Broccoli", "Tofu", "Dry Beans", "Milk (2%)",
  "Tomatoes", "Lentils"]
  
  
  override func viewDidLoad() {
    
    UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)

    UserDefaults.standard.synchronize()
    
    
    // Do any additional setup after loading the view.
    collectionView.delegate = self 
    collectionView.dataSource = self
    
    //Handles the layout of the movie grid cells
    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    
    layout.minimumLineSpacing = 4
    layout.minimumInteritemSpacing = 4
    let height = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
    //makes the height bigger than the width
    layout.itemSize = CGSize(width: height*1.5, height: height-40)
    
    collectionView.reloadData()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return foods.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
    
    cell.foodTitle.text = foods[indexPath.item]
    cell.foodImage.image = UIImage(named: cell.foodTitle.text!)
    
    
    return cell
  
  }

  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    var cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
    

    
  }
  

  func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
      let item = collectionView.cellForItem(at: indexPath)
      if item?.isSelected ?? false {
          collectionView.deselectItem(at: indexPath, animated: true)
        cell.backgroundColor = UIColor.black
        //selected.set(false, forKey: cell.foodTitle.text!)
        selected.removeObject(forKey: cell.foodTitle.text!)
        
      } else {
          collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        
        selected.set(true, forKey: cell.foodTitle.text!)
        cell.backgroundColor = UIColor.brown
          return true
      }

      return false
  }

  

  
}
