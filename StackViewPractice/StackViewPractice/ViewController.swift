//
//  ViewController2.swift
//  StackViewPractice
//
//  Created by 김초원 on 2023/10/17.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    // variables
    let weatherWithTimeList = [
        ["오전 8시", "10°"],
        ["오전 9시", "12°"],
        ["오전 10시", "15°"],
        ["오전 11시", "17°"],
        ["오후 12시", "19°"],
        ["오후 1시", "20°"],
    ]
    
    // container views
    lazy var backView = UIView().then {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 20
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapWeatherView)))
    }
    let cloudImgContainerView = UIView().then {
        $0.backgroundColor = .clear
    }

    /// 좌측 상단 도시명, 현재기온을 포함한 수직 스택뷰
    lazy var leftStackView = UIStackView().then {
//        $0.backgroundColor = .green
        let stackView = UIStackView(arrangedSubviews: [leftTitleLabel1, leftTitleLabel2])
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
        $0.spacing = 5
    }
    
    /// 우측 상단 오늘 날씨와 최고,최저 기온을 포함한 수직 스택뷰
    let cloudImgView = UIImageView(image: UIImage(systemName: "cloud.fill")).then {
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFill
    }
    lazy var rightStackView = UIStackView().then {
//        $0.backgroundColor = .blue
        let stackView = UIStackView(arrangedSubviews: [cloudImgContainerView, rightTitleLabel1, rightTitleLabel2])
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .trailing
//        $0.spacing = 3
    }
    
    
    /// 하단 시간별 날씨를 포함한 스택뷰 수평 스택뷰
    lazy var weatherViews: [UIView] = []
    
    lazy var bottomStackView = UIStackView().then {
//        $0.backgroundColor = .cyan
        let stackView = UIStackView(arrangedSubviews: weatherViews)
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .leading
        $0.spacing = 5
    }
    
    
    // labels
    lazy var leftTitleLabel1 = getLabelView(titleStr: "서울특별시", fontSize: 20.0, fontWeight: .bold, fontColor: .white)
    lazy var leftTitleLabel2 = getLabelView(titleStr: "9°", fontSize: 45.0, fontWeight: .regular, fontColor: .white)
    lazy var rightTitleLabel1 = getLabelView(titleStr: "대체로 흐림", fontSize: 18.0, fontWeight: .medium, fontColor: .white)
    lazy var rightTitleLabel2 = getLabelView(titleStr: "최고: 21° 최저 7°", fontSize: 18.0, fontWeight: .medium, fontColor: .white)
    
    
    // life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWeatherOfTime()
        setLayouts()
    }
    
    // helper methods
    func configureWeatherOfTime() {
        weatherWithTimeList.map { info in
            weatherViews.append(getWeatherViewOfTime(timeStr: info[0], temper: info[1]))
        }
    }
    
    private func setLayouts() {
        // add views
        self.view.addSubview(backView)
        
        backView.addSubview(leftStackView)
        backView.addSubview(rightStackView)
        backView.addSubview(bottomStackView)
        
        // add views in StackView
        leftStackView.addArrangedSubview(leftTitleLabel1)
        leftStackView.addArrangedSubview(leftTitleLabel2)
        
        cloudImgContainerView.addSubview(cloudImgView)
        rightStackView.addArrangedSubview(cloudImgContainerView)
        
        rightStackView.addArrangedSubview(rightTitleLabel1)
        rightStackView.addArrangedSubview(rightTitleLabel2)
        
        weatherViews.map { view in
            bottomStackView.addArrangedSubview(view)
        }
        
        // set constraints
        backView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(130)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
//            make.height.equalTo(180)
        }
        
        leftStackView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(15)
        }
        
        cloudImgView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        cloudImgContainerView.snp.makeConstraints { make in
//            make.height.equalTo(35)
        }
        rightTitleLabel1.snp.makeConstraints { make in
            make.top.equalTo(cloudImgView.snp.bottom).offset(20)
        }
        rightStackView.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(15)
            make.bottom.equalTo(leftStackView.snp.bottom)
        }
        bottomStackView.snp.makeConstraints { make in
            make.top.equalTo(leftStackView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(15)
        }
    }
    
    /// 컨테이너 뷰를 가진 UILabel 컴포넌트를 반환
    func getLabelView(titleStr: String, fontSize: Double, fontWeight: UIFont.Weight, fontColor: UIColor) -> UIView {
        let titleLabel = UILabel().then {
            $0.text = titleStr
            $0.font = .systemFont(ofSize: fontSize, weight: fontWeight)
            $0.textColor = fontColor
        }
        let containerView = UIView().then {
//            $0.backgroundColor = .systemPink
            $0.backgroundColor = .clear
        }
        
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        return containerView
    }
    
    /// 시간, 구름이미지, 기온을 포함한 컴포넌트를 반환
    func getWeatherViewOfTime(timeStr: String, temper: String) -> UIView {
        let containerView = UIView().then {
//            $0.backgroundColor = .red
            $0.backgroundColor = .clear
        }
        
        let timeLabel = UILabel().then {
            $0.text = timeStr
            $0.font = .systemFont(ofSize: 11.0, weight: .medium)
            $0.textColor = .white
        }
        let cloudImgView = UIImageView(image: UIImage(systemName: "cloud.fill")).then {
            $0.tintColor = .white
        }
        let temperLabel = UILabel().then {
            $0.text = temper
            $0.font = .systemFont(ofSize: 15.0, weight: .bold)
            $0.textColor = .white
        }
        
        [timeLabel, cloudImgView, temperLabel].map { e in
            containerView.addSubview(e)
            e.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
            }
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
        cloudImgView.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(7)
        }
        temperLabel.snp.makeConstraints { make in
            make.top.equalTo(cloudImgView.snp.bottom).offset(7)
            make.bottom.equalToSuperview()
        }
        
        return containerView
    }
    
    // @objc methods
    @objc func didTapWeatherView() {
        let detailVC = WeatherDetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
