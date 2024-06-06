//
//  HomeViewController.swift
//  WatchMovie
//
//  Created by 최대성 on 6/4/24.
//

import UIKit
import Alamofire

struct BoxOfficeResult: Decodable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [Movie]
}

struct Movie: Decodable {
    let rank: String
    var movieNm: String
    let openDt: String
    
}

struct BoxOfficeResponse: Decodable {
    let boxOfficeResult: BoxOfficeResult
}



class MovieViewController: UIViewController {
    
    let tableView = UITableView()
    
    var list: [Movie] = []
    
    let backgroundImage = {
        let image = UIImageView()
        image.image = UIImage(named: "lalaland")
        return image
    }()
    
    var searchTextField = {
        let search = UITextField()
        search.textColor = .white
        search.text = "20240601"
        return search
    }()
    var searchButton = {
        let button = UIButton()
        button.backgroundColor = .none
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 5
        button.setTitle("검색", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.contentMode = .center
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureHierarchy()
        configureLayout()
        
        configureTableView()
        callRequest()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        searchTextField.layer.addBorder([.bottom], color: UIColor.white, width: 1)
    }
    
  
    @objc func searchButtonTapped() {
        callRequest()
        tableView.reloadData()
    }
    
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.backgroundColor = .none
    }
    
    
    func configureHierarchy() {
        view.addSubview(backgroundImage)
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        view.addSubview(tableView)
        
    }
    
    func configureLayout() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.height.equalTo(50)
        }
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.equalTo(searchTextField.snp.trailing).offset(5)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        
    }
    func callRequest() {
        let url = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(APIKey.movieKey)&targetDt=\(searchTextField.text!)"
        
        AF.request(url).responseDecodable(of: BoxOfficeResponse.self) { response in
            switch response.result {
            case .success(let value):
                self.list = value.boxOfficeResult.dailyBoxOfficeList
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}



extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.rankLable.text = list[indexPath.row].rank
        cell.movieLabel.text = list[indexPath.row].movieNm
        cell.dateLabel.text = list[indexPath.row].openDt
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
}

