//
//  SoundPlayer.swift
//  Test
//
//  Created by Prerana on 25/01/23.
//

import SwiftUI
import AVFoundation
import AVKit

struct SoundPlayer: View {
    @State var isPresented = false
    @State var sound: SystemSoundID
    var body: some View {
        VStack{
            player()
            Button("Play1"){
                let url = URL(fileURLWithPath: "/System/Library/Audio/UISounds/Calypso.caf")
                var soundID: SystemSoundID = 1006
                AudioServicesCreateSystemSoundID(url as CFURL, &soundID)
                AudioServicesPlaySystemSound(soundID)

            }
            
            Button("Play2"){
                // Without vibration, but very quiet?
                var systemSoundID : SystemSoundID = 1007 // doesnt matter; edit path instead
                let url = URL(fileURLWithPath: "/System/Library/Audio/UISounds/Calypso.caf")
                AudioServicesCreateSystemSoundID(url as CFURL, &systemSoundID)
                AudioServicesPlaySystemSound(systemSoundID)
            }
            
            Button(action: {
                self.isPresented = true
                if isPresented == true{
                    var systemSoundID : SystemSoundID = sound // doesnt matter; edit path instead
                    let url = URL(fileURLWithPath: "/System/Library/Audio/UISounds/sms-received5.caf")
                    AudioServicesCreateSystemSoundID(url as CFURL, &systemSoundID)
                    AudioServicesPlaySystemSound(systemSoundID)
                }
            }){
                Text("Alert")
            }
            .alert(isPresented: $isPresented, content: {
                   return Alert(title: Text("Sound Alert"), message: Text("This alert is being presented with a sound"))
            })
            
            Text("Sound settings")
                .padding(.top)
            
            Button("Default"){
                sound = 1007
            }
            
            Button("Sound1"){
                sound = 1022
            }
        }
    }
    
    func play() {
        let url = URL(fileURLWithPath: "/System/Library/Audio/UISounds/sms-received1.caf")
        do {
            reps_sound_effect = try AVAudioPlayer(contentsOf: url)
            reps_sound_effect?.play()
        } catch {
            print("\(error)")
    }
        
    }
}


var audioPlayer = AVAudioPlayer()
struct player: View{
    @State var isPlaying : Bool = false
    
    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
            let url = URL(fileURLWithPath: "/System/Library/Audio/UISounds/sms-received1.caf")
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            }catch {
                print("Eror")
            }
        }, label: {
            if isPlaying {
                Image(systemName: "pause")
                    .font(Font.system(.largeTitle).bold())
            }else {
                Image(systemName: "play.fill")
                    .font(Font.system(.largeTitle).bold())
            }
        })
    }
}

    // get the list of system sounds, there are other sounds in folders beside /New
    let soundPath = "/System/Library/Audio/UISounds/New"
    var arrayOFSoundNames = [String] ()

    // MARK: - scene setup
    func doAnyAdditionalSetup()
    {
       arrayOFSoundNames = getSoundList()
    }
    // MARK: - File manager methods
    func getSoundList() -> [String] {
        var result:[String] = []
        let fileManager = FileManager.default
        let enumerator:FileManager.DirectoryEnumerator =
        fileManager.enumerator(atPath: soundPath)!
        for url in enumerator.allObjects {
            let newString = "/System/Library/Audio/UISounds/sms-received5.caf"
        result.append(newString)
    }
        return result
    }

    // copy sound file to /Library/Sounds directory, it will be auto detect and played when a push notification arrive
    func copyFileToDirectory(fromPath:String, fileName:String) {
        let fileManager = FileManager.default

    do {
        let libraryDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let directoryPath = "\(libraryDir.first!)/Sounds"
        try fileManager.createDirectory(atPath: directoryPath, withIntermediateDirectories: true, attributes: nil)

        let systemSoundPath = "\(fromPath)/\(fileName)"
        let notificationSoundPath = "\(directoryPath)/notification.caf"

        let fileExist = fileManager.fileExists(atPath: notificationSoundPath)
        if (fileExist) {
            try fileManager.removeItem(atPath: notificationSoundPath)
        }
        try fileManager.copyItem(atPath: systemSoundPath, toPath: notificationSoundPath)
        }
        catch let error as NSError {
            print("Error: \(error)")
        }
    }

    // MARK: - tableview methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arrayOFSoundNames.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        copyFileToDirectory(fromPath:soundPath, fileName:arrayOFSoundNames[indexPath.row])

    }


var reps_sound_effect : AVAudioPlayer!


struct SoundPlayer_Previews: PreviewProvider {
    static var previews: some View {
        SoundPlayer(sound: 1022)
    }
}
