import Foundation

struct Movie:Decodable {
    var id:Int
    var title:String
    var poster_path:String
    var release_date:String
}

struct MoviePage:Decodable {
    var page: Int
    var results:[Movie]
}
