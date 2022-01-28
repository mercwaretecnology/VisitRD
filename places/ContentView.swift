//
//  ContentView.swift
//  places
//
//  Created by MercWareTecnology on 21/12/21.
//

import SwiftUI
import MapKit
import WebKit
struct ContentView: View {
   
    //creando lista de valores
    @State private var locations: [Location] = []
    
   
    var body: some View {
            
        NavigationView{
              
            VStack(alignment:.leading){
                         
                    List(locations){locations in
                        AsyncImage(url: URL(string: locations.images))
                        {image in
                            image.resizable()
                                .aspectRatio(contentMode:.fit)
                                .padding()
                              } placeholder: {
                            Color.red
                        }
                              .frame(width: 128, height: 128)
                              .mask(RoundedRectangle(cornerRadius: 0))
                              .padding(0)
                    
                         Text(locations.place)
                            .font(.caption)
                            .bold()
                        Text(locations.desc)
                            .font(.caption2)
                            .bold()
                            .padding()
//                        Text(locations.location)
//                            .font(.caption2)
//                            .bold()
//                        Text("\(locations.latitude) \(locations.longitude)")
//                           .font(.caption2)
//                           .bold()
//                        Text(locations.rating)
//                           .font(.caption)
//                           .bold()
                        
                       
                    
                    }.navigationTitle("Places ")
                             
                                                           
                }
        }
            
            .onAppear(perform: readFile)
        
    }
    
    private func readFile() {
        if let url = URL(string: "https://visitrd.000webhostapp.com/locations.json"),
            let  data = try? Data(contentsOf: url){
            let  decoder = JSONDecoder()
            if let jsonData = try? decoder.decode(JSONData.self, from: data){
                self.locations = jsonData.locations
               
            }
            
        }
    }
}





struct JSONData: Decodable {
    let locations:[Location]
    
}
struct Location: Decodable,Identifiable {
    let id:Int
    let place:String
    let desc:String
    //let location:String
    //let latitude:Double
   // let longitude:Double
    //let rating: String
    var images: String
    //let comments: String
    }

    
struct WebView : UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        
        
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView().previewLayout(
//                    .fixed(width: 50, height: 50)
//                )
        
        ContentView()
        
        
        
        
        
        
        
    }
    
}
  

  

