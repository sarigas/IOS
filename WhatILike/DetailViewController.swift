//
//  DetailViewController.swift
//  WhatILike
//
//  Created by Guest User on 18/02/17.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    
    var fruit : FruitModel?
    @IBOutlet weak var fImage: UIImageView!
    @IBOutlet weak var fDesc: UILabel!
    @IBOutlet weak var fTitle: UILabel!
    @IBOutlet weak var fName: UILabel!
    @IBOutlet weak var fname: UILabel!
    @IBOutlet weak var ftitle: UILabel!
    @IBOutlet weak var fdesc: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        fname.text = fruit?.fname
        fdesc.text = fruit?.fdescription
        fImage.image = fruit?.fphoto
        ftitle.text = fruit?.fsubtitle

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

