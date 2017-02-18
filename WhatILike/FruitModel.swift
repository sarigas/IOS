//
//  FruitModel.swift
//  WhatILike
//
//  Created by Guest User on 18/02/17.
//  Copyright © 2017 Guest User. All rights reserved.
//

import Foundation
import UIKit

class FruitModel {
    
    var fname: String
    var fphoto: UIImage?
    var fsubtitle: String
    var fdescription: String
    
    init(fname: String, fphoto: UIImage?, fsubtitle: String, fdescription: String) {
        
        self.fname = fname
        self.fphoto = fphoto
        self.fsubtitle = fsubtitle
        self.fdescription = fdescription
        
    }
    
    
}
