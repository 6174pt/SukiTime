//
//  PagingPerCellFlowLayout.swift
//  SukimaTime
//
//  Created by Honoka Nishiyama on 2022/01/11.
//

import UIKit

class PagingPerCellFlowLayout: UICollectionViewFlowLayout {
    
    var cellWidth:CGFloat = 200
    let windowWidth:CGFloat = UIScreen.main.bounds.width
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint
    {
        var offsetAdjustment:CGFloat = CGFloat(MAXFLOAT)
        let horizontalOffest:CGFloat = proposedContentOffset.x + ( windowWidth - cellWidth ) / 2
        let targetRect = CGRect(x:proposedContentOffset.x,
                                y:0,
                                width:self.collectionView!.bounds.size.width,
                                height:self.collectionView!.bounds.size.height)
        
        let array = super.layoutAttributesForElements(in: targetRect)
        
        for layoutAttributes in array! {
            let itemOffset = layoutAttributes.frame.origin.x
            if abs(itemOffset - horizontalOffest) < abs(offsetAdjustment) {
                offsetAdjustment = itemOffset - horizontalOffest
            }
        }
        
        return CGPoint(x:proposedContentOffset.x + offsetAdjustment, y:proposedContentOffset.y)
         //停止したい位置を計算して返す
        
    }

}
