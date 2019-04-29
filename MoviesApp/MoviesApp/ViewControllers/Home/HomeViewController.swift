import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var moviesCollecionView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setCollectionProperties()
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
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            return collectionView.dequeueReusableCell(withReuseIdentifier:
                MoviePosterCollectionViewCell.cellKey, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = UIScreen.main.bounds.width/2
        let itemHeight = itemWidth*(277/185)
        return CGSize(width:itemWidth, height: itemHeight)
    }
}
