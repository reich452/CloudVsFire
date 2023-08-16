//
//  PrimaryButtonStyle.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    let fontWeight: Font.Weight
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .padding()
            .font(.system(.callout, weight: fontWeight))
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .mask { RoundedRectangle(cornerRadius: 17, style: .continuous) }
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

private struct PrimaryTestButton: View {
    
    var body: some View {
        
        Button("Test This") {
            
        }.buttonStyle(PrimaryButtonStyle(fontWeight: .semibold))
    }
}

#Preview {
    PrimaryTestButton()
}
