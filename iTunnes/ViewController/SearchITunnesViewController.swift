//
//  ViewController.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 17/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchITunnesViewController: UIViewController {
    
    let screenList = SearchITunnesView()
    var tableViewDataSource: ITunnesTableViewDataSource?
    var tableViewDelegate: ITunnesTablewViewDelegate?
    //var viewModel =  iTunnesViewModel()
    
    private let tableView = UITableView()
    private let cellIdentifier = "cellIdentifier"
    
    //var inSearchMode = false
    //Mover para a viewModel
    let serviceAPI = ItemServiceImpl()
    private let disposeBag = DisposeBag()
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search Itunnes"
        return searchController
    }()
    
    override func loadView() {
          super.loadView()
          //self.view = screenList
        
      }

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
        navigationItem.title = "Itunnes Collection"
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
            self.serviceAPI.searchMusic(searchText: text)
        }
        .bind(to: tableView.rx.items(cellIdentifier: cellIdentifier)) { index, model, cell in
            cell.textLabel?.text = model.artistName
            cell.detailTextLabel?.text = model.primaryGenreName
            cell.textLabel?.adjustsFontSizeToFitWidth = true
            print(model)
        }
        .disposed(by: disposeBag)
        
    }
    
    //MARK: - SetupTableView
    func setupTableView(with item: [ItunesResult]){
        tableViewDataSource = ITunnesTableViewDataSource(items: item, tableView: screenList.table)
        //tableViewDelegate = ITunnesTablewViewDelegate(items: item)
        
        screenList.table.dataSource = tableViewDataSource
        screenList.table.delegate = tableViewDelegate
        screenList.table.reloadData()
    }


}

