//
//  ContentView.swift
//  ImagePicker-SwiftUI
//
//  Created by devadmin on 09.11.21.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingPhotoPicker = false
    @State private var profileImage = UIImage(systemName: "person")!
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: profileImage)
                .resizable()
                .frame(width: 200, height: 200)
                .scaledToFit()
                .clipShape(Circle())
                .padding()
                .onTapGesture {
                    isShowingPhotoPicker = true
                }
            Spacer()
        }.navigationTitle("Profile")
            .sheet(isPresented: $isShowingPhotoPicker) {
                ImagePicker(image: $profileImage)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }.preferredColorScheme(.dark)
    }
}
