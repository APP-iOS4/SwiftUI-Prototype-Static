//
//  CategoryButtonView.swift
//  StaticProject
//
//  Created by 이선준 on 2/21/24.
//

import SwiftUI

struct CategoryButtonView: View {
    @Binding var selectedCategory: Category?
    
    var currentColor: Color {
        selectedCategory == category ? Color("MainColor") : .black
    }
    
    let roomStore: RoomStore
    let category: Category
    
    var body: some View {
        Button(action: {
            if selectedCategory == category {
                selectedCategory = nil
            } else {
                selectedCategory = category
            }
            roomStore.selectedCategory = selectedCategory
            
            if let selectedCategory {
                print("selectedCategory: \(selectedCategory.rawValue)")
            } else {
                print("selectedCategory: nil")
            }
            
        }, label: {
            VStack {
                Image(systemName: "airplane.departure")
                    .frame(width: 90.0, height: 90.0)
                    .background(Color.gray)
                    .border(currentColor, width: 3)
                Text("\(category.rawValue)")
            }
        })
        .foregroundStyle(currentColor)
    }
}

#Preview {
    CategoryButtonView(selectedCategory: .constant(Category.Game), roomStore: RoomStore(), category: .Crafts)
}
