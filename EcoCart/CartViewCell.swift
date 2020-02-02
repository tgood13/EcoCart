//
//  CartViewCell.swift
//  EcoCart
//
//  Created by Troy Good on 2/2/20.
//  Copyright © 2020 tgood. All rights reserved.
//

import UIKit

class CartViewCell: UITableViewCell {

  @IBOutlet weak var foodTitle: UILabel!
  
  @IBOutlet weak var quantityInput: UITextField!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
