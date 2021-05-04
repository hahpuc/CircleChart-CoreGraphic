//
//  ButtonDesignable.swift
//  3-CoreGraphic-CircleChart
//
//  Created by Long Nguyễn on 04/05/2021.
//

import UIKit

@IBDesignable
class ButtonDesginable: UIButton {
    
    struct Constants {
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width/2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height/2
    }
    
    @IBInspectable var fillColor: UIColor = .green
    @IBInspectable var isAddButton: Bool = true 
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let plusWidth = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth/2
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = Constants.plusLineWidth
        
        plusPath.move(to: CGPoint(
            x: halfWidth - halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift)
        )
        
        plusPath.addLine(to: CGPoint(
            x: halfWidth + halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift)
        )
        
        if (isAddButton) {
            plusPath.move(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHeight - halfPlusWidth + Constants.halfPointShift)
            )
            
            plusPath.addLine(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHeight + halfPlusWidth + Constants.halfPointShift)
            )
        }
        
        UIColor.white.setStroke()
        plusPath.stroke()
    }
}
