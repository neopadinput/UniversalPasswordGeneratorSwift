//
//  UPGContainer.swift
//  UniversalPasswordGenerator
//
//  Created by 김진수 on 2017. 7. 6..
//  Copyright © 2017년 Neopad. All rights reserved.
//

import Foundation

public class UPGContainer:NSObject {
    var x:Int = 0;
    var y:Int = 0;
    var btnArray:Array<UIButton> = Array<UIButton>();
    var numPasswordArray:Array<UIButton> = Array<UIButton>();
    var backgroundBitmap:UIImage = UIImage();
    
    public func initContainer(x:Int, y:Int, btnArray:Array<UIButton>, numPasswordArray:Array<UIButton>, backgroundBitmap:UIImage){
        self.x = x
        self.y = y
        self.btnArray = btnArray
        self.numPasswordArray = numPasswordArray
        self.backgroundBitmap = backgroundBitmap
    }
}
