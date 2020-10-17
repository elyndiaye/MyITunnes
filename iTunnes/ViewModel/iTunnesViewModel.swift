//
//  iTunnesViewModel.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 17/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

class iTunnesViewModel {
    
    typealias completionBlock = (ITunnes) -> ()
       var service: ItemService = ItemServiceImpl()
    
      // var filteredItems = [ItunesResult]()
       var currency : ItunesResult?
       
       func getDataFromAPI(completionBlock : @escaping completionBlock){
           
           service.getItens(){(result) in
               if case .success(let items) = result {
                print(result)
               // self.currency = items.results
                   completionBlock(items)
               }
           }
       }
    
}
