//
//  TLButton.swift
//  ToDoList
//
//  Created by Soham Ray on 06.10.24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)

                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Value", backgroundColor: .pink, action: {
        
    })
}
