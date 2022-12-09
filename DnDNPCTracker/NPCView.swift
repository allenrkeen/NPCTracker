//
//  NPCView.swift
//  DnDNPCTracker
//
//  Created by Allen Keen on 12/5/22.
//

import SwiftUI


struct NPCView: View {
    @State private var isEditView = false
    
    let dateFormatter = DateFormatter()
    var npc: NPC
    
    init(npc: NPC) {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.npc = npc
        
    }
    
    var body: some View {
        VStack(alignment: .leading){
            List{
                Section(header: Text("Name")){
                    HStack{
                        Text(npc.name ?? "Unknown Name")
                    }
                }
                Section(header: Text("Race")) {
                        HStack {
                            Text(npc.race ?? "")
                        }
                    }
                Section(header: Text("Date Met")) {
                        HStack {
                            Text(dateFormatter.string(from: npc.date ?? Date()))
                        }
                    }
                Section(header: Text("Friendliness")) {
                        if (npc.friendly == true) {
                            Text("\(npc.name!) is friendly to the party.")
                        } else {
                            Text("\(npc.name!) is not friendly to the party.")
                        }
                    }
                Section(header: Text("Alive")) {
                        if (npc.living == true) {
                            Text("\(npc.name!) is still alive!")
                        } else {
                            Text("\(npc.name!) is dead. ")
                        }
                    }
                Section(header: Text("Location")){
                    HStack{
                        Text("The party met \(npc.name ?? "Unkown Name") at \(npc.location ?? "")")
                    }
                }
                Section(header: Text("Appearance")){
                    HStack{
                        VStack(alignment: .leading){
                            Text(npc.appearance ?? "")
                        }
                    }
                }
                Section(header: Text("Notes")){
                    HStack{
                        VStack(alignment: .leading){
                            Text(npc.notes ?? "")
                        }
                    }
                }
            }.navigationTitle("NPC Details")
                .toolbar{
                    Button("Edit") {
                        isEditView = true
                    }
                }
                .sheet(isPresented: $isEditView) {
                    NavigationView {
                        detailEditView(npc: npc)
                            .navigationTitle(npc.name!)
                    }
                }
            }
        }
}


struct NPCView_Previews: PreviewProvider {
    static var previews: some View {
        NPCView(npc: npcProvider().npc)
    }
}

struct npcProvider {
    var npc = NPC(context: PersistenceController.preview.container.viewContext)
    init() {
        npc.name = "Billy Blue Jeans"
        npc.race = "Human"
        npc.date = Date()
        npc.friendly = true
        npc.living = true
        npc.location = "Mines of Moria"
        npc.appearance = "The bluest jeans you have ever seen"
        npc.notes = "There may be more than meets the eye with this one."
    }
}
