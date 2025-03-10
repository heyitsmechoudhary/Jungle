//
//  ContentView.swift
//  Jungle
//
//  Created by Rahul choudhary on 07/03/25.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let animals : [Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive : Bool = false
    let hapticImpact  = UIImpactFeedbackGenerator(style: .medium)
    
    //@State var gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State var gridColumn : Int = 1
    @State var toolBarIcon : String = "square.grid.2x2"
    
    //MARK: - FUNCTION
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn  = gridLayout.count
        print("Grid number of column : \(gridColumn)")
        
        //TOOLBAR IMAGE
        
        switch gridColumn {
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
    }

    //MARK: - BODY
    var body: some View {
        NavigationView {
            //MARK: - GROUP
            Group{
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListView(animal: animal)
                            }
                        }
                        CreditView()
                            .modifier(CenterModifier())
                    }//:LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid (columns: gridLayout, alignment: .center,spacing: 10){
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimaGridItemView(animal: animal)
                                }//:NAVLINK
                            }//: LOOP
                        }//:GRID
                        
                        .padding(10)
                        .animation(.easeIn)
                    }//: SCROLL
                }//:CONDITIONAL VIEW
            }//GROUP
            .navigationBarTitle("Jungle",displayMode: .large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing: 16){
                        //LIST
                        Button(action: {
                            print("List view is activated")
                            isGridViewActive = false
                            hapticImpact.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                            
                        })
                        
                        //GRID
                        Button(action: {
                            print("Grid view is activated")
                            isGridViewActive = true
                            hapticImpact.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor: .primary)
                            
                        })
                        
                        
                    }
                }//: BUTTONS
            }//: TOOLBAR
        }//: NAVIGATION
    }
}

//MARK: - PREVIEW
#Preview {
    ContentView()
}
