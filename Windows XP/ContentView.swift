//
//  ContentView.swift
//  Windows XP
//
//  Created by Jordan Singer on 7/22/20.
//

import SwiftUI
import AVFoundation

struct Desktop: View {
    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        WindowsXP()
            .background(
                Image("Bliss")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .statusBar(hidden: true)
        .onAppear {
            self.startupSound()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            self.startupSound()
        }
    }
    
    func startupSound() {
        let sound = Bundle.main.path(forResource: "boot", ofType: "mp3")
        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        audioPlayer.play()
    }
}

struct WindowsXP: View {
    @State var showStartMenu = false
    @State var showMyComputer = false
    
    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    HStack {
                        VStack(spacing: 24) {
                            DesktopFolder(label: "My Documents", icon: "folder.fill", color: .white)
                            DesktopFolder(label: "My Pictures", icon: "photo.fill.on.rectangle.fill", color: .white)
                            DesktopFolder(label: "My Music", icon: "music.note.house.fill", color: .white)
                                                        
                            Button(action: { showMyComputer.toggle() }) {
                                DesktopFolder(label: "My iPad", icon: "folder.fill", color: .white)
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        DesktopFolder(label: "Recycle Bin", icon: "trash.fill", color: .white)
                    }
                }
                .padding()
                .padding(.bottom, 64)
            }
            
            ZStack {
                if showMyComputer {
                    Window(title: "My iPad", icon: "apps.ipad") {
                        MyComputer()
                    }
                    .draggable()
                }
            }
            
            VStack(spacing: 0) {
                Spacer()
                HStack {
                    if showStartMenu {
                        StartMenu()
                    }
                    Spacer()
                }
                Taskbar(showStartMenu: $showStartMenu)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Taskbar: View {
    @Binding var showStartMenu: Bool
    
    var body: some View {
        HStack {
            Button(action: { showStartMenu.toggle()}) {
                Start(showStartMenu: $showStartMenu)
            }
            .buttonStyle(PlainButtonStyle())
            
            Task(title: "My iPad", icon: "apps.ipad")
            Spacer()
            Time()
        }
        .frame(height: 48)
        .modifier(BlueBar())
    }
}

struct Start: View {
    @Binding var showStartMenu: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "square.grid.2x2.fill")
            Text("start")
                .font(.headline)
        }
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.4)), radius: 2, x: 0, y: 1)
        .frame(height: 48)
        .padding(.horizontal)
        .padding(.trailing, 10)
        .foregroundColor(.white)
        .background(showStartMenu ? Color(#colorLiteral(red: 0.2235294133424759, green: 0.3843137323856354, blue: 0.1882352977991104, alpha: 1)) : Color(#colorLiteral(red: 0.3843137323856354, green: 0.6901960968971252, blue: 0.30980393290519714, alpha: 1)))
        .cornerRadius(16, corners: [.topRight, .bottomRight])
    }
}

struct Task: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(title)
                .fontWeight(.semibold)
        }
        .font(.system(size: 14))
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.4)), radius: 2, x: 0, y: 1)
        .frame(height: 36)
        .padding(.horizontal)
        .padding(.trailing, 32)
        .foregroundColor(.white)
        .background(Color(#colorLiteral(red: 0.1568627506494522, green: 0.3137255012989044, blue: 0.6941176652908325, alpha: 1)))
        .cornerRadius(4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color(UIColor.black), lineWidth: 3).opacity(0.1)
                .shadow(color: Color(UIColor.black.withAlphaComponent(0.5)), radius: 2, x: 0, y: 2)
                .clipShape(
                    RoundedRectangle(cornerRadius: 4)
                )
        )
    }
}

struct Time: View {
    var body: some View {
        HStack {
            Text("4:55")
                .font(.callout)
        }
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.4)), radius: 2, x: 0, y: 1)
        .frame(height: 48)
        .padding(.horizontal)
        .foregroundColor(.white)
        .background(
            Color.blue
        )
    }
}

struct Window<Content: View>: View {
    var title: String
    var icon: String
    let content: () -> Content
    
    var body: some View {
        VStack(spacing: 0) {
            Toolbar(title: title, icon: icon)
            content()
        }
        .frame(width: 720, height: 520)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(#colorLiteral(red: 0.18039216101169586, green: 0.3607843220233917, blue: 0.8196078538894653, alpha: 1)), lineWidth: 3)
                .padding(1)
        )
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.3)), radius: 24, x: 0, y: 12)
    }
}

struct Toolbar: View {
    var title: String
    var icon: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Group {
                    Image(systemName: icon)
                        .font(.system(size: 18, weight: .semibold))
                    Text(title)
                        .font(.headline)
                }
                .shadow(color: Color(UIColor.black.withAlphaComponent(0.4)), radius: 2, x: 0, y: 1)
                
                Spacer()
                
                ToolbarControls()
            }
            .foregroundColor(.white)
            .padding(.leading)
            .padding(.trailing, 12)
            .frame(height: 44)
        }
        .modifier(BlueBar())
    }
}

struct ToolbarControls: View {
    var body: some View {
        HStack(spacing: 6) {
            ToolbarControlIcon(color: Color.blue) {
                VStack {
                    Spacer()
                    Image(systemName: "minus")
                        .font(.system(size: 18, weight: .bold))
                }
                .padding(.bottom, 6)
            }
            
            ToolbarControlIcon(color: Color.blue) {
                Image(systemName: "square")
                    .font(.system(size: 18, weight: .bold))
            }
            
            ToolbarControlIcon(color: Color.red) {
                Image(systemName: "xmark")
                    .font(.system(size: 18, weight: .bold))
            }
        }
    }
}

struct ToolbarControlIcon<Content: View>: View {
    var color: Color
    let content: () -> Content
    
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(color)
            .overlay(
                content()
            )
            .frame(width: 28, height: 28)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.white, lineWidth: 1.5)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color(UIColor.black.withAlphaComponent(0.2)), lineWidth: 1.5)
                    .padding(1)
            )
            .overlay(
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(Color(UIColor.white.withAlphaComponent(0.3)))
                        .blur(radius: 4)
                    Spacer()
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(Color(UIColor.black.withAlphaComponent(0.3)))
                        .blur(radius: 4)
                }
            )
    }
}

struct DesktopFolder: View {
    var label: String
    var icon: String
    var color: Color
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 32))
            Text(label)
                .font(.footnote)
        }
        .foregroundColor(color)
        .shadow(color: .black, radius: 1, x: 0, y: 1)
    }
}

// draggable windows
struct DraggableView: ViewModifier {
    @State var offset = CGPoint(x: 0, y: 0)
    
    func body(content: Content) -> some View {
        content
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged { value in
                    self.offset.x += value.location.x - value.startLocation.x
                    self.offset.y += value.location.y - value.startLocation.y
            })
            .offset(x: offset.x, y: offset.y)
    }
}

extension View {
    func draggable() -> some View {
        return modifier(DraggableView())
    }
}

// custom rounded corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct BlueBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                            gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 0.24313725531101227, green: 0.4588235318660736, blue: 0.8470588326454163, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 0.18039216101169586, green: 0.3607843220233917, blue: 0.8196078538894653, alpha: 1)), location: 1)]),
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1))
            )
            .shadow(color: Color(UIColor.black.withAlphaComponent(0.2)), radius: 8, x: 0, y: 4)
            .overlay(
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Color(UIColor.black.withAlphaComponent(0.3)))
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(Color(UIColor.white.withAlphaComponent(0.3)))
                        .blur(radius: 2)
                    Spacer()
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(Color(UIColor.black.withAlphaComponent(0.3)))
                        .blur(radius: 4)
                }
            )
    }
}
