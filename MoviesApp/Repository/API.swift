import Foundation

let apiKey:String="57f54862e676afed9e702084fa192854"

func GetMovies(completionBlock:@escaping([Movie])->Void)->Void
{
    let jsonUrl = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=1"
    
    guard let url = URL(string: jsonUrl) else {return}
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        guard let data = data else {return}
        
        do{
            let moviePage = try JSONDecoder().decode(MoviePage.self, from: data)
            completionBlock(moviePage.results)
            
        }catch let jsonError{
            print(jsonError)
        }
        
        }.resume()
}

func GetPoster(posterUrl:String,completionBlock:@escaping(Data)->Void)->Void
{
    let jsonUrl = "https://image.tmdb.org/t/p/w185\(posterUrl)"
    print(jsonUrl)
    
    guard let url = URL(string: jsonUrl) else {return}

    URLSession.shared.dataTask(with: url) { (data, response, error) in

        guard let data = data else {return}
        completionBlock(data)
    
        }.resume()
}
