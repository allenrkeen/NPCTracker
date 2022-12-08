//
//  NPCItem.swift
//  DnDNPCTracker
//
//  Created by Allen Keen on 12/5/22.
//

import Foundation
import SwiftUI

struct NPCListItem: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var npc: NPC
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(npc.name ?? "Unknown Name")
                Text(npc.location ?? "").font(.subheadline)
            }
            Spacer()
            Text(npc.race ?? "")
        }.padding()
    }
}


struct NPCItem_Previews: PreviewProvider {
    static var previews: some View {
        NPCListItem(npc: npcProvider().npc)
    }
}
