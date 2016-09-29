import UIKit
import Foundation

public class ImageUtil {
    
    /**
     与えられたimageを正方形にして返す
     (横長,縦長は中央を正方形(短辺に合わせて)に切り取って返す)
     :param: image 切り取る画像
     :returns: 切り取り後の画像
     */
    static func cropImageToSquare(image: UIImage) -> UIImage? {
        let width = image.size.width
        let height = image.size.height
        if width > height {
            // 横長
            let cropCGImageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(width/2 - height/2, 0, image.size.height, image.size.height))
            return UIImage(CGImage: cropCGImageRef!)
        } else if width < height {
            // 縦長
            let cropCGImageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(0, height/2 - width/2, image.size.width, image.size.width))
            return UIImage(CGImage: cropCGImageRef!)
        } else {
            return image
        }
    }
}
