//
//  MainTableViewCell.swift
//  TableViewPracticeWithStoryboard
//
//  Created by 김초원 on 2023/10/11.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subContainerView: UIView!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // TODO: Cell이 생겨나면서 수행되어야 하는 일들을 작성
        setupLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupLayout() {
        // TODO: 컴포넌트 레이아웃 구성
        subContainerView.layer.cornerRadius = 12
        titleLabel.text = "제품명"
        subTitleLabel.text = "상태"
    }
    
}
