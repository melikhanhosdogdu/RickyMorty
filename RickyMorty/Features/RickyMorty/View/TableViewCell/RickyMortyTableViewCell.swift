//
//  RickyMortyTableViewCell.swift
//  RickyMorty
//
//  Created by Melikhan Hosdogdu on 8.10.2021.
//

import UIKit
import AlamofireImage

class RickyMortyTableViewCell: UITableViewCell {
    
    private let customImage : UIImageView = UIImageView()
    private let title : UILabel = UILabel()
    private let customDesciription : UILabel = UILabel()
    
    private lazy var randomImage : String = "https://picsum.photos/200/300"
    
    enum Identifier : String {
        case custom = "melikhan"
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError(" ")
    }
    
    private func configure () {
        addSubview(customImage)
        addSubview(title)
        addSubview(customDesciription)
        title.font = .boldSystemFont(ofSize: 18)
        
        
        customImage.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.top.equalTo(contentView)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        title.snp.makeConstraints { make in
            make.top.equalTo(customImage.snp.bottom).offset(10)
            make.right.left.equalTo(contentView)
            
        }
        customDesciription.snp.makeConstraints { make in
            make.top.equalTo(title.snp.top).offset(10)
            make.right.left.equalTo(title)
            
        }
    }
    
    func saveModel (model: Result){
        title.text = model.name
        customDesciription.text = model.status
        customImage.af.setImage(withURL:URL(string: model.image ?? randomImage) ?? URL(string: randomImage)!)
        
    }


}
