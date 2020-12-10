//
//  ItemMovie.swift
//  ApiMoviesGonet
//
//  Created by Gisabella Rangel on 08/12/20.
//  Copyright © 2020 Swyboard. All rights reserved.
//

import Foundation

class ItemMovie {
    
    var title: String?
    var vote_average: String?
    
    init(title: String?, vote_average: String?) {
        self.title = title
        self.vote_average = vote_average
    }
}
