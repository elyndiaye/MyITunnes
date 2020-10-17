//
//  ViewController.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 17/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel =  iTunnesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Call")
        viewModel.getDataFromAPI { (item) in
            print(item)
        }
    }


}

