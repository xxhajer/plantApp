//
//  PlantViewModel.swift
//  plantApp
//
//  Created by hajer on 05/06/1448 AH.
//

import SwiftData

class PlantViewModel {
  let notificationService = NotificationService()
    func addPlant(context: ModelContext, name: String, room: Room, light: Light, wateringDays: WateringDay, water: Water) {
        
        let newPlant = Plant(name: name, room: room, light: light, wateringDays: wateringDays, water: water)
        context.insert(newPlant)
        try? context.save()
        notificationService.schedualReminder(plant: newPlant)
    }
    
    func deletePlant(context: ModelContext,plant: Plant){
        notificationService.cancelReminder(plant:plant)
        context.delete(plant)
        try? context.save()
    
    }
    func updatePlant(context:ModelContext,plant: Plant, name: String , room :Room, light :Light, wateringDay: WateringDay, water: Water){
        notificationService.cancelReminder(plant:plant)
        plant.plantName = name
        plant.room = room
        plant.light = light
        plant.wateringDays = wateringDay
        plant.water = water
       
        try? context.save()
        notificationService.schedualReminder(plant: plant)
        
    }
}
