//
//  RMMovies.swift
//  MoviesApp
//
//  Created by Developer on 5/2/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation
import  RealmSwift

class RMMovie: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var poster_path: String = ""
    @objc dynamic var release_date: String = ""
}


