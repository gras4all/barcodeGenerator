# BarcodeGenerator

The **BarcodeGenerator** framework is a lightweight and efficient tool for generating barcode images in iOS applications. This framework provides a simple and convenient API to create barcodes with various customization options.

## Features

- **Barcode Generation:** Quickly generate barcode images with ease.
- **Color Customization:** Customize the barcode color using `CIColor`.
- **Asynchronous Completion:** Utilize asynchronous generation with a completion handler for seamless integration into your application.

## Usage

### Installation

To integrate the BarcodeGenerator framework into your iOS project using CocoaPods, add the following line to your `Podfile`:

```ruby
pod 'BarcodeGenerator', :git => 'git@github.com:gras4all/barcodeGenerator.git'
```

### Example
```ruby
import BarcodeGenerator

// ...

let barcodeGenerator = BarcodeGenerator()

let barcodeColor = CIColor(red: 0.2, green: 0.5, blue: 0.8)
barcodeGenerator.generateBarcode(color: barcodeColor) { barcodeImage in
    if let barcodeImage = barcodeImage {
        // Handle the generated barcode image
        // e.g., display it in an ImageView
        imageView.image = barcodeImage
    } else {
        // Handle the case where barcode generation fails
        print("Barcode generation failed.")
    }
}
```
### Documentation
```ruby
generateBarcode(color:completion:)
```
Generates a barcode image with the specified color.

## Parameters:
- **color:** A CIColor object representing the desired color of the barcode.
- **completion:** A closure called upon completion with the generated UIImage or nil if an error occurs.

### Integration Notes
Ensure that you have the necessary permissions in your app to generate images.
Test the generated barcode images under various conditions to ensure reliability.

### Contributions
Contributions are welcome! If you encounter any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## Author
Andrei Grunenkov, gras4all@gmail.com

## License
barcodeGen is available under the MIT license. See the LICENSE file for more info.
