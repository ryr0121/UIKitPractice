//
//  ViewController.swift
//  DoubleCVPractice
//
//  Created by 김초원 on 2023/10/10.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupView()
    }


    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: self.view.frame.width, height: 100)
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 10

            $0.collectionViewLayout = flowLayout
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .yellow

            $0.showsHorizontalScrollIndicator = false

            $0.decelerationRate = .fast
            $0.isPagingEnabled = false

            $0.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        }
    }
    
    func setupView() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    
}
