//
//  BumbleChatsView.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 12/9/24.
//

import SwiftUI
import SwiftfulRouting

struct BumbleChatsView: View {
    @Environment(\.router) var router
    
    @State private var allUsers: [User] = []
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding(16)
                
                matchQueueSection
                
                recentChatsSection
                
                Spacer()
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .task {
            await getUsers()
        }
    }
    
    private func getUsers() async {
        guard allUsers.isEmpty else { return }
        
        do {
            allUsers = try await DataCenter.getUsers()
        } catch {
            
        }
    }
    
    private var header: some View {
        HStack {
            Image(systemName: "line.horizontal.3")
                .asButton {
                    router.dismissScreen()
                }
            Spacer()
            Image(systemName: "magnifyingglass")
        }
        .font(.title)
        .fontWeight(.medium)
    }
    
    private var matchQueueSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 0) {
                Text("Match Queue")
                Text(" (\(allUsers.count))")
                    .foregroundStyle(.bumbleGray)
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleProfileImageView(
                            imageName: user.image,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random()
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
            .frame(height: 100)
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var recentChatsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 0) {
                Text("Chats")
                Text(" (Recent)")
                    .foregroundStyle(.bumbleGray)
                
                Spacer()
                
                Image(systemName: "line.horizontal.3.decrease")
                    .font(.title3)
            }
            .padding(.horizontal, 16)
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleChatPreviewView(
                            imageName: user.image,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random(),
                            userName: user.firstName,
                            lastChatMessage: user.aboutMe,
                            isYourMove: Bool.random()
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    RouterView { _ in
        BumbleChatsView()
    }
}
