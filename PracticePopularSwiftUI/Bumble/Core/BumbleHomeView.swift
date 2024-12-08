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
    @State private var currentSwipeOffset: CGFloat = 0
    
    @AppStorage("bumble_home_filter") private var selectedFilter: String = "Everyone"
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 12) {
                header
                BumbleFilterView(options: filters, selection: $selectedFilter)
                    .background(Divider(), alignment: .bottom)
                ZStack {
                    if !allUsers.isEmpty {
                        ForEach(Array(allUsers.enumerated()), id: \.offset) { (index, user) in
                            let isPrevious = selectedIndex - 1 == index
                            let isCurrent = selectedIndex == index
                            let isNext = selectedIndex + 1 == index
                            if isPrevious || isCurrent || isNext {
                                let offsetValue = cardOffsets[user.id]
                                userProfileView(user: user, index: index)
                                    .zIndex(Double(allUsers.count - index))
                                    .offset(x: offsetValue == nil ? 0 : offsetValue == true ? 900 : -900)
                            }
                        }
                    } else {
                        ProgressView()
                    }
                    
                    overlaySwipingIndicators
                        .animation(.smooth, value: currentSwipeOffset)
                        .zIndex(999)
                }
                .frame(maxHeight: .infinity)
                .padding(4)
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
    
    private func userProfileView(user: User, index: Int) -> some View {
        BumbleCardView(
            user: user,
            onSuperLikePressed: nil,
            onXmarkPressed: {
                userDidSelect(index: index, isLike: false)
            },
            onCheckmarkPressed: {
                userDidSelect(index: index, isLike: true)
            },
            onSendAComplimentPresssed: nil,
            onHideAndReportPressed: {
                
            }
        )
        .withDragGesture(
            .horizontal,
            minimumDistance: 20,
            resets: true,
            rotationMultiplier: 1.05,
            onChanged: { dragOffset in
                currentSwipeOffset = dragOffset.width
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
    
    private var overlaySwipingIndicators: some View {
        ZStack{
            Circle()
                .fill(.bumbleGray.opacity(0.4))
                .overlay {
                    Image(systemName: "xmark")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.2 : 0.8)
                .offset(x: min(-currentSwipeOffset, 150))
                .offset(x: -100)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Circle()
                .fill(.bumbleGray.opacity(0.4))
                .overlay {
                    Image(systemName: "checkmark")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.2 : 0.8)
                .offset(x: max(-currentSwipeOffset, -150))
                .offset(x: 100)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

#Preview {
    BumbleHomeView()
}
