//
//  ContentView.swift
//  SwiftUIForm
//
//  Created by Chang Sophia on 4/11/20.
//  Copyright © 2020 Chang Sophia. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSettings: Bool = false
    @State private var selectedEngine: Engine?
    
    @State var engines = [
         Engine(name: "Annie", image:"Annie"),
         Engine(name: "Arthur", image:"Arthur"),
         Engine(name: "Ashima", image:"Ashima"),
         Engine(name: "Bash", image:"Bash"),
         Engine(name: "Belle", image:"Belle"),
         Engine(name: "Ben", image:"Ben"),
         Engine(name: "Bertie", image:"Bertie"),
         Engine(name: "Bill", image:"Bill"),
         Engine(name: "Billy", image:"Billy"),
         Engine(name: "Butch", image:"Butch"),
         Engine(name: "Carlos", image:"Carlos"),
         Engine(name: "Charlie", image:"Charlie"),
         Engine(name: "Clarabel", image:"Clarabel"),
         Engine(name: "Colin", image:"Colin"),
         Engine(name: "Daisy", image:"Daisy"),
         Engine(name: "Dart", image:"Dart"),
         Engine(name: "Dash", image:"Dash"),
         Engine(name: "Den", image:"Den"),
         Engine(name: "Dennis", image:"Dennis"),
         Engine(name: "Diesel", image:"Diesel"),
         Engine(name: "Donald", image:"Donald"),
         Engine(name: "Douglas", image:"Douglas"),
         Engine(name: "Duck", image:"Duck"),
         Engine(name: "Duncan", image:"Duncan"),
         Engine(name: "Edward", image:"Edward"),
         Engine(name: "Elizabeth", image:"Elizabeth"),
         Engine(name: "Emily", image:"Emily"),
         Engine(name: "Etienne", image:"Etienne"),
         Engine(name: "Fergus", image:"Fergus"),
         Engine(name: "Frankie", image:"Frankie"),
         Engine(name: "Fredinand", image:"Fredinand"),
         Engine(name: "Gordon", image:"Gordon"),
         Engine(name: "Henry", image:"Henry"),
         Engine(name: "Iron Bert", image:"Iron Bert"),
         Engine(name: "Iron's arry", image:"Iron's arry"),
         Engine(name: "James", image:"James"),
         Engine(name: "Mike", image:"Mike"),
         Engine(name: "Percy", image:"Percy"),
         Engine(name: "Rex", image:"Rex"),
         Engine(name: "Ryan", image:"Ryan"),
         Engine(name: "Thomas", image:"Thomas"),
         Engine(name: "Toby", image:"Toby")
     
     ]


   

    var body: some View {
        NavigationView {
            List {
                ForEach(engines) { engine in
                    BasicImageRow(engine: engine)
                        .contextMenu {
                            
                            Button(action: {
                                self.buyAlready(item: engine)
                            }) {
                                HStack {
                                    Text("buyAlready")
                                    Image(systemName: "checkmark.seal.fill")
                                }
                            }
                            Button(action: {
                                self.delete(item: engine)
                            }) {
                                HStack {
                                    Text("Delete")
                                    Image(systemName: "trash")
                                }
                            }
                            
                            Button(action: {
                                self.isFavorite(item: engine)
                            }) {
                                HStack {
                                    Text("Favorite")
                                    Image(systemName: "star")
                                }
                            }
                        }
                            .onTapGesture {
                                self.selectedEngine = engine
                               }
                        }
                    .onDelete { (indexSet) in
                        self.engines.remove(atOffsets: indexSet)
                        }
                    }
                 .navigationBarTitle("Engine")
        }
        .navigationBarItems(trailing:
            Button(action: {
                self.showSettings = true
            }, label: {
                Image(systemName: "gear").font(.title)
                    .foregroundColor(.black)
            })
        )
            .sheet(isPresented: $showSettings) {
                SettingView()
        }
    }

     private func delete(item engine: Engine) {
            if let index = self.engines.firstIndex(where: {
                $0.id == engine.id }) {
                self.engines.remove(at: index)
            }
        }
    private func isFavorite(item engine: Engine) {
            if let index = self.engines.firstIndex(where: {
                $0.id == engine.id }) {
                self.engines[index].isFavorite.toggle()
            }
            }
    private func buyAlready(item engine: Engine) {
        if let index = self.engines.firstIndex(where: {
            $0.id == engine.id}) {
            self.engines[index].buyAlready.toggle()
        }
    }
}

struct Engine: Identifiable {
    var id = UUID()  //.id, avoid duplicated
    var name: String
    var image: String
    var isFavorite: Bool = false
    var buyAlready: Bool = false

}

struct BasicImageRow: View {
    var engine: Engine
    
    var body: some View {
        
                   HStack {
                       Image(engine.image)
                       .resizable()
                       .frame(width: 40, height:40)
                       .clipShape(Circle())
                       .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        HStack {
                          Text(engine.name)
                            .font(.system(.title, design: .rounded))
                            .bold()
                          
                   }
                        Spacer()
                        .layoutPriority(-100)
                        
                        if engine.buyAlready {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.red)
                        }
                        
                        if engine.isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
               }
           }
 }
       }
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
