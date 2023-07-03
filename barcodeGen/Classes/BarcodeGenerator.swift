//
//  BarcodeGenerator.swift
//
//  Created by Andrei Grunenkov on 28.06.2023.
//

import UIKit

enum BarcodeType {
    case barcode
    case qr
}

extension String {
    
    func generateBarcode(color: CIColor, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            let data = self.data(using: String.Encoding.ascii)
            if let filter = CIFilter(name: "CICode128BarcodeGenerator") {
                guard let colorFilter = CIFilter(name: "CIFalseColor") else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                    return
                }
                filter.setValue(data, forKey: "inputMessage")
                colorFilter.setValue(filter.outputImage, forKey: "inputImage")
                colorFilter.setValue(CIColor(red: 1, green: 1, blue: 1), forKey: "inputColor1")
                colorFilter.setValue(color, forKey: "inputColor0")
                guard colorFilter.outputImage != nil else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                    return
                }
                let transform = CGAffineTransform(scaleX: 1, y: 1)
                if let output = colorFilter.outputImage?.transformed(by: transform) {
                    DispatchQueue.main.async {
                        completion(UIImage(ciImage: output))
                    }
                    return
                }
            }
            completion(nil)
        }
    }
    
}
