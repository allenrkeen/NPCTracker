//
//  DetailEdit.swift
//  DnDNPCTracker
//
//  Created by Allen Keen on 12/5/22.
//

import SwiftUI
import Foundation

struct detailEditView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var npc: NPC
    
    @State var showAlert = false
    
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    TextField("Name", text: Binding($npc.name)!)
                    Picker("Race", selection: $npc.race){
                        ForEach(Race.allCases, id: \.self) {
                            race in Text(race.rawValue)
                        }
                    }
//                    TextField("Race", text: $race)
                    DatePicker("Date the Party Met Them", selection: Binding($npc.date)!, displayedComponents: [.date])
                    Toggle(isOn: $npc.friendly){
                        Text("Friendly to Party?")
                    }
                    Toggle(isOn: $npc.living){
                        Text("Still Alive?")
                    }
                    TextField("Location Met", text: Binding($npc.location)!)
                    TextField("Appearance", text: Binding($npc.appearance)!, axis: .vertical)
                        .textFieldStyle(.automatic)
                    TextField("Notes", text: Binding($npc.notes)!, axis: .vertical)
                        .textFieldStyle(.automatic)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)

        }
    }
}

struct detailEditView_Previews: PreviewProvider {
    static var previews: some View {
        detailEditView(npc: npcProvider().npc)
    }
}
