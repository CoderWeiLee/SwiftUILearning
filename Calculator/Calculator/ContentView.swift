//
//  ContentView.swift
//  Calculator
//
//  Created by 李伟 on 2020/12/11.
//

import SwiftUI
struct CalculatorButton: View {
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    
    var body: some View {
                    ZStack {
                        Button(action: action, label: {
                            Text(title)
                                .foregroundColor(.white
                                )
                                .font(.system(size: fontSize))
                                .frame(width: size.width, height: size.height)
                                .background(Color(backgroundColorName))
                        })
//                        RoundedRectangle(cornerRadius: size.width / 2).fill(Color.clear).frame(width: size.width, height: size.height)
                    }
                    .cornerRadius(size.width / 2)
    }
}

struct CalculatorButtonRow: Hashable,View {
    let row: [CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName) {
                    print("Button: \(item.title)")
                }
            }
        }
    }
}

struct CalculatorButtonPad: View {
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(row: row)
            }
        }
    }
}

struct ContentView: View {
    let scale: CGFloat = UIScreen.main.bounds.width / 414;
    var body: some View {
        VStack(spacing: 12){
            Spacer()
            Text("1111111111111")
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 20)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .lineLimit(1)
            CalculatorButtonPad()
                .padding(.bottom)
        }
        .scaleEffect(scale)
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environment(\.colorScheme, .dark)
        }
    }
}
