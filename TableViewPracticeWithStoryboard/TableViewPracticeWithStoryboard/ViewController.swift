//
//  ViewController.swift
//  TableViewPracticeWithStoryboard
//
//  Created by 김초원 on 2023/10/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    func setupTableView() {
        // TableView를 사용하기 위해 필수적인 프로토콜 채택
        tableView.delegate = self
        tableView.dataSource = self
        // TableView에 커스텀 셀을 사용하기 위한 사전 등록
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10   // TableView에 보여줄 Cell의 개수 반환
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TableView에 보여줄 Cell을 반환
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        return cell
    }
}
