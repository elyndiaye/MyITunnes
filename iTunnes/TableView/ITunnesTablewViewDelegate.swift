//
//  ITunnesTablewViewDelegate.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 20/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

final class ITunnesTablewViewDelegate: NSObject, UITableViewDelegate{
    weak var delegate: ITunnesSelectionDelegate?
    let items:[ItunesResult]
                        
    init(items: [ItunesResult], delegate: ITunnesSelectionDelegate){
        self.items = items
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let item = items[indexPath.row]
        //cell.configureCell(item: item)
        delegate?.didSelect(item: item)
    }
    
}
