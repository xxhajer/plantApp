//
//  Noreminders.swift
//  plantApp
//
//  Created by hajer on 01/06/1448 AH.
//


import SwiftUI
import SwiftData


struct NoReminders : View {
    @Query var plants: [Plant]
    @State private var showSheet=false
    
    var body: some View {
        VStack(spacing: 0){
            VStack(alignment: .leading,spacing: 12){
                Text("My Plants 🌱")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                
                if plants.isEmpty{
                    Text("No reminders set yet.. ")
                        .bold()
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .font(.title2)
                }else{
                    
                    List(plants){ plant in
                      Text  (plant.plantName)
                        
                    }.listStyle(.plain)
                    
                    
                    
                }
                
                        
                
            }
            .padding(.horizontal,16)
            .padding(.top,16)
        }
        Spacer()
        
    }
}
#Preview {
    NoReminders()
}
