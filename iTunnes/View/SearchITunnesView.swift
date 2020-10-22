//
//  SearchITunnesView.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 19/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


final class SearchITunnesView: UIView{
    
    lazy var search: UISearchBar = {
           let view = UISearchBar()
           return view
       }()
    
    lazy var table: UITableView = {
        let view = UITableView()
        view.separatorStyle = .singleLine
        return view
    }()
    
    lazy var load: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: .zero)
        view.color = .black
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SearchITunnesView: CodeView{
    func buildViewHierarchy() {
        addSubview(search)
        addSubview(table)
        addSubview(load)
        bringSubviewToFront(load)
    }
    
    func setupConstraints() {
        search.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            make.right.left.equalToSuperview()
        }
        
        table.snp.makeConstraints { make in
            make.top.equalTo(search.snp_bottomMargin)
            make.right.left.bottom.equalToSuperview()
        }
        
        load.snp.makeConstraints { (make) in
            make.right.left.top.bottom.equalToSuperview()
        }
        
    }
    
    func setupAdditionalConfiguration() {
        //Setup adicional
    }
    
}

