//
//  ColoredButton.swift
//  KidsDrawingApp
//
//  Created by HebaMac on 7/19/20.
//  Copyright © 2020 HSAAA. All rights reserved.
//

import Foundation
import UIKit

class ColoredButton : UIButton {
    
    func setColor(color: UIColor){
        self.backgroundColor = color
        self.layer.borderWidth = 1
    }
    
}
