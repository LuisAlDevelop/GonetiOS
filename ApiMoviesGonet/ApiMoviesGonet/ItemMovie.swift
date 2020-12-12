import Foundation

class ItemMovie {
    
    var title: String? = ""
    var vote_average: String? = ""
    
    init(title: String?, vote_average: String?) {
        self.title = title
        self.vote_average = vote_average
    }
}
