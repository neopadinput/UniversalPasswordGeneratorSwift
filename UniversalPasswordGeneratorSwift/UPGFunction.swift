//
//  UPGFunction.swift
//  UniversalPasswordGenerator
//
//  Created by 김진수 on 2017. 7. 6..
//  Copyright © 2017년 Neopad. All rights reserved.
//

import Foundation
import IDZSwiftCommonCrypto

public class UPGFunction: NSObject {
    public func doEncoding(container: UPGContainer) -> String{
        var pwBuilder:String = "";
        
        //step1
        pwBuilder.append(getColorArray(x: container.x, y: container.y, background: container.backgroundBitmap))
        
        //step2
        for btn in container.btnArray {
            pwBuilder.append(getColorArray(x: Int(btn.frame.origin.x), y: Int(btn.frame.origin.y), background: container.backgroundBitmap))
        }
        
        //step3
        for numPassword in container.numPasswordArray {
            pwBuilder.append(getColorArray(x: Int(numPassword.frame.origin.x), y: Int(numPassword.frame.origin.y), background: container.backgroundBitmap))
        }
        
        var md5s2 : Digest = Digest(algorithm:.md5)
        md5s2.update(string: pwBuilder)
        let digests2 = md5s2.final()
        
        return hexString(fromArray: digests2)
    }
    
    public func testEncoding(argStr: String) -> String {
        var md5s2 : Digest = Digest(algorithm:.md5)
        md5s2.update(string: argStr)
        let digests2 = md5s2.final()
        
        //var result: String = String.init(cString: digests2)
        
        
        return hexString(fromArray: digests2);
    }
    
    func getColorArray(x:Int, y:Int, background:UIImage) -> String {
        var colorBuilder:String = "";
        
        var pixel:UIColor = background.getPixelColor(pos: CGPoint.init(x: x, y: y));
        colorBuilder.append(String(x));
        colorBuilder.append(String(y));
        
        colorBuilder.append(pixel.components.red.description)
        colorBuilder.append(pixel.components.green.description)
        colorBuilder.append(pixel.components.blue.description)
        colorBuilder.append(pixel.components.alpha.description)
        
        return colorBuilder;
    }
}
