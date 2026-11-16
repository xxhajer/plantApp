//
//  plantsClass.swift
//  plantApp
//
//  Created by hajer on 01/06/1448 AH.
//
import SwiftData

enum Room: String, CaseIterable, Codable {
    case bedroom = "Bedroom"
    case livingRoom = "Living Room"
    case kitchen = "Kitchen"

    static let icon = "location"
}

enum Light: String, CaseIterable, Codable {
    case fullSun = "Full sun"
    case haveSun = "Have sun"
    case noSun = "No sun"

    static let icon = "sun.max"
    }


enum WateringDay: String, CaseIterable, Codable {
    case everyDay = "Every day"
    case everyTwoDay = "Every Two Days"
    case everyThreeDay = "Every Three Days"

    static let icon = "drop"
}

enum Water: String, CaseIterable, Codable {
    case one = "20-50 ml"
    case two = "50-75 ml"
    case three = "75-100 ml"

    static let icon = "drop"

}

@Model
class Plant {
    var plantName: String
    var room: Room
    var light: Light
    var wateringDays: WateringDay
    var water: Water
    var isWatered : Bool

    init(name: String, room: Room, light: Light, wateringDays: WateringDay, water: Water, isWatered: Bool = false) {
        self.plantName = name
        self.room = room
        self.light = light
        self.wateringDays = wateringDays
        self.water = water
        self.isWatered = isWatered
        
    }
}
