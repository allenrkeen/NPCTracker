//
//  races.swift
//  DnDNPCTracker
//
//  Created by Allen Keen on 12/5/22.
//

import SwiftUI

enum Race: String, CaseIterable {
    case Aarakocra = "Aarakocra"
    case Aasimar = "Assimar"
    case Bugbear = "Bugbear"
    case Centaur = "Centaur"
    case Changeling = "Changeling"
    case Dhampir = "Dhampir"
    case Dragonborn = "Dragonborn"
    case Dwarf = "Dwarf"
    case Elf = "Elf"
    case Firbolg = "Firbolg"
    case Genasi = "Genasi"
    case Gith = "Gith"
    case Gnome = "Gnome"
    case Goblin = "Goblin"
    case Goliath = "Goliath"
    case Hobgoblin = "Hobgoblin"
    case Human = "Human"
    case Kalashtar = "Kalashtar"
    case Kenku = "Kenku"
    case Kobold = "Kobold"
    case Leonin = "Leonin"
    case Lizardfolk = "Lizardfolk"
    case Loxodon = "Loxodon"
    case Minotaur = "Minotaur"
    case Orc = "Orc"
    case Satyr = "Satyr"
    case Shifter = "Shifter"
    case Simic = "Simic"
    case Tabaxi = "Tabaxi"
    case Tiefling = "Tiefling"
    case Tortle = "Tortle"
    case Triton = "Triton"
    case Vedalken = "Vedalken"
    case Verdan = "Verdan"
    case Warforged = "Warforged"
    case Yuanti = "Yuanti"
    case Other = "Other"
    
    var localized: LocalizedStringKey {LocalizedStringKey(self.rawValue)}
}
