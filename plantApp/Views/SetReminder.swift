//
//  SetReminder.swift
//  plantApp
//
//  Created by hajer on 30/05/1448 AH.
//

import SwiftUI
import SwiftData

struct SetReminder: View {
    @Environment(\.modelContext) var context
    @State var PlantName:String = "";
    @State private var closeSheet=false
    @State var room: Room = .bedroom
    @State var light: Light = .fullSun
    @State var wateringDays: WateringDay = .everyDay
    @State var water: Water = .one
    let viewModel = PlantViewModel()
    var plant: Plant? = nil
    
    
    var body: some View {
        NavigationStack{
            
            
            
            
            
            
            Form {
                Section {
                    HStack {
                        Text("Plant Name")
                        TextField("Pothos", text: $PlantName)
                    }
                }

                Section {
                    Picker(selection: $room) {
                        ForEach(Room.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    } label: {
                        Label("Room", systemImage: Room.icon)
                            .foregroundStyle(.white)
                    }

                    Picker(selection: $light) {
                        ForEach(Light.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    } label: {
                        Label("Light", systemImage: Light.icon)
                            .foregroundStyle(.white)
                    }
                }

                Section {
                    Picker(selection: $wateringDays) {
                        ForEach(WateringDay.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    } label: {
                        Label("Watering Days", systemImage: WateringDay.icon)
                            .foregroundStyle(.white)
                    }

                    Picker(selection: $water) {
                        ForEach(Water.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    } label: {
                        Label("Water", systemImage: Water.icon)
                            .foregroundStyle(.white)
                    }
                
                }
                if let plant {
                    Section{
                        Button(role : .destructive){
                            viewModel.deletePlant(context: context, plant: plant)
                            closeSheet=true
                        }label: {
                          Text("Delete Reminder")
                                .frame(maxWidth: .infinity)
                          
                        }
                
                    }
                }
            }                    .toolbar{
                        ToolbarItem(placement:.confirmationAction){
                            Button{
                                if let plant{
                                    viewModel.updatePlant(context: context, plant: plant, name: PlantName, room: room, light: light, wateringDay: wateringDays, water: water)
                                    
                                }else{
                                    viewModel.addPlant(context: context, name: PlantName, room: room, light: light, wateringDays: wateringDays, water: water)
                                    
                                }
                                closeSheet=true
                            }label: {
                                Image(systemName:"checkmark")
                                    .foregroundStyle(.white)
                            }
                           
                            .buttonStyle(.glassProminent)
                            .tint(.greenApp)
                            .disabled(PlantName.isEmpty)
                           
                        }
                        ToolbarItem(placement:.cancellationAction){
                            
                            Button{
                                closeSheet=true
                            }label:{
                                Image(systemName: "xmark")
                                    .foregroundStyle(.white)
                                
                            }
                          
                            
                            
                            .fullScreenCover(isPresented: $closeSheet){
                                NoReminders()
                            }
                            
                            
                        }
                   
                        
                    }
            .onAppear{
                if let plant{
                    PlantName=plant.plantName
                    room = plant.room
                    light = plant.light
                    wateringDays = plant.wateringDays
                    water = plant.water
                    
                }
                
            }
            
            
                }
            }
        }
        
    
        #Preview {
            SetReminder()
        }
