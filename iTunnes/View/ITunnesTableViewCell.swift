//
//  ITunnesTableViewCell.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 20/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit
import Reusable

class ITunnesTableViewCell: UITableViewCell, NibReusable {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var musicLbl: UILabel!
    @IBOutlet weak var favoriteBtn: UIButton!
    
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
