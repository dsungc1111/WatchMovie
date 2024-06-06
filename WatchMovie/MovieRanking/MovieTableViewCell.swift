//
//  MovieTableViewCell.swift
//  WatchMovie
//
//  Created by 최대성 on 6/6/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    let rankLable = {
        let number = UILabel()
        number.textAlignment = .center
        number.font = .boldSystemFont(ofSize: 16)
        number.backgroundColor = .white
        return number
    }()
    let movieLabel = {
        let movie = UILabel()
        movie.textColor = .white
        movie.font = .boldSystemFont(ofSize: 16)
        return movie
    }()
    let dateLabel = {
        let date = UILabel()
        date.font = .systemFont(ofSize: 12)
        date.textColor = .white
        date.textAlignment = .center
        return date
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHeirarchy()
        configureLayout()
        
        
    }
    
    func configureHeirarchy() {
        contentView.addSubview(movieLabel)
        contentView.addSubview(rankLable)
        contentView.addSubview(dateLabel)
    }
    func configureLayout() {
        rankLable.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide)
            make.verticalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(5)
            make.width.equalTo(40)
        }
        movieLabel.snp.makeConstraints { make in
            make.leading.equalTo(rankLable.snp.trailing).offset(10)
            make.verticalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(5)
            make.width.equalTo(190)
        }
        dateLabel.snp.makeConstraints { make in
            make.verticalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(5)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide)
            make.width.equalTo(100)
        }
       
    }
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
