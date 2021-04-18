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
            .foregroundColor(Color("FilledTextColor"))
            .frame(width: Constants.General.roundedViewHeight, height: Constants.General.roundedViewHeight)
            .background(
                Circle()
                    .fill(Color("FilledBackgroundColor"))
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

struct RoundedTextView: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewHeight, height: Constants.General.roundedViewHeight)
            .background(
                Circle()
                    .strokeBorder(Color("RowStrokeColor"), lineWidth: Constants.General.strokeLineWidth)
                )
    }
}

struct RoundedView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
                RoundedImageViewFilled(systemName: "list.bullet")
                RoundedRectTextView(text: "999")
                RoundedTextView(text: "1")
            }
            VStack {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
                RoundedImageViewFilled(systemName: "list.bullet")
                RoundedRectTextView(text: "999")
                RoundedTextView(text: "1")

            }
            .preferredColorScheme(.dark)
        }
    }
}
