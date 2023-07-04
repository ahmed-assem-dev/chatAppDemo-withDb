//
//  TopBarRow.swift
//  chatAppDemo
//
//  Created by Assem on 04/07/2023.
//

import SwiftUI

struct TopBarRow: View {
    var imageUrl = URL(string: "https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8")
    
    var body: some View {
        HStack{
            AsyncImage(url: imageUrl) {Image in
                Image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            }placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading, spacing: 5){
                Text("01123923843")
                    .font(.title2)
                    .bold()
                Text("online")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(uiImage: UIImage(systemName: "phone.fill")!)
        }
        .cornerRadius(20)
        .padding()
    }
}

struct TopBarRow_Previews: PreviewProvider {
    static var previews: some View {
        TopBarRow()
            .padding()
            .background(.green)
    }
}
