//
//  PlacesView.swift
//  places
//
//  Created by MercWareTecnology on 10/1/22.
//

import SwiftUI

struct PlacesView: View {
    @State private var SearcTxt = ""
    
    private var searchResults:[EmojiDetails]{
        let results = EmojiProvider.all()
        if SearcTxt.isEmpty {return results}
        return results.filter{
            $0.name.lowercased().contains(SearcTxt.lowercased())||$0.emoji.lowercased().contains(SearcTxt.lowercased())
        }
    }
    
    var body: some View {
        
        
        
        
        NavigationView{
            List(searchResults){emojiDetails in
                NavigationLink(destination: {
                    EmojiDetailsView(emojiDetails: emojiDetails)
                })
                {
                    Text("\(emojiDetails.emoji)\(emojiDetails.name)")
                    
                    .frame(width: 128, height: 128)
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                            .font(.title)
                        .padding(5)
                }
                }
               
                
            .navigationTitle("Buscar ")
            .searchable(text:$SearcTxt,placement:.navigationBarDrawer(displayMode:.always),
            prompt:"Buscar un elemento")        }
    }
}

struct EmojiDetailsView: View{
    let emojiDetails: EmojiDetails
    var body: some View{
        HStack{
            
            VStack(alignment:.leading) {
            Text("\(emojiDetails.emoji)\(emojiDetails.name)")
                .font(.largeTitle)
                .bold()
            Text("\(emojiDetails.description)")
                Spacer()
            }
            Spacer()
            
        }.padding([.leading, .trailing],24)
        
    }
    
}

struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
        //ContentView()
    }
}
