//
//  StartMenu.swift
//  Windows XP
//
//  Created by Jordan Singer on 7/22/20.
//

import SwiftUI
import AVFoundation

struct StartMenu: View {
    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Text("Jordan Singer")
                Spacer()
            }
            .shadow(color: Color(UIColor.black.withAlphaComponent(0.4)), radius: 2, x: 0, y: 1)
            .font(.title2)
            .padding()
            .foregroundColor(.white)
            .modifier(BlueBar())
            
            Divider()
            
            HStack(spacing: 0) {
                VStack(spacing: 16) {
                    AppIcon(label: "Internet Explorer", subtitle: "Internet Explorer", icon: "safari.fill", color: .blue)
                    AppIcon(label: "E-mail", subtitle: "Outlook Express", icon: "envelope.circle.fill", color: .blue)
                    Divider()
                    
                    Group {
                        AppIcon(label: "Media Player", icon: "play.circle.fill", color: .green)
                        AppIcon(label: "Paint", icon: "paintpalette.fill", color: .pink)
                        AppIcon(label: "Movie Maker", icon: "play.rectangle.fill", color: .blue)
                        AppIcon(label: "Wordpad", icon: "doc.on.clipboard.fill", color: .gray)
                        AppIcon(label: "Games", icon: "gamecontroller.fill", color: .blue)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 24) {
                        Spacer()
                        Text("All Programs")
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        Image(systemName: "play.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.green)
                        Spacer()
                    }
                    .padding(.vertical, 4)
                    
                    Spacer()
                }
                .padding()
                .frame(width: 270)
                .background(Color.white)
                
                Divider()
                
                VStack(spacing: 24) {
                    Group {
                        SystemIcon(label: "My Documents", icon: "folder.fill", color: .blue)
                        SystemIcon(label: "My Pictures", icon: "photo.fill.on.rectangle.fill", color: .blue)
                        SystemIcon(label: "My Music", icon: "music.note.house.fill", color: .blue)
                        SystemIcon(label: "My iPad", icon: "apps.ipad", color: .blue)
                    }
                    
                    Divider()
                    
                    SystemIcon(label: "Control Center", icon: "gearshape.fill", color: .blue, bold: false)
                    
                    Divider()
                    
                    SystemIcon(label: "Help and Support", icon: "questionmark.circle.fill", color: .blue, bold: false)
                    SystemIcon(label: "Search", icon: "magnifyingglass", color: .blue, bold: false)
                    SystemIcon(label: "Run...", icon: "macwindow", color: .blue, bold: false)
                    
                    Spacer()
                }
                .padding()
                .frame(width: 270)
                .background(Color(#colorLiteral(red: 0.8980392217636108, green: 0.9607843160629272, blue: 0.9960784316062927, alpha: 1)))
            }
            
            Divider()
            
            HStack(spacing: 20) {
                Spacer()
                
                HStack {
                    ToolbarControlIcon(color: .yellow) {
                        Image(systemName: "key.fill")
                            .font(.system(size: 18, weight: .bold))
                    }
                    Text("Log Off")
                }
                
                Button(action: {
                    let sound = Bundle.main.path(forResource: "shutdown", ofType: "mp3")
                    self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    audioPlayer.play()
                }) {
                    HStack {
                        ToolbarControlIcon(color: .red) {
                            Image(systemName: "power")
                                .font(.system(size: 18, weight: .bold))
                        }
                        Text("Shut Down")
                    }
                }
            }
            .padding()
            .foregroundColor(.white)
            .modifier(BlueBar())
        }
        .frame(width: 540, height: 640)
        .cornerRadius(12, corners: [.topLeft, .topRight])
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(#colorLiteral(red: 0.18039216101169586, green: 0.3607843220233917, blue: 0.8196078538894653, alpha: 1)), lineWidth: 3)
                .padding(1)
        )
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.2)), radius: 8, x: 0, y: 4)
        .onAppear {
            let sound = Bundle.main.path(forResource: "balloon", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            audioPlayer.play()
        }
    }
}

struct AppIcon: View {
    var label: String
    var subtitle: String?
    var icon: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 32))
                .foregroundColor(color)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(label)
                    .font(.headline)
                    .foregroundColor(.black)
                    .fontWeight(subtitle == nil ? .regular : .semibold)
                
                if subtitle != nil {
                    Text(subtitle ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
        }
    }
}

struct SystemIcon: View {
    var label: String
    var subtitle: String?
    var icon: String
    var color: Color
    var bold = true
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(color)
                .frame(width: 24, height: 24)
            
            VStack(alignment: .leading) {
                Text(label)
                    .font(.headline)
                    .foregroundColor(.black)
                    .fontWeight(bold ? .semibold : .regular)
                
                if subtitle != nil {
                    Text(subtitle ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
        }
    }
}

struct StartMenu_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}
