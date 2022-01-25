//
//  CarouselCell.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2022/01/11.
//

import UIKit

class CarouselCell: UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    var countLabel:UILabel!
    
    func setup() {
        // セルの縦横を取得する
        let width:CGFloat = self.contentView.frame.width
        let height:CGFloat = self.contentView.frame.height
        
        // 適当なmargin
        let margin:CGFloat = 15
        
        // 数字ラベルを設置する
        countLabel = UILabel()
        countLabel.frame = CGRect(x:margin,
                                  y:margin,
                                  width:width - margin * 2,
                                  height:50)
        countLabel.textAlignment = .center
        countLabel.textColor = UIColor.black
        countLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        self.contentView.backgroundColor = UIColor.white
        self.contentView.layer.borderWidth = 2
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.shadowOffset = CGSize(width: 1,height: 1)
        self.contentView.layer.shadowColor = UIColor.gray.cgColor
        self.contentView.layer.shadowOpacity = 0.7
        self.contentView.layer.shadowRadius = 5
        
        self.contentView.addSubview(countLabel)
        

    }
    
}
