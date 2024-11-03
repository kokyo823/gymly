//
//  ContentView.swift
//  gymly
//
//  Created by 杉山誇京 on 2024/11/03.
//

import SwiftUI

struct ContentView: View {
    @State private var weight: Double = 0.0
    @State private var reps: Int = 0
    @State private var sets: [SetRecord] = []
    @State private var memo: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("ベンチプレス")
                .font(.headline)
                .bold()
            
            //記録・履歴のタブ部分
            PickerView(selectedTab: .constant(0))
            
            //kg・repsの編集部分
            VStack {
                HStack {
                    StepperButton(label: "-", action: { weight -= 0.5 })
                    Text("\(weight, specifier: "%.1f") kg")
                        .font(.largeTitle)
                        .bold()
                    StepperButton(label: "+", action: { weight += 0.5 })
                }
                
                HStack {
                    StepperButton(label: "-", action: { reps = max(reps - 1, 1) })
                    Text("\(reps) reps")
                        .font(.largeTitle)
                        .bold()
                    StepperButton(label: "+", action: { reps += 1 })
                }
            }
            
            HStack {
                Button("保存") {
                    saveSet()
                }
                .buttonStyle(SaveButtonStyle())
                
                Button("クリア") {
                    clearSets()
                }
                .buttonStyle(ClearButtonStyle())
            }
            
            List {
                ForEach(sets.indices, id: \.self) { index in
                    HStack {
                        Text("\(index + 1)")
                        Spacer()
                        Text("\(sets[index].weight, specifier: "%.1f") kg")
                        Spacer()
                        Text("\(sets[index].reps) reps")
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text("プライベートメモ")
                    .font(.headline)
                
                TextField("自分にのみ表示", text: $memo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
    
    func saveSet() {
        let newSet = SetRecord(weight: weight, reps: reps)
        sets.append(newSet)
    }
    
    func clearSets() {
        sets.removeAll()
    }
}

struct StepperButton: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.largeTitle)
                .frame(width: 60, height: 60)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
        }
    }
}

struct PickerView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            Button(action: { selectedTab = 0 }) {
                Text("記録")
                    .font(.body)
                    .foregroundColor(selectedTab == 0 ? ColorPalette.primaryForeground : ColorPalette.foreground)
                    .padding(.vertical, 6)
            }
            .frame(maxWidth: 140)
            .background(ColorPalette.primary)
            .cornerRadius(7)
            
            Button(action: { selectedTab = 1 }) {
                Text("履歴")
                    .font(.body)
                    .foregroundColor(selectedTab == 1 ? ColorPalette.primaryForeground : ColorPalette.foreground)
            }
            .frame(maxWidth: 140)
        }
        .padding(.vertical, 2)
        .padding(.horizontal, 2)
        .background(ColorPalette.border)
        .cornerRadius(8)
    }
}

struct SaveButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

struct ClearButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

struct SetRecord {
    let weight: Double
    let reps: Int
}

#Preview {
    ContentView()
}
