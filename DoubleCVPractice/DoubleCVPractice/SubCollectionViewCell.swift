//
//  SubCollectionViewCell.swift
//  Practice
//
//  Created by 김초원 on 2023/10/10.
//

import UIKit

class SubCollectionViewCell: UICollectionViewCell {
    static let identifier = "SubCollectionViewCell"

    var containerView = UIView().then { $0.backgroundColor = .green }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview().inset(5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
