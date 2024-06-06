//
//  MainViewController.swift
//  WatchMovie
//
//  Created by 최대성 on 6/4/24.
//

import UIKit
import Alamofire
import SnapKit

struct lottery: Decodable {
   
    let drwNoDate: String // 날짜
    let totSellamnt: Int
    let drwNo: Int// 회차
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}

class MainViewController: UIViewController {
    
   
    
    var lottoTextField = {
        let lotto = UITextField()
        lotto.backgroundColor = .white
        lotto.layer.borderWidth = 0.5
        lotto.layer.cornerRadius = 5
        lotto.layer.borderColor = UIColor.gray.cgColor
        lotto.textAlignment = .center
        lotto.font = .systemFont(ofSize: 20)
        return lotto
    }()
    
    var subtitleView = {
        let view = UIView()
        
        return view
    }()
    
    var infoLabel = {
        let info = UILabel()
        info.text = "당첨번호 안내"
        return info
    }()
    var dateLabel = {
        let date = UILabel()
        date.text = "곧 나옴"
        date.font = .systemFont(ofSize: 14)
        date.textColor = .lightGray
        return date
    }()
    var resultTextfield = {
        let result = UITextField()
        result.text = "당첨결과"
        result.textAlignment = .center
        result.font = .systemFont(ofSize: 20)
        return result
    }()
    
    lazy var lottoNumber1 = {
        setLotto()
    }()
    lazy var lottoNumber2 = {
        setLotto()
    }()
    lazy var lottoNumber3 = {
        setLotto()
    }()
    lazy var lottoNumber4 = {
        setLotto()
    }()
    lazy var lottoNumber5 = {
        setLotto()
    }()
    lazy var lottoNumber6 = {
        setLotto()
    }()
    lazy var lottoNumber7 = {
        setLotto()
    }()
    var plus = {
        var image = UIImageView()
        
        image.image = UIImage(named: "star")
        image.tintColor = .black
        image.frame.size.width = 30
        image.frame.size.height = 30
        return image
    }()
    
    var bonus = {
        let bonus = UITextField()
        bonus.text = "보너스"
        bonus.font = .systemFont(ofSize: 14)
        bonus.textColor = .lightGray
        return bonus
        
    }()
    
    var picker = UIPickerView()
    
    var list: lottery? = nil
    var numbers = {
        var list = []
        for i in 1...1122 {
            list.append("\(i)")
        }
        return list
    }()
    
    var pickNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        picker.delegate = self
        picker.dataSource = self
        lottoTextField.inputView = picker
        configureHierarchy()
        configureLayout()
        callRequest(number: 1122)
        lottoTextField.text = "1122"
        hideKeyboard()
    }
    override func viewDidAppear(_ animated: Bool) {
        subtitleView.layer.addBorder([.bottom], color: UIColor.lightGray, width: 0.5)
    }
    
    func hideKeyboard() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                     action: #selector(dismissKeyboard))
            view.addGestureRecognizer(tap)
            
            // 또는 아래처럼 작성하셔도 됩니다.
            
           // view.addGestureRecognizer(UITapGestureRecognizer(target: self,
           //                                                  action: #selector(dismissKeyboard)))
        }
        
       @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    
    func setLotto() -> UILabel {
        let circle = UILabel()
        circle.clipsToBounds = true
        circle.layer.cornerRadius = 20
        circle.textColor = .white
        circle.textAlignment = .center
        circle.font = .boldSystemFont(ofSize: 15)
        return circle
        
    }
    func configureUI() {
        colorOfLabel(label: lottoNumber1)
        colorOfLabel(label: lottoNumber2)
        colorOfLabel(label: lottoNumber3)
        colorOfLabel(label: lottoNumber4)
        colorOfLabel(label: lottoNumber5)
        colorOfLabel(label: lottoNumber6)
        colorOfLabel(label: lottoNumber7)
        
    }
    
   func colorOfLabel(label: UILabel) {
        let number = Int(label.text!)!
        
        switch number {
        case 1...10:
            label.backgroundColor = .systemYellow
        case 11...20:
            label.backgroundColor = .systemBlue
        case 21...30:
            label.backgroundColor = .systemRed
        case 31...40:
            label.backgroundColor = .systemGray
        case 41... :
            label.backgroundColor = .systemGreen
        default:
            break
        }
    }
    
    func configureHierarchy() {
        view.addSubview(lottoTextField)
        view.addSubview(subtitleView)
        view.addSubview(infoLabel)
        view.addSubview(dateLabel)
        view.addSubview(resultTextfield)
        view.addSubview(lottoNumber1)
        view.addSubview(lottoNumber2)
        view.addSubview(lottoNumber3)
        view.addSubview(lottoNumber4)
        view.addSubview(lottoNumber5)
        view.addSubview(lottoNumber6)
        view.addSubview(plus)
        view.addSubview(lottoNumber7)
        view.addSubview(bonus)
        //view.addSubview(picker)
    }
    func configureLayout() {
        lottoTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        subtitleView.snp.makeConstraints { make in
            make.top.equalTo(lottoTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        infoLabel.snp.makeConstraints { make in
            make.verticalEdges.equalTo(subtitleView.snp.verticalEdges).inset(5)
            make.leading.equalTo(subtitleView.snp.leading).inset(5)
        }
        dateLabel.snp.makeConstraints { make in
            make.verticalEdges.equalTo(subtitleView.snp.verticalEdges).inset(5)
            make.trailing.equalTo(subtitleView.snp.trailing).inset(5)
        }
        resultTextfield.snp.makeConstraints { make in
            make.top.equalTo(subtitleView.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(80)
            make.height.equalTo(50)
        }
        lottoNumber1.snp.makeConstraints { make in
            make.top.equalTo(resultTextfield.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.size.equalTo(40)
        }
        lottoNumber2.snp.makeConstraints { make in
            make.top.equalTo(resultTextfield.snp.bottom).offset(20)
            make.leading.equalTo(lottoNumber1.snp.trailing).offset(5)
            make.size.equalTo(40)
        }
        lottoNumber3.snp.makeConstraints { make in
            make.top.equalTo(resultTextfield.snp.bottom).offset(20)
            make.leading.equalTo(lottoNumber2.snp.trailing).offset(5)
            make.size.equalTo(40)
        }
        lottoNumber4.snp.makeConstraints { make in
            make.top.equalTo(resultTextfield.snp.bottom).offset(20)
            make.leading.equalTo(lottoNumber3.snp.trailing).offset(5)
            make.size.equalTo(40)
        }
        lottoNumber4.snp.makeConstraints { make in
            make.top.equalTo(resultTextfield.snp.bottom).offset(20)
            make.leading.equalTo(lottoNumber3.snp.trailing).offset(5)
            make.size.equalTo(40)
        }
        lottoNumber5.snp.makeConstraints { make in
            make.top.equalTo(resultTextfield.snp.bottom).offset(20)
            make.leading.equalTo(lottoNumber4.snp.trailing).offset(5)
            make.size.equalTo(40)
        }
        lottoNumber6.snp.makeConstraints { make in
            make.top.equalTo(resultTextfield.snp.bottom).offset(20)
            make.leading.equalTo(lottoNumber5.snp.trailing).offset(5)
            make.size.equalTo(40)
        }
        plus.snp.makeConstraints { make in
            make.top.equalTo(resultTextfield.snp.bottom).offset(30)
            make.leading.equalTo(lottoNumber6.snp.trailing).offset(10)
            make.size.equalTo(20)
        }
        lottoNumber7.snp.makeConstraints { make in
            make.top.equalTo(resultTextfield.snp.bottom).offset(20)
            make.leading.equalTo(plus.snp.trailing).offset(10)
            make.size.equalTo(40)
        }
        bonus.snp.makeConstraints { make in
            make.top.equalTo(lottoNumber7.snp.bottom).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(27)
            make.height.equalTo(20)
        }
//        picker.snp.makeConstraints { make in
//            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
//            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
//            make.height.equalTo(200)
//        }
//        picker.backgroundColor = .systemGray6
    }
    
    func callRequest(number: Int) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
      
        AF.request(url).responseDecodable(of: lottery.self) { response in
            switch response.result {
            case .success(let value):
                self.list = value
                
                self.lottoNumber1.text = "\(value.drwtNo1)"
                self.lottoNumber2.text = "\(value.drwtNo2)"
                self.lottoNumber3.text = "\(value.drwtNo3)"
                self.lottoNumber4.text = "\(value.drwtNo4)"
                self.lottoNumber5.text = "\(value.drwtNo5)"
                self.lottoNumber6.text = "\(value.drwtNo6)"
                self.lottoNumber7.text = "\(value.bnusNo)"
                    
                self.configureUI()

                self.dateLabel.text = value.drwNoDate
//              
//                self.pickNumber = value.drwNo
                print(value)
            case .failure(let error):
                print(error)
            }
            
            
        }
        
    }
    
    
    
}





extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //pickerView.selectedRow(inComponent: numbers.count)
        return (numbers[row] as! String)
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lottoTextField.text = (numbers[row] as! String)
        let newLottoNumber = Int(numbers[row] as! String)!
        callRequest(number: newLottoNumber)
    }
    
    
    
    
}

extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
//            print("check",frame.width)
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}



  

