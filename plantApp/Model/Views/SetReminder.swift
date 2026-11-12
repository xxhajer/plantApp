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
    
    var body: some View {
        NavigationStack{
            
            
            
            
            
            
            
            Form{
                HStack{
                    Text("Plant Name")
                    TextField("Pothos", text: $PlantName)
                }
                Section{
                    Picker("Room",selection:$room){
                        ForEach(Room.allCases,id: \.self){room in
                            Text(room.rawValue).tag(room)
                        }
                        
                    }
                    Picker("Light",selection:$light){
                        ForEach(Light.allCases,id: \.self){light in
                            Text(light.rawValue).tag(light)
                        }
                        
                        
                    }

                }
                   Section{
                            Picker("Watering Days",selection:$wateringDays){
                                Text("Every day").tag("Every day")
                                Text("1-2 day").tag("1-2 day")
                                Text("2-3 day").tag("2-3 day")
                            }
                            Picker("Water",selection:$water){
                                Text("20-50 ml").tag("20-50 ml")
                                Text("50-75 ml").tag("50-75 ml")
                                Text("75-100 ml").tag("75-100 ml")
                                
                            }
                            
                            
                        }
                        
                    }
                    .navigationTitle("Set Reminder")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement:.confirmationAction){
                            Button{
                                let newPlant=Plant(name:PlantName, room: room, light: light, WateringDays: wateringDays, water: Water)
                                context.insert(newPlant)
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
                            .buttonStyle(.glassProminent)
                            .fullScreenCover(isPresented: $closeSheet){
                                NoReminders()
                            }
                            
                        }
                        
                        
                        
                        
                        
                        
                    }
                }
            }
        }
        
    
        #Preview {
            SetReminder()
        }
        
    
