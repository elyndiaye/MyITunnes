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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
