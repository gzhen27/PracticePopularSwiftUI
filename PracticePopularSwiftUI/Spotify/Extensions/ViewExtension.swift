//
//  ViewExtension.swift
//  PracticePopularSwiftUI
//
//  Created by G Zhen on 11/24/24.
//
import SwiftUI

extension View {
    
    /// Wrap a View in a Button and add a custom ButtonStyle
    func asButton(scale: CGFloat = 0.95, opacity: Double = 1, brightness: Double = 0, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(ButtonStyleViewModifier(scale: scale, opacity: opacity, brightness: brightness))
    }
    
//    func asStretchyHeader(startingHeight: CGFloat) -> some View {
//        modifier(StretchyHeaderViewModifier(startingHeight: startingHeight))
//    }
    
    func themeColor(isSelected: Bool = false) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? Color.spotifyBlack : .spotifyWhite)
    }
    
//    func readingFrame(coordinateSpace: CoordinateSpace = .global, onChange: @escaping (_ frame: CGRect) -> ()) -> some View {
//        background(FrameReader(coordinationSpace: coordinateSpace, onChange: onChange))
//    }
}

struct ButtonStyleViewModifier: ButtonStyle {
    let scale: CGFloat
    let opacity: Double
    let brightness: Double
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scale : 1)
            .opacity(configuration.isPressed ? opacity : 1)
            .brightness(configuration.isPressed ? brightness : 0)
    }
}

struct StretchyHeaderViewModifier: ViewModifier {
    var startingHeight: CGFloat = 300
    var coordinateSpace: CoordinateSpace = .global
    
    func body(content: Content) -> some View {
        GeometryReader { geo in
            content
                .frame(width: geo.size.width, height: stretchedHeight(geo))
                .clipped()
                .offset(y: stretchedOffset(geo))
        }
    }
    
    private func yOffset(_ geo: GeometryProxy) -> CGFloat {
        geo.frame(in: coordinateSpace).minY
    }
    
    private func stretchedHeight(_ geo: GeometryProxy) -> CGFloat {
        let offset = yOffset(geo)
        return offset > 0 ? (startingHeight + offset) : startingHeight
    }
    
    private func stretchedOffset(_ geo: GeometryProxy) -> CGFloat {
        let offset = yOffset(geo)
        return offset > 0 ? -offset : 0
    }
}

struct FrameReader: View {
    let coordinationSpace: CoordinateSpace
    let onChange: (_ frame: CGRect) -> Void
    
    var body: some View {
        GeometryReader { geo in
            Text("")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear {
                    onChange(geo.frame(in: coordinationSpace))
                }
                .onChange(of: geo.frame(in: coordinationSpace), perform: onChange)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

