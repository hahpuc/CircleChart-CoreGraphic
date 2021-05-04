//
//  ViewDesignable.swift
//  3-CoreGraphic-CircleChart
//
//  Created by Long Nguyễn on 04/05/2021.
//

import UIKit

@IBDesignable
class ViewDesignable: UIView {
    
    struct Constants {
        static let numberOfPart = 8
        static let lineWidth: CGFloat = 5.0
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
    
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <=  Constants.numberOfPart {
                //the view needs to be refreshed
                self.setNeedsDisplay()
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = .blue
    @IBInspectable var counterColor: UIColor = .orange
    @IBInspectable var arcWidth: CGFloat = 76.0
    
    override func draw(_ rect: CGRect) {
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius = max(bounds.width, bounds.height)
        let startAngle: CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = .pi / 4
        
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius/2 - arcWidth/2,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)
        
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        // Draw the chart
        let angleTotal: CGFloat = 2 * .pi - startAngle + endAngle
        let lengthPerPart = angleTotal / CGFloat(Constants.numberOfPart)
        let outlineEndAngle = startAngle + lengthPerPart * CGFloat(counter)
        
        // draw the outer arc
        let outerArcRadius = bounds.width / 2 - Constants.halfOfLineWidth
        let outlinePath = UIBezierPath(
          arcCenter: center,
          radius: outerArcRadius,
          startAngle: startAngle,
          endAngle: outlineEndAngle,
          clockwise: true)

        // draw the inner arc
        let innerArcRadius = bounds.width / 2 - arcWidth + Constants.halfOfLineWidth
        outlinePath.addArc(
          withCenter: center,
          radius: innerArcRadius,
          startAngle: outlineEndAngle,
          endAngle: startAngle,
          clockwise: false)
            
        // close the path
        outlinePath.close()
            
        outlineColor.setStroke()
        outlineColor.setFill()
        
        outlinePath.lineWidth = Constants.lineWidth
        outlinePath.stroke()
        outlinePath.fill()
    }
}
