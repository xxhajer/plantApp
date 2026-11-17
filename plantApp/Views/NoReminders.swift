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
    @Environment(\.modelContext) var context
    @State var selectedPlant: Plant? = nil
    let viewModel = PlantViewModel()
    var waterCount: Int {
    
        
        return plants.filter{plant in
            plant.isWatered}.count   }
    
    var progress: Double { return Double(waterCount)/Double(plants.count)}
    
    var body: some View {
        VStack(spacing: 0){
            VStack(alignment: .leading,spacing: 12){
                Text("My Plants 🌱")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .overlay(.gray)
                
                if plants.isEmpty{
                    Text("No reminders set yet.. ")
                        .bold()
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .font(.title2)
                }else if waterCount == plants.count{
                    Text("All Done! 🎉")
                        .bold()
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .font(.title2)
            }else{
                    VStack{
                        Text(waterCount==0 ? "Your plants are waiting for a sip 💦" : "\(waterCount) of your plants feel loved today ✨")
                            .font(.subheadline)
                            .padding(.top,16)
                            
                        
                        
                        ProgressView(value: progress)
                            .tint(.progress)
                            .padding(.horizontal,16)
                        List(plants) { plant in
                            HStack(alignment: .center, spacing: 14) {
                                Button{
                                    plant.isWatered.toggle() }label: {
                                        Image(systemName:plant.isWatered ? "checkmark.circle.fill" : "circle")
                                    }
                                    .buttonStyle(.plain)
                                    .font(.system(size: 26, weight: .light))
                                    .foregroundStyle(plant.isWatered ? .check : .gray)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    HStack(spacing: 4) {
                                        Image(systemName: Room.icon)
                                        Text("in \(plant.room.rawValue)")
                                    }
                                    .font(.system(size: 15))
                                    .foregroundStyle(.gray)
                                    
                                    Text(plant.plantName)
                                        .font(.system(size: 28))
                                        .foregroundStyle(.white)
                                    
                                    HStack(spacing: 8) {
                                        HStack(spacing: 4) {
                                            Image(systemName: Light.icon)
                                            Text(plant.light.rawValue)
                                        }
                                        .font(.system(size: 14))
                                        .foregroundStyle(Color(red: 0.95, green: 0.90, blue: 0.65))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color(white: 0.12))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        
                                        HStack(spacing: 4) {
                                            Image(systemName: Water.icon)
                                            Text(plant.water.rawValue)
                                        }
                                        .font(.system(size: 14))
                                        .foregroundStyle(.white.opacity(0.85))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color(white: 0.12))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                    }
                                }
                            }
                            .padding(.vertical, 10)
                            .listRowBackground(Color.clear)
                            .listRowSeparatorTint(.gray.opacity(0.4))
                            .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                            .swipeActions{
                                Button(role:.destructive){
                                    viewModel.deletePlant(context: context, plant: plant)
                                }label:{
                                    Label("Delete",systemImage:"trash")
                                }
                            }
                            .onTapGesture{
                                selectedPlant = plant                            }
                        }
                        .listStyle(.plain)
                    }
                }
                
                        
                
            }
            .padding(.horizontal,16)
            .padding(.top,16)
        }
        .overlay(alignment: .bottomTrailing){ Button{showSheet = true} label :{Image(systemName: "plus")
            .font(.title2)
            .foregroundStyle(.white)}
                .buttonStyle(.glassProminent)
                .buttonBorderShape(.circle)
                .controlSize(.large)
                .tint(.greenApp)
                .padding(24)
            
            
        }.sheet(isPresented: $showSheet) {
            SetReminder()
        }
        .sheet (item: $selectedPlant){plant in
            SetReminder(plant: plant)}
        
        
        Spacer()
        
    }
    
}
#Preview {
    NoReminders()
}
