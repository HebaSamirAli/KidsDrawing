//
//  Canvas.swift
//  KidsDrawingApp
//
//  Created by HebaMac on 7/18/20.
//  Copyright © 2020 HSAAA. All rights reserved.
//

import Foundation
import UIKit

// class for drawing view canvas
class Canvas: UIView {
    
    var lines = [DrawingLine]()
    var strokeColor  = UIColor.black
    var strokeWidth : Float = 10.0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        lines.forEach { (line) in
            context.setStrokeColor(line.color.cgColor)
            context.setLineWidth(CGFloat(strokeWidth))
            context.setLineCap(.round)
            for (index,linePoint) in line.points.enumerated() {
                if index == 0 {
                    context.move(to: linePoint)
                } else {
                context.addLine(to: linePoint)
                }
            }
            context.strokePath()
        }
        
    }
    
    // update stroke color
    func updateStrokeColor (newColor: UIColor) {
        strokeColor =  newColor
    }
    
    func updateStrokeWidth (width: Float) {
        strokeWidth = width
    }
    
    // pegin drawing ................
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(DrawingLine.init(color: strokeColor, width: strokeWidth, points: []))
    }
    
    // draw while moving .............
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else {return}
        
        guard var lastLine = lines.popLast() else {return}
        
        lastLine.points.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
    }
    
    // undo drawing
    func undoDrawing (){
        _ = lines.popLast()
        setNeedsDisplay()
    }
    
    // clear drawing
    func clearDrawing (){
        lines.removeAll()
        setNeedsDisplay()
    }
    
}
