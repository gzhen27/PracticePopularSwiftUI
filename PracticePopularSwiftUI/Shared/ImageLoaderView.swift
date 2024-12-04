//
//  ImageLoaderView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/23/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var imageName = Constants.staticImage
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .overlay {
                WebImage(url: URL(string: imageName))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: .fill)
                    //with allowsHitTesting(_ enabled: Bool), the image is not clickable.
                    //when this area is being clicked, it is actually the RoundedRectangle area.
                    .allowsHitTesting(false)
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
        .frame(width: 100, height: 100)
}
