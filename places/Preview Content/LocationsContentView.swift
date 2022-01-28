//
//  LocationsView.swift
//  places
//
//  Created by MercWareTecnology on 27/1/22.
//

import SwiftUI

struct LocationsContentView: View {
    @State private var locations: Locations?
    
    var body: some View {
        
            VStack(alignment: .trailing){
            Spacer()
//            Text(locations?.id ?? "nada")
//            Text(locations?.author ?? "nada")
//            Text(locations?.en ?? "nada")
                
                
                Text(locations?.name ?? "nada")
                Text(locations?.location ?? "nada")
                Text(locations?.description ?? "nada")
                Text(locations?.latitude ?? "nada")
                Text(locations?.longitude ?? "nada")
                Text(locations?.rating ?? "nada")
               
               
        
             
            
            }
        
            .onAppear(perform: loadData)
                
            }
            
        
        
    
    
    private func loadData()
    {
        guard let url = URL(string:"https://visitrd.000webhostapp.com/locations.json") else {
            return
        }
        URLSession.shared.dataTask(with: url){
            data,response,error in guard let data = data else {
                return
            }
            if let decodeData = try?JSONDecoder().decode(Locations.self,from: data){
                
                DispatchQueue.main.async {
                self.locations = decodeData
                    
                }
                
                
            }
            
        }.resume()
        
    }
}

struct Locations: Decodable{
    var name : String
    var location: String
    var description: String
    var latitude: String
    var longitude:String
    var rating: String
    var images: [String:[String]]?
    var comments: String
    
//    var id:String
//    var author:String
//    var en:String
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsContentView()
    }
}
