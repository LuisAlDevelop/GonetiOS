//
//  ItemViewController.swift
//  ApiMoviesGonet
//
//  Created by Gisabella Rangel on 09/12/20.
//  Copyright © 2020 Swyboard. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    var item: ItemMovie!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("pelicula: \(item.title!)")
    }

}
