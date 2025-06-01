//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 2025-05-31.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(FromUrlString url: String){
        NetworkManager.shared.downloadImage(fromURLString: url) { uiImage in
            guard let uiimage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiimage)
            }
        }
    }
}


struct RemoteImage: View {

    var image : Image?
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View {

    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(FromUrlString: urlString)
            }
    }
}
