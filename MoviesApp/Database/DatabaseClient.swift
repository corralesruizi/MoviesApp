import Foundation
import RealmSwift


class DatabaseClient
{
    //TODO add some mapppers
    static var sharedInstance = DatabaseClient()
    
    private init(){}
    
    private var realmDb: Realm {
        return try! Realm()
    }
    
    func Save(movies: [Movie])
    {
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
            return object.asDomain()
        }
    }
    
}
