//
//  File.swift
//  DnDNPCTracker
//
//  Created by Allen Keen on 12/4/22.
//

import SwiftUI

struct newNPCView: View {
    @Environment(\.editMode) private var editMode
    
    @State var saveErrorAlert = false
    
    @State var status: String = ""
    @State var name: String = ""
    @State var race = Race.Aarakocra
    @State var date: Date = Date()
    @State var friendly: Bool = true
    @State var living: Bool = true
    @State var location: String = ""
    @State var appearance: String = ""
    @State var notes: String = ""
    
    let completionHandler: (String, String, String, Date, Bool, Bool, String, String, String) -> Void
    
    init(completionHandler: @escaping(String, String, String, Date, Bool, Bool, String, String, String) -> Void) {
        self.completionHandler = completionHandler
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    TextField("Name", text: $name)
                    Picker("Race", selection: $race){
                        ForEach(Race.allCases, id:\.self) {
                            race in Text(race.rawValue)
                        }
                    }.pickerStyle(WheelPickerStyle())
//                    TextField("Race", text: $race)
                    DatePicker("Date the Party Met Them", selection: $date, displayedComponents: [.date])
                    Toggle(isOn: $friendly){
                        Text("Friendly to Party?")
                    }
                    Toggle(isOn: $living){
                        Text("Still Alive?")
                    }
                    TextField("Location Met", text: $location)
                    TextField("Appearance", text: $appearance, axis: .vertical)
                        .textFieldStyle(.automatic)
                    TextField("Notes", text: $notes, axis: .vertical)
                        .textFieldStyle(.automatic)
                }
                    HStack{
                        Spacer()
                        Button(action: {if (name == "") {
                            saveErrorAlert = true
                        } else {
                            let racePicked: String = race.rawValue
                            completionHandler("ok", name, racePicked, date, friendly, living, location, appearance, notes)
                        }
                        }) {Text("Save")}
                        Spacer()
                    }
                .alert(isPresented: $saveErrorAlert) {
                    Alert(title: Text("Missing Information"), message: Text("Name is required"), dismissButton: .default(Text("Okay")))
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationBarTitle(Text("New NPC"))
                .navigationBarItems(trailing: Button(action: {
                    completionHandler("cancel","", "", Date(), false, false, "", "", "")
                },label: { Text("Cancel")
                }))
        }
    }
}


struct newNPC_Previews: PreviewProvider {
    static var previews: some View{
        newNPCView() {status, name, race, date, friendly, living, location, appearance, notes in
            
        }
    }
}
