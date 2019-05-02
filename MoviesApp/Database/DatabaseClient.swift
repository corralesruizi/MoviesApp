import Foundation
import RealmSwift


final class DatabaseClient
{
    
    private var realmDb: Realm {
        return try! Realm()
    }
    
    func Save(movies: [RMMovie])
    {
        dispar
        try! realmDb.write {
            movies.forEach { rmmovie in
                let object = RMMovie()
                object.id = rmmovie.id
                object.title = rmmovie.title
                object.poster_path = rmmovie.poster_path
                realmDb.add(object, update: true)
            }
        }
    }
    
    func get() -> [Movie] {
        
        return realmDb.objects(RMMovie.self).map { object in
            return Movie(id: object.id,
                         title: object.title,
                         poster_path: object.poster_path,
                         release_date: object.release_date)
        }
    }
    
}
