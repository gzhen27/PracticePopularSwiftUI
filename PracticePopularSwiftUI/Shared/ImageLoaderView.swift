//
//  ImageLoaderView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/23/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var imageUrl = Constants.staticImage
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .overlay {
                WebImage(url: URL(string: imageUrl))
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
//        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(40)
        .padding(.vertical, 60)
}
