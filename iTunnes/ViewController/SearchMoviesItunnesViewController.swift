//
//  SearchMoviesItunnesViewController.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 21/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchMoviesItunnesViewController: UIViewController {
    let screenList = SearchITunnesView()
    //var viewModel =  iTunnesViewModel()
    
    private let cellIdentifier = "ITunnesTableViewCell"
    
    //Mover para a viewModel
    let serviceAPI = ItemServiceImpl()
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        super.loadView()
        self.view = screenList
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureProperties()
        configureReactiveBinding()
    }
    
    private func configureProperties() {
        screenList.search.placeholder = "Search Movies Itunnes"
        screenList.table.register(UINib(nibName: "ITunnesTableViewCell", bundle: nil), forCellReuseIdentifier: "ITunnesTableViewCell")
        //navigationItem.searchController = searchController
        navigationItem.title = "Itunnes Movies"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    private func configureReactiveBinding() {
        
        screenList.search.rx.text.orEmpty
            .flatMapLatest { text in
                self.serviceAPI.searchMovie(searchText: text)
        }
        .bind(to: screenList.table.rx.items(cellIdentifier: cellIdentifier,cellType: ITunnesTableViewCell.self)) { index, model, cell in
            cell.nameLbl?.text = model.trackName
            cell.musicLbl?.text = model.primaryGenreName
            cell.nameLbl?.adjustsFontSizeToFitWidth = true
            cell.musicLbl?.adjustsFontSizeToFitWidth = true
        }
        .disposed(by: disposeBag)
        
    }
    
}
