//
//  FavoriteViewController.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 18/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FavoriteViewController: UIViewController {
    
    private let tableView = UITableView()
    private let cellIdentifier = "cellIdentifier"
    
    //var inSearchMode = false
    //Mover para a viewModel
    let serviceAPI = ItemServiceImpl()
    private let disposeBag = DisposeBag()
    
    private let searchController: UISearchController = {
           let searchController = UISearchController(searchResultsController: nil)
           searchController.searchBar.placeholder = "Search Movies"
           return searchController
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureProperties()
        configureLayout()
        configureReactiveBinding()
        
    }
    
    private func configureProperties() {
           tableView.register(ITunnesTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
           navigationItem.searchController = searchController
           navigationItem.title = "Movies Collection"
           navigationItem.hidesSearchBarWhenScrolling = false
           navigationController?.navigationBar.prefersLargeTitles = true
       }

       private func configureLayout() {
           tableView.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(tableView)
           NSLayoutConstraint.activate([
               tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
               tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
               tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
           ])
           tableView.contentInset.bottom = view.safeAreaInsets.bottom
       }
       

       private func configureReactiveBinding() {
           
           searchController.searchBar.rx.text.orEmpty
           .flatMapLatest { text in
            self.serviceAPI.searchMovie(searchText: text)
           }
           .bind(to: tableView.rx.items(cellIdentifier: cellIdentifier)) { index, model, cell in
               cell.textLabel?.text = model.trackName
               cell.detailTextLabel?.text = model.primaryGenreName
               cell.textLabel?.adjustsFontSizeToFitWidth = true
             //cell.detailTextLabel?.adjustsFontSizeToFitWidth = true
               print(model)
           }
           .disposed(by: disposeBag)
           
       }
}
