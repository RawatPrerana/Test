//
//  fetchingData.swift
//  Test
//
//  Created by Prerana on 10/01/23.
//

import CoreData
import SwiftUI

struct Response: Codable {
    var status: Bool
    var obj: [Result]
}

struct Result:Codable {
        let _id: String
       let created_at: Double
        let updated_at: Double
        let deleted: Bool
        let question: String
        let answer: String

    enum codingKeys: CodingKey{
        case id
        case created_at
        case updated_at
        case deleted
        case question
        case answer
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try container.decode(String.self, forKey: ._id)
        self.created_at = try container.decode(Double.self, forKey: .created_at)
        self.updated_at = try container.decode(Double.self, forKey: .updated_at)
        self.deleted = try container.decode(Bool.self, forKey: .deleted)
        self.question = try container.decode(String.self, forKey: .question)
        self.answer = try container.decode(String.self, forKey: .answer)
    }
}

struct fetchingData: View {
    @State var tapped: Bool = false

    @FetchRequest(sortDescriptors: []) var obj : FetchedResults<CoreDataResult>
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        VStack(alignment: .leading){
            Text("Help")
                .font(.largeTitle).bold()
                .padding(.leading)
            List{
                ForEach(obj) { item in
                    Text(item.question ?? "invalid")
                        .font(.headline)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.5)){
                                self.tapped.toggle()
                            }
                        }
                    if tapped{
                        Text(item.answer ?? "invalid")
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.5)){
                                    self.tapped.toggle()
                                }
                            }
                    }
                }
            }
            .task {
//                await loadData()
            }
        }
    }

    func loadData() async {
        var results: [Result]
        guard let url = URL(string: "https://app.duolop.com/utils/help?updated_at=0.0") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.obj
                results.forEach{ result in
                    Task{
                        await insert(from:result)
                    }
                }
            }
        } catch {
            print("Invalid data")
        }
    }

    func insert(from result: Result) async{

        let entity = CoreDataResult(context: moc)
        entity.id = result._id
        entity.question = result.question
        entity.answer = result.answer
        do{
            try moc.save()
        }catch{
            print("Error occured")
        }
    }

}


struct fetchingData_Previews: PreviewProvider {
    static var previews: some View {
        fetchingData()
    }
}


