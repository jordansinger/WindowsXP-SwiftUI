//
//  MyComputer.swift
//  Windows XP
//
//  Created by Jordan Singer on 7/22/20.
//

import SwiftUI

struct MyComputer: View {
    var body: some View {
        VStack(spacing: 0) {
            WindowControls()
            
            HStack(spacing: 0) {
                WindowSidebar()
                Divider()
                Files()
                Spacer()
            }
        }
    }
}

struct WindowControls: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Text("File")
                Text("Edit")
                Text("View")
                Text("Favorites")
                Text("Tools")
                Text("Help")
                Spacer()
            }
            .foregroundColor(.black)
            .font(.system(size: 14))
            .padding(.horizontal)
            .frame(height: 32)
            
            Divider()
            
            HStack(spacing: 20) {
                HStack {
                    Image(systemName: "arrow.left.circle.fill")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(.gray)
                    
                    Text("Back")
                }
                
                Image(systemName: "chevron.down")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Image(systemName: "arrow.right.circle.fill")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(.gray)
                
                Image(systemName: "folder.fill.badge.plus")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.green)
                
                Divider()
                    .frame(height: 28)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.gray)
                    
                    Text("Search")
                }
                
                HStack {
                    Image(systemName: "mail.stack")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.gray)
                    
                    Text("Folders")
                }
                
                Divider()
                    .frame(height: 28)
                
                HStack(spacing: 8) {
                    Image(systemName: "keyboard.macwindow")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.blue)
                    
                    Image(systemName: "chevron.down")
                        .font(.caption)
                        .foregroundColor(.black)
                }
                
                Spacer()
            }
            .foregroundColor(.black)
            .font(.system(size: 14))
            .padding(12)
            
            Divider()
            
            HStack {
                Text("Address")
                    .foregroundColor(.gray)
                Spacer()
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: 24)
                    .overlay(
                        Rectangle()
                            .stroke(Color(#colorLiteral(red: 0.18039216101169586, green: 0.3607843220233917, blue: 0.8196078538894653, alpha: 1)).opacity(0.5), lineWidth: 1)
                    )
                    .overlay(
                        HStack {
                            Image(systemName: "apps.ipad")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.blue)
                            Text("My iPad")
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "arrow.down.square.fill")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.blue)
                        }
                        .padding(.horizontal, 4)
                    )
                
                
                HStack(spacing: 8) {
                    Image(systemName: "arrow.right.square.fill")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.green)
                    
                    Text("Go")
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .foregroundColor(.black)
            .font(.system(size: 14))
            
            Divider()
        }
        .background(
            LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.9529411792755127, green: 0.9607843160629272, blue: 0.9686274528503418, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.9333333373069763, green: 0.9215686321258545, blue: 0.8470588326454163, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0, y: 0.5),
                        endPoint: UnitPoint(x: 1, y: 0.5))
        )
    }
}

struct WindowSidebar: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                SidebarGroup(title: "System Tasks", icon: "chevron.up.circle.fill") {
                    Group {
                        HStack {
                            Image(systemName: "doc.text.fill")
                            Text("View system information")
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "shippingbox.fill")
                            Text("Add or remove programs")
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "gearshape.fill")
                            Text("Change a setting")
                            Spacer()
                        }
                    }
                }
                
                SidebarGroup(title: "Other Places", icon: "chevron.up.circle.fill") {
                    Group {
                        HStack {
                            Image(systemName: "network")
                            Text("My Network Places")
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "folder.fill")
                            Text("My Documents")
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "folder.fill.badge.person.crop")
                            Text("Shared Documents")
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "gearshape.fill")
                            Text("Control Panel")
                            Spacer()
                        }
                    }
                }
                    
                SidebarGroup(title: "Details", icon: "chevron.down.circle.fill") {
                    EmptyView()
                }
            }
            .padding()
        }
        .frame(width: 256)
        .background(
            LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.5372549295425415, green: 0.6549019813537598, blue: 0.9450980424880981, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.41960784792900085, green: 0.47058823704719543, blue: 0.843137264251709, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 1))
        )
    }
}

struct SidebarGroup<Content: View>: View {
    var title: String
    var icon: String
    let content: () -> Content
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: icon)
                    .font(.callout)
                    .foregroundColor(.white)
            }
            .padding(6)
            .background(
                LinearGradient(
                            gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 0.9490196108818054, green: 0.9607843160629272, blue: 0.9882352948188782, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 0.7764706015586853, green: 0.8235294222831726, blue: 0.95686274766922, alpha: 1)), location: 1)]),
                            startPoint: UnitPoint(x: 0, y: 0.5),
                            endPoint: UnitPoint(x: 1, y: 0.5))
            )
            
            VStack(spacing: 6) {
                content()
            }
            .font(.caption)
            .padding(12)
        }
        .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2431372549, blue: 0.7019607843, alpha: 1)))
        .background(
            Color(#colorLiteral(red: 0.843137264251709, green: 0.8745098114013672, blue: 0.9607843160629272, alpha: 1))
        )
        .cornerRadius(4, corners: [.topLeft, .topRight])
    }
}

struct Files: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Files Stored on This iPad")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Divider()
                    FileIcon(label: "Shared Documents", icon: "folder.fill")
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Hard Disk Drives")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Divider()
                    FileIcon(label: "Windows (C:)", icon: "externaldrive.fill")
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Network Drives")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Divider()
                    FileIcon(label: "Volume (E:)", icon: "externaldrive.fill.badge.icloud")
                }
                Spacer()
            }
            .foregroundColor(.black)
            .padding()
        }
    }
}

struct FileIcon: View {
    @State var label: String
    @State var icon: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundColor(.blue)
            Text(label)
                .font(.system(size: 12))
                .foregroundColor(.black)
        }
    }
}

struct MyComputer_Previews: PreviewProvider {
    static var previews: some View {
        MyComputer()
    }
}
