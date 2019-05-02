import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var moviesCollecionView: UICollectionView!
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionProperties()
        
        GetMovies {[weak self] (movies: [Movie]) in
            
            DispatchQueue.global(qos: .background).sync {
                DatabaseClient.sharedInstance.Save(movies: movies)
            }
            
            DispatchQueue.global(qos: .background).sync {
               let movies = DatabaseClient.sharedInstance.get()
                DispatchQueue.main.async {
                    self?.movies=movies
                    self?.moviesCollecionView.reloadData()
                }
            }
        }
        
    
        navigationController?.navigationBar.isTranslucent=false
        navigationController?.navigationBar.barTintColor = .black
        
    }

    func setCollectionProperties(){
        
        moviesCollecionView.register(MoviePosterCollectionViewCell.cellNib,
                                     forCellWithReuseIdentifier: MoviePosterCollectionViewCell.cellKey)
        moviesCollecionView.dataSource = self
        moviesCollecionView.delegate = self
    }
}

extension HomeViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                MoviePosterCollectionViewCell.cellKey, for: indexPath) as! MoviePosterCollectionViewCell
            
            cell.updateImage(imageUrl: movies[indexPath.row].poster_path)
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = UIScreen.main.bounds.width/2
        let itemHeight = itemWidth*(277/185)
        return CGSize(width:itemWidth, height: itemHeight)
    }
}
