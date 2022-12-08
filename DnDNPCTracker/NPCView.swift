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
            HStack{
                Text("Name:")
                Text(npc.name ?? "Unknown Name")
                Spacer()
            }.padding(.horizontal)
            HStack{
                Text("Race:")
                Text(npc.race ?? "")
            }.padding(.horizontal)
            HStack{
                Text("Date Met:")
                Text(dateFormatter.string(from: npc.date ?? Date()))
            }.padding(.horizontal)
            HStack{
                if (npc.friendly == true) {
                    Text("\(npc.name!) is friendly to the party.")
                } else {
                    Text("\(npc.name!) is not friendly to the party.")
                }
            }.padding(.horizontal)
            HStack{
                if (npc.living == true) {
                    Text("\(npc.name!) is still alive!")
                } else {
                    Text("\(npc.name!) is dead. ")
                }
            }.padding(.horizontal)
            HStack{
                Text("The party met \(npc.name ?? "Unkown Name") at \(npc.location ?? "")")
            }.padding(.horizontal)
            HStack{
                VStack(alignment: .leading){
                    Text("Appearance:")
                    Text(npc.appearance ?? "")
                }
            }.padding(.horizontal)
            HStack{
                VStack(alignment: .leading){
                    Text("Notes:")
                    Text(npc.notes ?? "")
                }
            }.padding(.horizontal)
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
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Save") {
                                    isEditView = false
                                }
                            }
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
