//
//  BumbleHomeView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/5/24.
//

import SwiftUI

struct BumbleHomeView: View {
    @State private var filters: [String] = ["Everyone", "Trending"]
    @State private var allUsers: [User] = []
    @State private var selectedIndex: Int = 0
    @State private var cardOffsets: [Int: Bool] = [:]
    
    @AppStorage("bumble_home_filter") private var selectedFilter: String = "Everyone"

    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 12) {
                header
                BumbleFilterView(options: filters, selection: $selectedFilter)
                    .background(Divider(), alignment: .bottom)
//                BumbleCardView()
                ZStack {
                    if !allUsers.isEmpty {
                        ForEach(Array(allUsers.enumerated()), id: \.offset) { (index, user) in
                            let isPrevious = selectedIndex - 1 == index
                            let isCurrent = selectedIndex == index
                            let isNext = selectedIndex + 1 == index
                            if isPrevious || isCurrent || isNext {
                                let offsetValue = cardOffsets[user.id]
                                userProfileView(index: index)
                                    .zIndex(Double(allUsers.count - index))
                                    .offset(x: offsetValue == nil ? 0 : offsetValue == true ? 900 : -900)
                            }
                        }
                    } else {
                        ProgressView()
                    }
                }
                .frame(maxHeight: .infinity)
                .animation(.smooth, value: cardOffsets)
            }
            .padding(8)
        }
        .task {
            await getUsers()
        }
    }
    
    private func userDidSelect(index: Int, isLike: Bool) {
        let user = allUsers[index]
        cardOffsets[user.id] = isLike
        
        selectedIndex+=1
    }
    
    private func getUsers() async {
        guard allUsers.isEmpty else { return }
        
        do {
            allUsers = try await DataCenter.getUsers()
        } catch {
            
        }
    }
    
    private func userProfileView(index: Int) -> some View {
        Rectangle()
            .fill(index == selectedIndex ? Color.purple : Color.purple.opacity(0.5))
            .overlay {
                Text("\(index)")
            }
            .withDragGesture(
                .horizontal,
                resets: true,
                rotationMultiplier: 1.05,
                onChanged: { dragOffset in
                    
                },
                onEnded: { dragOffset in
                    if dragOffset.width < -50 {
                        userDidSelect(index: index, isLike: false)
                    } else if dragOffset.width > 50 {
                        userDidSelect(index: index, isLike: true)
                    }
                }
            )
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(.bumbleBlack.opacity(0.001))
                    .asButton {
                        
                    }
                
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(.bumbleBlack.opacity(0.001))
                    .asButton {
                        
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Text("bumble")
                .font(.title)
                .foregroundStyle(.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(.bumbleBlack.opacity(0.001))
                .asButton {
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .font(.title3)
        .fontWeight(.medium)
        .foregroundStyle(.bumbleBlack)
    }
}

#Preview {
    BumbleHomeView()
}
