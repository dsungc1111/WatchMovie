//
//  ViewController.swift
//  WatchMovie
//
//  Created by 최대성 on 6/4/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    var images: [UIImage]! = [._1, ._2, ._3, ._4, ._5, .극한직업, .도둑들, .명량, .베테랑, .부산행, .신과함께인과연, .신과함께죄와벌, .아바타, .알라딘, .암살]
    
    lazy var mainImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        let number = Int.random(in: 0...images.count-1)
        view.image = images[number]
        images.remove(at: number )
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    var playButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.tintColor = .black
        button.setTitle(" Play", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel!.font = .boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        return button
    }()
    var myList = {
       let button = UIButton()
        button.backgroundColor = .gray
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.setTitle(" 내가 찜한 리스트", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 5
        return button
    }()
    var hotContentsLabel = {
        let label = UILabel()
        label.text = "지금 뜨는 컨텐츠"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    lazy var recommendedContent1 = {
        let view = UIImageView()
        view.clipsToBounds = true
        let number = Int.random(in: 0...images.count-1)
        view.image = images[number]
        images.remove(at: number )
        view.layer.cornerRadius = 5
        view.contentMode = .scaleAspectFill
        return view
    }()
    lazy var recommendedContent2 = {
        let view = UIImageView()
        view.clipsToBounds = true
        let number = Int.random(in: 0...images.count-1)
        view.image = images[number]
        images.remove(at: number )
        view.layer.cornerRadius = 5
        view.contentMode = .scaleAspectFill
        return view
    }()
    lazy var recommendedContent3 = {
        let view = UIImageView()
        view.clipsToBounds = true
        let number = Int.random(in: 0...images.count-1)
        view.image = images[number]
        view.layer.cornerRadius = 5
        view.contentMode = .scaleAspectFill
        return view
    }()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white


       
        
        navigationUI()
        configureHieararchy()
        configureLayout()

    }
    
    
    func navigationUI() {
        navigationItem.title = "최대성님"
        navigationController?.navigationBar.tintColor = .blue
    }
    
    
    
    func configureHieararchy() {
        view.addSubview(mainImageView)
        view.addSubview(playButton)
        view.addSubview(myList)
        view.addSubview(hotContentsLabel)
        view.addSubview(recommendedContent1)
        view.addSubview(recommendedContent2)
        view.addSubview(recommendedContent3)
    }
    
    func configureLayout() {
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(420)
        }
        playButton.snp.makeConstraints { make in
            make.bottom.equalTo(mainImageView.snp.bottom).inset(20)
            make.leading.equalTo(mainImageView.snp.leading).inset(20)
            make.height.equalTo(50)
            make.width.equalTo(150)
        }
        myList.snp.makeConstraints { make in
            make.bottom.equalTo(mainImageView.snp.bottom).inset(20)
            make.trailing.equalTo(mainImageView.snp.trailing).inset(20)
            make.height.equalTo(50)
            make.width.equalTo(150)
        }
        hotContentsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(35)
            make.height.equalTo(30)
        }
        recommendedContent1.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.top.equalTo(hotContentsLabel.snp.bottom).offset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(110)
        }
        recommendedContent2.snp.makeConstraints { make in
            make.leading.equalTo(recommendedContent1.snp.trailing).offset(5)
            make.top.equalTo(hotContentsLabel.snp.bottom).offset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(110)
        }
        recommendedContent3.snp.makeConstraints { make in
            make.leading.equalTo(recommendedContent2.snp.trailing).offset(5)
            make.top.equalTo(hotContentsLabel.snp.bottom).offset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(110)
        }
        
        
    }
    
    

 
    
    
}



