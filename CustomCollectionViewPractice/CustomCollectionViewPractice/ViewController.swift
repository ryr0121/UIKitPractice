//
//  ViewController.swift
//  CustomCollectionViewPractice
//
//  Created by 김초원 on 2023/10/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }

    func setupCollectionView() {
        // CollectionView를 사용하기 위한 필수 프로토콜 채택
        collectionView.dataSource = self
        collectionView.delegate = self
        // CollectionView에 사용할 커스텀 셀 등록
        collectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // CollectionView에 보여질 셀의 개수 반환
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // CollectionView에 보여질 셀 반환
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 셀의 크기 반환
        return CGSize(width: 100, height: 100)
    }
}

