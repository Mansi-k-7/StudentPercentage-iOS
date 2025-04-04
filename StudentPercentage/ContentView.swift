//
//  ContentView.swift
//  StudentPercentage
//
//  Created by Mansi K on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var students = ""
    @State private var groupA = ""
    @State private var groupB = ""
    @State private var groupC = ""
    @State private var groupD = ""
    @State private var groupF = ""
    @State private var toastShown = false
    @State private var result: String = ""
    @State private var floatValue: Float? = nil
    @State private var result2: [Double] = []
    @State private var showGraph = false
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Total number of students")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.blue)
                
                TextField("Enter here", text: $students)
                    .keyboardType(.numberPad)
                    .onChange(of: students) { newValue in
                        if let validValue = numberFormatter.number(from: newValue)?.doubleValue {
                            floatValue = Float(validValue)
                        } else {
                            floatValue = nil
                        }
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                createGroupInputField("Group A students", text: $groupA)
                createGroupInputField("Group B students", text: $groupB)
                createGroupInputField("Group C students", text: $groupC)
                createGroupInputField("Group D students", text: $groupD)
                createGroupInputField("Group F students", text: $groupF)
                
                Button("Compute") {
                    result = computePercentages()
                    toastShown = true
                }
                .padding(5)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
                .shadow(radius: 5)
                
                NavigationLink(destination: Computation(percentages: result2), isActive: $showGraph) {
                    Button("Plot") {
                        showGraph = true
                    }
                    .padding(5)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                }
                
                Spacer()
                
                if toastShown {
                    ToastView(resultText: result)
                        .onTapGesture {
                            toastShown = false
                        }
                }
            }
            .padding()
        }
    }
    
    func createGroupInputField(_ label: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading) {
            Text(label)
                .foregroundColor(Color.blue)
            TextField("Enter here", text: text)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    func computePercentages() -> String {
        guard let totalStudents = Int(students), totalStudents > 0 else {
            result = "Invalid input"
            toastShown = true
            return result
        }
        
        let groupATotal = Int(groupA) ?? 0
        let groupBTotal = Int(groupB) ?? 0
        let groupCTotal = Int(groupC) ?? 0
        let groupDTotal = Int(groupD) ?? 0
        let groupFTotal = Int(groupF) ?? 0
        
        let totalGroupStudents = groupATotal + groupBTotal + groupCTotal + groupDTotal + groupFTotal

        if totalGroupStudents != totalStudents {
            result = "Total does not add up"
            toastShown = true
            return result
        }
        
        let percentageA = Double(groupATotal) / Double(totalStudents) * 100
        let percentageB = Double(groupBTotal) / Double(totalStudents) * 100
        let percentageC = Double(groupCTotal) / Double(totalStudents) * 100
        let percentageD = Double(groupDTotal) / Double(totalStudents) * 100
        let percentageF = Double(groupFTotal) / Double(totalStudents) * 100
        
        result = """
                    Group A: \(String(format: "%.2f", percentageA))%
                    Group B: \(String(format: "%.2f", percentageB))%
                    Group C: \(String(format: "%.2f", percentageC))%
                    Group D: \(String(format: "%.2f", percentageD))%
                    Group F: \(String(format: "%.2f", percentageF))%
                    """
        result2 = [percentageA, percentageB, percentageC, percentageD, percentageF]
        toastShown = true
        print(result)
        return result
    }
}

struct ToastView: View {
    var resultText: String?
    
    var body: some View {
        VStack {
            if let resultText = resultText {
                Text(resultText)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.top, 20)
                    .transition(.move(edge: .bottom))
                    .animation(.spring(), value: resultText)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    ContentView()
}
