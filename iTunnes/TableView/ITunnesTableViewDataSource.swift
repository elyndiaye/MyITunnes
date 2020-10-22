//
//  ITunnesTableViewDataSource.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 20/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

final class ITunnesTableViewDataSource: NSObject, UITableViewDataSource{
    
    var items:[ItunesResult]
    
    init(items: [ItunesResult], tableView: UITableView){
        self.items = items
        
        super.init()
        setupTableView(tableView)
    }
    
    private func setupTableView(_ tableView: UITableView) {
        tableView.register(cellType: ITunnesTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath,
                                                 cellType: ITunnesTableViewCell.self)
      let item = items[indexPath.row]
        //cell.configureCell(item: item)
        return cell
    }
}
