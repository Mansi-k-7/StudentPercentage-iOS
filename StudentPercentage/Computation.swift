//
//  Computation.swift
//  StudentPercentage
//
//  Created by Mansi K on 12/11/24.
//
import SwiftUI
struct Computation: View {
    var percentages: [Double]
    var body: some View {
        VStack {
            Text("Bar Graph")
                .font(.title)
                .padding()
            
            
            HStack(alignment: .bottom, spacing: 16) {
                ForEach(0..<percentages.count, id: \.self) { index in
                    VStack {
                        Spacer()
                        
                        Text(String(format: "%.2f%", percentages[index]))
                            .font(.system(size: 10))
                            .offset(y: -10)

                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.blue)
                            .frame(width: 33, height: CGFloat(percentages[index] * 6))
            
                        
                        Text(" \(Character(UnicodeScalar(65 + index)!))")
                            .font(.caption)
                    
                    }
                   
                    .padding()
                } .frame(maxHeight: .infinity)
            }
          
            Text("Groups")
                .font(.headline)
                .padding(.top, 16)
            
            Spacer()
        }
        .padding()
    }
}




