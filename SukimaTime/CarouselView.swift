//
//  CarouselView.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2022/01/11.
//

import UIKit

class CarouselView: UICollectionView {
    
    var pageCount:Int = 5
    let isInfinity = true
    var cellItemsWidth: CGFloat = 0.0
    let colors:[UIColor] = [.blue,.yellow,.red,.green,.gray]
    let saveData:UserDefaults=UserDefaults.standard
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    let cellIdentifier = "carousel"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 画面内に表示されているセルを取得
        let cells = self.visibleCells
        for cell in cells {
            // ここでセルのScaleを変更する
            transformScale(cell: cell)
        }
        
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        self.register(CarouselCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    convenience init(frame: CGRect) {
        let layout = PagingPerCellFlowLayout()
        layout.itemSize = CGSize(width: 200, height: frame.height / 2)
        layout.scrollDirection = .horizontal
        
        self.init(frame: frame, collectionViewLayout: layout)
        
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = UIColor.white
    }
    
    func transformScale(cell: UICollectionViewCell) {
        let cellCenter:CGPoint = self.convert(cell.center, to: nil) //セルの中心座標
        let screenCenterX:CGFloat = UIScreen.main.bounds.width / 2  //画面の中心座標x
        let reductionRatio:CGFloat = -0.0005                        //縮小率
        let maxScale:CGFloat = 1                                    //最大値
        let cellCenterDisX:CGFloat = abs(screenCenterX - cellCenter.x)   //中心までの距離
        let newScale = reductionRatio * cellCenterDisX + maxScale   //新しいスケール
        cell.transform = CGAffineTransform(scaleX:newScale, y:newScale)
    }
    
    func scrollToFirstItem() {
        self.layoutIfNeeded()
        if isInfinity {
            self.scrollToItem(at:IndexPath(row: self.pageCount, section: 0) , at: .centeredHorizontally, animated: false)
        }
    }
    
}




extension CarouselView: UICollectionViewDelegate {
    
}

extension CarouselView: UICollectionViewDataSource {
//    セクションごとのセル数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isInfinity ? pageCount * 3 : pageCount
    }
    
//    セルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CarouselCell = dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CarouselCell
        configureCell(cell: cell, indexPath: indexPath)
//        cell.contentView.backgroundColor = UIColor.green
       
        return cell
    }
    
    func configureCell(cell: CarouselCell,indexPath: IndexPath) {
        // indexを修正する
        let fixedIndex = isInfinity ? indexPath.row % pageCount : indexPath.row
//        cell.contentView.backgroundColor = colors[fixedIndex]
        cell.contentView.layer.borderColor = colors[fixedIndex].cgColor
        cell.countLabel.text = String(fixedIndex + 1)
    }

}

extension CarouselView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if isInfinity {
            if cellItemsWidth == 0.0 {
                cellItemsWidth = floor(scrollView.contentSize.width / 3.0) // 表示したい要素群のwidthを計算
            }
            
            if (scrollView.contentOffset.x <= 0.0) || (scrollView.contentOffset.x > cellItemsWidth * 2.0) { // スクロールした位置がしきい値を超えたら中央に戻す
                scrollView.contentOffset.x = cellItemsWidth
            }
        }
        
        // 画面内に表示されているセルを取得
//        let cells = self.visibleCells
//        for cell in cells {
            // ここでセルのScaleを変更する
//            transformScale(cell: cell)
//        }
    }
    
}
