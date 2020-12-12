import Foundation

class NetworkManager {
    
    var itemsMovie = ItemsMoviesService()
    let baseURL = "https://api.themoviedb.org/3/list/"
    
    func getDatos(idList: String){
        let urlList = "\(baseURL)\(idList)?api_key=af450155784ff0291961f140eef63b99&language=en-US"
        let url = URL(string: urlList)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                self.itemsMovie = try JSONDecoder().decode(ItemsMoviesService.self, from: data!)
                print("mmmmmmm \(self.itemsMovie) ")
            }catch {
                print("Error al conectar")
            }
            
        }.resume()
    }
    
    
}
