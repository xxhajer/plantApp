//
//  PlantViewModel.swift
//  plantApp
//
//  Created by hajer on 05/06/1448 AH.
//

import SwiftData

class PlantViewModel {
    
    func addPlant(context: ModelContext, name: String, room: Room, light: Light, wateringDays: WateringDay, water: Water) {
        
        let newPlant = Plant(name: name, room: room, light: light, wateringDays: wateringDays, water: water)
        context.insert(newPlant)
        try? context.save()
    }
    
    func deletePlant(context: ModelContext,plant: Plant){
        context.delete(plant)
        try? context.save()
    }
    func updatePlant(context:ModelContext,plant: Plant, name: String , room :Room, light :Light, wateringDay: WateringDay, water: Water){
        
        plant.plantName = name
        plant.room = room
        plant.light = light
        plant.wateringDays = wateringDay
        plant.water = water
        try? context.save()
        
    }
}
