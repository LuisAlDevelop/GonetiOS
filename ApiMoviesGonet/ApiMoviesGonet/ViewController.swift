import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    
    @IBOutlet weak var tableItems: UITableView!
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
        
        /*is commented because the first view dosent show nothing
        listItems.append(ItemMovie(title: "mario", vote_average: "vote")) //this is listItems search a principal
        listItems.append(ItemMovie(title: "marco", vote_average: "vote"))
        
        listItemsSearch = listItems*/
        
        //addedListMoview(idList: FAVORITE)
        
        NetworkManager().getDatos(idList: FAVORITE)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItemsSearch.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableItems.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item: ItemMovie
        item = listItemsSearch[indexPath.row]
        
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
                let itemSelected = listItemsSearch[item.row]
                let destino = segue.destination as! ItemViewController
                destino.item = itemSelected
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        listItemsSearch = listItems.filter({ (item) -> Bool in
            switch searchItem.selectedScopeButtonIndex {
            case 0:
                if searchText.isEmpty {return true}
                return (item.title?.lowercased().contains(searchText.lowercased()))!
            case 1:
                if searchText.isEmpty {return true}
                return (item.title?.lowercased().contains(searchText.lowercased()))!
            case 2:
                if searchText.isEmpty {return true}
                return (item.title?.lowercased().contains(searchText.lowercased()))!
            default:
                return false
            }
        })
        DispatchQueue.main.async {
            self.tableItems.reloadData()
        }
        
        /*guard !searchText.isEmpty else {
            listItemsSearch = listItems
            DispatchQueue.main.async {
                self.tableItems.reloadData()
            }
            return
        }
        
        listItemsSearch = listItems.filter({ (item) -> Bool in
            (item.title?.lowercased().contains(searchText.lowercased()))!
        })
        DispatchQueue.main.async {
            self.tableItems.reloadData()
        }*/
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            addedListMovie(idList: FAVORITE)
        case 1:
            addedListMovie(idList: RECOMMENDATIONS)
        case 2:
            addedListMovie(idList: RATED)
        default:
            print("nothing")
        }
        DispatchQueue.main.async{
            self.tableItems.reloadData()
        }
    }
    
    func addedListMovie(idList: String){
        self.listItemsSearch.removeAll()
        self.listItems.removeAll()
        
        if idList == FAVORITE {
            self.searchItem.text = ""
            self.listItems.append(ItemMovie(title: "mario", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "marco", vote_average: "vote"))
            self.listItemsSearch = self.listItems
            self.tableItems.reloadData()
        } else if idList == RECOMMENDATIONS {
            self.searchItem.text = ""
            self.listItems.append(ItemMovie(title: "mario", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "marco", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "mario", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "marco", vote_average: "vote"))
            self.listItemsSearch = self.listItems
            self.tableItems.reloadData()
        }else if idList == RATED {
            self.searchItem.text = ""
            self.listItems.append(ItemMovie(title: "mario", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "marco", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "mario", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "marco", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "mario", vote_average: "vote"))
            self.listItems.append(ItemMovie(title: "marco", vote_average: "vote"))
            self.listItemsSearch = self.listItems
            self.tableItems.reloadData()
        }
    }
    
}

