import UIKit

final class PhotoCollectionView: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = Metrics.defaultCollectionViewEdgeInsets
        layout.itemSize = Metrics.defaultCollectionViewSize
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = Metrics.defaultColorView
        collectionView.alwaysBounceVertical = true
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private let city = City.cities
    
    override func loadView() {
        self.view = self.collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MyPhotos"
    }
}

extension PhotoCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let city = self.city[indexPath.row]
        detailVC.currentPhoto = UIImage(named: city.image) ?? UIImage.init()
        detailVC.cityImageView.image = detailVC.currentPhoto
        detailVC.cityName.text = city.name
        detailVC.cityInfo = city.description
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension PhotoCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        cell.image = self.city[indexPath.item]
        
        return cell
    }
}
