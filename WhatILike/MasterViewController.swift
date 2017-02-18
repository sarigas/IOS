//
//  MasterViewController.swift
//  WhatILike
//
//  Created by Guest User on 18/02/17.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit

extension MasterViewController: changeValueDelegate {
    func updateData(data: FruitModel) {
        let f4 = FruitModel.init(fname: data.fname, fphoto: UIImage(named : "image1"), fsubtitle: data.fsubtitle, fdescription: data.fdescription)
        self.itemArray.append(f4)
        self.tableView.reloadData()
    }
}



class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    
    
    
    
    let f1 = FruitModel.init(fname: "Apple", fphoto: UIImage(named : "image1"), fsubtitle: "RED", fdescription: "Good for health.")
    let f2 = FruitModel.init(fname: "Orange", fphoto: UIImage(named : "image1"), fsubtitle: "ORANGE", fdescription: "Good for health.")
    let f3 = FruitModel.init(fname: "Grapes", fphoto: UIImage(named : "image1"), fsubtitle: "PURPLE", fdescription: "Good for health.")
    
    
      var itemArray = [(FruitModel)]()

    @IBOutlet weak var itemAdd: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        itemArray.append(f1)
        itemArray.append(f2)
        itemArray.append(f3)
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.fruit = itemArray[(indexPath.row)]
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }else if segue.identifier == "addIdentifier"{
            (segue.destination as! AddItemViewController).delegate = self
            
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell

        let data = itemArray[indexPath.row]
        // Configure the cell...
        
        cell?.fname.text = data.fname
        cell?.fTitle.text = data.fsubtitle
        cell?.fImage.image = data.fphoto
        return cell!
        
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

