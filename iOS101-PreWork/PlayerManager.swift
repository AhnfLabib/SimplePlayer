import Foundation
import AVFoundation

class PlayerManager {
    static let shared = PlayerManager()
    
    private var player: AVAudioPlayer?
    private var songs: [Song] = [
        Song(title: "Burden", artist: "Opeth", filename: "song1"),
        Song(title: "December er Shohore", artist: "Solo Artist", filename: "song2"),
        Song(title: "Shajo Tumi", artist: "Conclusion", filename: "song3")
    ]
    
    private var currentSongIndex = 0
    
    private init() {}
    
    var currentSong: Song {
        return songs[currentSongIndex]
    }
    
    func playPause() -> Bool {
        if player?.isPlaying == true {
            player?.pause()
            return false
        } else {
            player?.play()
            return true
        }
    }
    
    func nextSong() {
        currentSongIndex = (currentSongIndex + 1) % songs.count
        loadCurrentSong()
    }
    
    private func loadCurrentSong() {
        guard let path = Bundle.main.path(forResource: songs[currentSongIndex].filename, ofType: "mp3") else {
            print("Could not find song file")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
        } catch {
            print("Error loading song: \(error)")
        }
    }
    
    func setup() {
        loadCurrentSong()
    }
} 