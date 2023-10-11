//
//  MainCollectionViewCell.swift
//  CustomCollectionViewPractice
//
//  Created by 김초원 on 2023/10/11.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    func setupLayout() {
        imgView.layer.borderWidth = 1.0
        imgView.layer.borderColor = UIColor.gray.cgColor
        imgView.layer.cornerRadius = 10
        titleLabel.text = "타이틀"
    }

}
