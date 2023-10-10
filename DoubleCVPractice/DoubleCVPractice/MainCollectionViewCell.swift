//
//  MainCollectionViewCell.swift
//  Practice
//
//  Created by 김초원 on 2023/10/10.
//

import UIKit
import SnapKit
import Then

class MainCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainCollectionViewCell"
    
    var subCollectionView: UICollectionView!
    var containerView = UIView().then { $0.backgroundColor = .white }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        
        self.contentView.addSubview(containerView)
        containerView.addSubview(subCollectionView)
        
        containerView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        
        subCollectionView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView() {
        subCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: 100, height: 100)
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 10

            $0.collectionViewLayout = flowLayout
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .systemBlue

            $0.showsHorizontalScrollIndicator = false

            $0.decelerationRate = .fast
            $0.isPagingEnabled = false

            $0.register(SubCollectionViewCell.self, forCellWithReuseIdentifier: SubCollectionViewCell.identifier)
        }
    }
}

extension MainCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubCollectionViewCell.identifier, for: indexPath) as? SubCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}
