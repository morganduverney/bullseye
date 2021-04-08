//
//  ContentView.swift
//  Bullseye
//
//  Created by Morgan Edmonds on 3/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .kerning(2.0)
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text("89")
                .kerning(-1.0)
                .fontWeight(.black)
                .font(.largeTitle)
            HStack {
                Text("1")
                    .bold()
                Slider(value: .constant(50), in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
                    .bold()
                    .multilineTextAlignment(.center)
            }
            .alert(isPresented: $alertIsVisible, content: {
                return Alert(title: Text("Hello there!"), message: Text("This is my first alert."), dismissButton: .default(Text("Awesome!")))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
