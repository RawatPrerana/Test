//
//  jsonDecoder.swift
//  Test
//
//  Created by Prerana on 09/01/23.
//

import SwiftUI

struct response: Codable {
    var quotes: [Quote]
}

struct Quote:Codable{
    var id: Int
    var quote: String
    var author: String
}

struct jsonDecoder: View {
    @State private var quotes = [Quote]()
    var body: some View {
        NavigationView{
            List(quotes, id: \.id){ i in
                VStack{
                    Text(i.author)
                    Text(i.quote)
                }
            }
            .navigationTitle("Quotes")
            .task{
                await fetchData()
            }
        }
    }
    
    func fetchData() async{
        guard let url = URL(string: "https://dummyjson.com/quotes") else{
            print("Error")
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(response.self, from: data){
                quotes = decodedResponse.quotes
            }
        }catch{
            print("Not loading")
        }
    }
}

struct jsonDecoder_Previews: PreviewProvider {
    static var previews: some View {
        jsonDecoder()
    }
}
