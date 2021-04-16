//
//  RoundedImageView.swift
//  Bullseye
//
//  Created by Morgan Duverney on 4/13/21.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    let systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle()
                    .strokeBorder(Color("StrokeColor"), lineWidth: 2.0)
                )
    }
}

struct RoundedImageViewFilled: View {
    let systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("BackgroundColor"))
            .frame(width: 56.0, height: 56.0)
            .background(
                Circle()
                    .fill(Color.white)
                )
    }
}

struct RoundedRectTextView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .foregroundColor(Color("TextColor"))
            .frame(width: 68.0, height: 56.0)
            .background(
                RoundedRectangle(cornerRadius: 21.0)
                    .strokeBorder(Color("StrokeColor"), lineWidth: 2.0)
                )
    }
}

struct RoundedView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
                RoundedImageViewStroked(systemName: "list.bullet")
                RoundedRectTextView(text: "999")
            }
            VStack {
                RoundedImageViewFilled(systemName: "arrow.counterclockwise")
                RoundedImageViewFilled(systemName: "list.bullet")
                RoundedRectTextView(text: "999")

            }
            .preferredColorScheme(.dark)
        }
    }
}
