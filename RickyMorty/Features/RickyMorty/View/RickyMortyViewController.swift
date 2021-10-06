//
//  RickyMortyViewController.swift
//  RickyMorty
//
//  Created by Melikhan Hosdogdu on 6.10.2021.
//

import UIKit
import SnapKit

final class RickyMortyViewController: UIViewController {
    private let labelTitle : UILabel = UILabel()
    private let box :UIView = UIView()
    private let indicator : UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    } //scskj
    
  private  func configure()  {
        view.addSubview(box)
        view.addSubview(labelTitle)
        view.addSubview(indicator)
        drawDesing()
        makeBox()
        makeLabel()
        makeIndicator()
        
    }
    
    private func drawDesing(){
        self.view.backgroundColor = .white
        self.box.backgroundColor = .red
        self.labelTitle.text = "Label Title"
        self.indicator.color = .blue
        self.indicator.startAnimating()
    }
    
}

extension RickyMortyViewController {
    
    private func makeBox(){
        box.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.right.left.equalTo(labelTitle)
            
            
        }
    }
    private func makeLabel(){
        
        labelTitle.snp.makeConstraints{ (make) in
            
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.greaterThanOrEqualTo(10)
            
        }
    }
    private func makeIndicator(){
        indicator.snp.makeConstraints { make in
            make.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
    }
}
