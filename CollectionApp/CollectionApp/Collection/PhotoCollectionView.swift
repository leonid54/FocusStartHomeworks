import UIKit

final class PhotoCollectionView: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
          layout.sectionInset = UIEdgeInsets(top: -10, left: 10, bottom: 10, right: 10)
          layout.itemSize = CGSize(width: 200, height: 200)
          layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = Metrics.defaultColorView
        collectionView.alwaysBounceVertical = true
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
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
        let moreInfoVC = MoreInfoViewController()
        let city = City.cities[indexPath.row]
        detailVC.currentPhoto = UIImage(named: city.image) ?? UIImage.init()
        detailVC.cityImageView.image = detailVC.currentPhoto
        detailVC.cityName.text = city.name
        moreInfoVC.infoLabel.text = city.description
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension PhotoCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return City.cities.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        let city = City.cities[indexPath.row]
        cell.cityImageView.image = UIImage(named: city.image)
        cell.cityNameLabel.text = city.name

        return cell
    }
}
