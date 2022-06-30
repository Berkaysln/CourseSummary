//
//  Multiply.swift
//  CourseSummary
//
//  Created by Berkay Yaslan on 28.06.2022.
//

import SwiftUI

struct Multiply: View {
  
  @State private var firstValue = Double()
  @State private var secondValue = Double()
  @State private var total = Double()
  
  let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter
  }()
  
  var body: some View {
    ZStack {
      VStack {
        Text("Multiplier")
          .font(.title)
          .fontWeight(.heavy)
          .ignoresSafeArea()
          .padding()
          .foregroundColor(Color("Neon Blue"))
        
        HStack {
          Text("First Value:")
            .foregroundColor(Color("Cornflower Blue"))
          Spacer()
        }
        .padding(.horizontal)
        
        TextField("", value: $firstValue, formatter: formatter)
          .textFieldStyle(.roundedBorder)
          .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Color("Neon Blue"), lineWidth: 2))
          .padding(.horizontal)
        
        HStack {
          Text("Second Value:")
            .foregroundColor(Color("Cornflower Blue"))
          Spacer()
        }
        .padding(.horizontal)
        
        TextField("", value: $secondValue, formatter: formatter)
          .textFieldStyle(.roundedBorder)
          .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(Color("Neon Blue"), lineWidth: 2))
          .padding(.horizontal)
        
        VStack {
          Text("Total:")
            .font(.title3)
            .foregroundColor(Color("Cornflower Blue"))
          Text("\(total, specifier: "%.1f")")
            .font(.title3)
            .fontWeight(.semibold)
            .padding()
            .frame(width: 120, height: 30)
            .background(.white)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
              .stroke(Color("Neon Blue"), lineWidth: 2))
            .lineLimit(1)
            .minimumScaleFactor(0.6)
        }
        .padding()
        .foregroundColor(Color("Neon Blue"))
        
        Button("Multiply") {
          total = firstValue * secondValue
        }
        .frame(width: 100, height: 12)
        .padding()
        .background(Color("Cornflower Blue"))
        .foregroundColor(Color("Light Cyan"))
        .cornerRadius(12)
        
        Spacer()

      }
        .background(Color("Periwinkle Crayola"))
    }
  }
}

struct Multiply_Previews: PreviewProvider {
  static var previews: some View {
    Multiply()
  }
}
