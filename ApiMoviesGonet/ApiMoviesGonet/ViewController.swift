//
//  ViewController.swift
//  ApiMoviesGonet
//
//  Created by Gisabella Rangel on 08/12/20.
//  Copyright © 2020 Swyboard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var tableItems: UITableView!
    @IBOutlet weak var controlCategory: UISegmentedControl!
    @IBOutlet weak var searchItem: UISearchBar!
    
    
    var listItems = [ItemMovie] ()
    var listItemsSearch = [ItemMovie] ()
    let FAVORITE = "7067988"
    let RECOMMENDATIONS = "7067993"
    let RATED = "7067994"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableItems.delegate = self
        tableItems.dataSource = self
        
        //addedListMoview(idList: FAVORITE)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableItems.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item: ItemMovie
        item = listItems[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.vote_average
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detalle", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detalle" {
            if let item = tableItems.indexPathForSelectedRow {
                let itemSelected = listItems[item.row]
                let destino = segue.destination as! ItemViewController
                destino.item = itemSelected
            }
        }
    }
    
    
    @IBAction func controlButton(_ sender: Any) {
        if controlCategory.selectedSegmentIndex == 0 {
            addedListMovie(idList: FAVORITE)
            print("Favorite")
        }else if controlCategory.selectedSegmentIndex == 1 {
            addedListMovie(idList: RECOMMENDATIONS)
            print("Recommendations")
        }else {
            addedListMovie(idList: RATED)
            print("Rated")
        }
    }
    
    func addedListMovie(idList: String){
        self.listItems.removeAll()
        
        if idList == FAVORITE {
            self.listItems.append(ItemMovie(title: "mario", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "marco", vote_average: "vote"))
            self.tableItems.reloadData()
        } else if idList == RECOMMENDATIONS {
            self.listItems.append(ItemMovie(title: "mario", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "marco", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "mario", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "marco", vote_average: "vote"))
            self.tableItems.reloadData()
        }else if idList == RATED {
            self.listItems.append(ItemMovie(title: "mario", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "marco", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "mario", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "marco", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "mario", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "marco", vote_average: "vote"))
            self.tableItems.reloadData()
        }
        
    }
    
}

