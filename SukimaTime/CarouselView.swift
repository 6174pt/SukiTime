//
//  CarouselView.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2022/01/11.
//

import UIKit

class CarouselView: UICollectionView{
    
    
    
    let cellIdentifier = "carousel"
//    let pageCount = 5
    
    let saveData:UserDefaults=UserDefaults.standard
    var filteredArray:[[Any]]=[[]]
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 画面内に表示されているセルを取得
        let cells = self.visibleCells
        for cell in cells {
            // ここでセルのScaleを変更する
            transformScale(cell: cell)
        }
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        self.register(CarouselCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        
        
    }
    
    
    convenience init(frame: CGRect) {
        let layout = PagingPerCellFlowLayout()
        layout.itemSize = CGSize(width: frame.width*0.8, height: frame.height / 2)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 50, bottom: 16, right: 50)
        
        
        self.init(frame: frame, collectionViewLayout: layout)
        
        // 水平方向のスクロールバーを非表示にする
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = UIColor.white
        
    }
    
    func transformScale(cell: UICollectionViewCell) {
        // 計算してスケールを変更する
        let cellCenter:CGPoint = self.convert(cell.center, to: nil) //セルの中心座標
        let screenCenterX:CGFloat = UIScreen.main.bounds.width / 2  //画面の中心座標x
        let cellCenterDisX:CGFloat = abs(screenCenterX - cellCenter.x)
        let reductionRatio:CGFloat = -0.0009                        //縮小率
        let maxScale:CGFloat = 1                                    //最大値
//        let cellCenterDisX:CGFloat = screenCenterX - cellCenter.x   //中心までの距離
        let newScale = reductionRatio * cellCenterDisX + maxScale   //新しいスケール
        cell.transform = CGAffineTransform(scaleX:newScale, y:newScale)
    }


    
}

extension CarouselView: UICollectionViewDelegate {
    
}

extension CarouselView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        filteredArray=saveData.object(forKey: "filter") as! [[Any]]
        if filteredArray[0].isEmpty{
            filteredArray.removeFirst()
        }else{
            
        }
    }
    
    // セクションごとのセル数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredArray=saveData.object(forKey: "filter") as! [[Any]]
        print(filteredArray)
        
        if filteredArray[0].isEmpty{
            filteredArray.removeFirst()
        }else{
            
        }
        
        if filteredArray[0].isEmpty{
            return 0
        }else{
            return filteredArray.count
        }
    }
    
    // セルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CarouselCell
        cell.contentView.backgroundColor = UIColor.white
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.shadowOffset = CGSize(width: 1,height: 1)
        cell.contentView.layer.shadowColor = UIColor.gray.cgColor
        cell.contentView.layer.shadowOpacity = 0.7
        cell.contentView.layer.shadowRadius = 5
        
        
        configureCell(cell: cell, indexPath: indexPath)
        
        cell.delegate = SuggestionViewController() as CatchProtocol
        
        return cell
    }
    
    func configureCell(cell: CarouselCell,indexPath: IndexPath) {
        // indexを修正する
        let index = indexPath.row

        print(index)
        
        
        cell.countLabel.text = filteredArray[index][0] as? String
        cell.dateLabel.text = filteredArray[index][2] as? String

//        print(cell.contentView.layer.shadowOffset)
    }
    
    
    
    
}

extension CarouselView:UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }
    
}
