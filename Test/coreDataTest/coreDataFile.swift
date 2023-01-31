//
//  coreDataFile.swift
//  Test
//
//  Created by Prerana on 18/01/23.
//
import CoreData
import SwiftUI



struct coreDataFile: View {
    @StateObject var dataController = DataController()
    @FetchRequest(sortDescriptors: []) var coreDataResults : FetchedResults<CoreDataResult>
    @Environment(\.managedObjectContext) var moc

    var body: some View {
        VStack {
            List(coreDataResults){ i in
                Text(i.question ?? "invalid")
            }
//            Text(text.question ?? "in")
        }
    }
    func insert(from result: Result) async{
        let entity = CoreDataResult(context: moc)
        entity.id = result._id
        entity.question = result.question
        entity.answer = result.answer
        try? moc.save()
    }
}

struct coreDataFile_Previews: PreviewProvider {
    static var previews: some View {
        coreDataFile()
    }
}
