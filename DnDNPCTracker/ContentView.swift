//
//  ContentView.swift
//  DnDNPCTracker
//
//  Created by Allen Keen on 12/4/22.
//


import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var newPopover = false

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \NPC.date, ascending: true)],
        animation: .default)
    private var characters: FetchedResults<NPC>

    var body: some View {
        NavigationView {
            List {
                ForEach(characters) { character in
                    NavigationLink(destination: NPCView(npc: character)) {
                        NPCListItem(npc: character)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {newPopover = true}) {
                        Label("Add Item", systemImage: "plus")
                    }.popover(isPresented: $newPopover) {
                        newNPCView() {status, name, race, date, friendly, living, location, appearance, notes in
                            newPopover = false
                            if (status == "ok") {
                                addNPC(name: name, race: race, date: date, friendly: friendly, living: living, location: location, appearance: appearance, notes: notes)
                            }
                        }
                    }
                }
            }.navigationTitle("NPCs")
            Text("Select an item")
        }
    }

    private func addNPC(name: String, race: String, date: Date, friendly: Bool, living: Bool, location: String, appearance: String, notes: String) {
        withAnimation {
            let newNPC = NPC(context: viewContext)
            newNPC.name = name
            newNPC.race = race
            newNPC.date = date
            newNPC.friendly = friendly
            newNPC.living = living
            newNPC.location = location
            newNPC.appearance = appearance
            newNPC.notes = notes
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { characters[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
