//
//  Protocol.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 20/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

protocol ExchangeDelegate: class {
    func pressFromBtn()
    func pressToBtn()
    func ExchangeBtn()
}

protocol ITunnesSelectionDelegate: class {
    func didSelect(item: ItunesResult)
}
