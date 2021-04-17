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
            .frame(width: Constants.General.roundedViewHeight, height: Constants.General.roundedViewHeight)
            .overlay(
                Circle()
                    .strokeBorder(Color("StrokeColor"), lineWidth: Constants.General.strokeLineWidth)
                )
    }
}

struct RoundedImageViewFilled: View {
    let systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("BackgroundColor"))
            .frame(width: Constants.General.roundedViewHeight, height: Constants.General.roundedViewHeight)
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
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .background(
                RoundedRectangle(cornerRadius: Constants.General.cornerRadius)
                    .strokeBorder(Color("StrokeColor"), lineWidth: Constants.General.strokeLineWidth)
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
