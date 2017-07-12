//
//  CommonFunction.swift
//  UniversalPasswordGenerator
//
//  Created by 김진수 on 2017. 7. 6..
//  Copyright © 2017년 Neopad. All rights reserved.
//

import Foundation

/*
class PixelExtractor: NSObject {
    
    let image: CGImage
    let context: CGContextRef?
    
    var width: Int {
        get {
            return CGImageGetWidth(image)
        }
    }
    
    var height: Int {
        get {
            return CGImageGetHeight(image)
        }
    }
    
    init(img: CGImage) {
        image = img
        context = PixelExtractor.createBitmapContext(img)
    }
    
    class func createBitmapContext(img: CGImage) -> CGContextRef {
        
        // Get image width, height
        let pixelsWide = CGImageGetWidth(img)
        let pixelsHigh = CGImageGetHeight(img)
        
        let bitmapBytesPerRow = pixelsWide * 4
        let bitmapByteCount = bitmapBytesPerRow * Int(pixelsHigh)
        
        // Use the generic RGB color space.
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        // Allocate memory for image data. This is the destination in memory
        // where any drawing to the bitmap context will be rendered.
        let bitmapData = malloc(bitmapByteCount)
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedFirst.rawValue)
        let size = CGSizeMake(CGFloat(pixelsWide), CGFloat(pixelsHigh))
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        // create bitmap
        let context = CGBitmapContextCreate(bitmapData, pixelsWide, pixelsHigh, 8,
                                            bitmapBytesPerRow, colorSpace, bitmapInfo.rawValue)
        
        // draw the image onto the context
        let rect = CGRect(x: 0, y: 0, width: pixelsWide, height: pixelsHigh)
        CGContextDrawImage(context, rect, img)
        
        return context!
    }
    
    func colorAt(x x: Int, y: Int)->UIColor {
        
        assert(0<=x && x<width)
        assert(0<=y && y<height)
        
        let uncastedData = CGBitmapContextGetData(context)
        let data = UnsafePointer<UInt8>(uncastedData)
        
        let offset = 4 * (y * width + x)
        
        let alpha: UInt8 = data[offset]
        let red: UInt8 = data[offset+1]
        let green: UInt8 = data[offset+2]
        let blue: UInt8 = data[offset+3]
        
        let color = UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(alpha)/255.0)
        
        return color
    }
}
*/

/*
extension String {
    init(_ bytes: [UInt8]) {
        self.init()
        for b in bytes {
            //self.appending(UnicodeScalar(b))
            //self.append(UnicodeScalar(b))
            let s:String = UnicodeScalar(b)
            self.append(s);
        }
    }
}
*/

extension UIImage {
    func getPixelColor(pos: CGPoint) -> UIColor {
        
        //let pixelData = CGDataProviderCopyData(CGImageGetDataProvider(self.CGImage))
        let pixelData = self.cgImage?.dataProvider?.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

extension UIColor {
    var coreImageColor: CIColor {
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreImageColor = self.coreImageColor
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}
