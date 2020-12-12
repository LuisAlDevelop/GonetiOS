import UIKit

class ItemViewController: UIViewController {
    
    var item: ItemMovie!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("pelicula: \(item.title!)")
    }

}
