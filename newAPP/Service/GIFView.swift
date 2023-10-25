import Foundation
import UIKit
import SwiftUI

struct GIFView: UIViewRepresentable {
    var gifName:String
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
               if let gifURL = Bundle.main.url(forResource: gifName, withExtension: "gif") {
                   if let data = try? Data(contentsOf: gifURL) {
                       if let image = UIImage(data: data) {
                           imageView.image = image
                       }
                   }
               }
               return imageView
    }
    
    
    func updateUIView(_ uiView: UIImageView, context: UIViewRepresentableContext<GIFView>) {}
}
