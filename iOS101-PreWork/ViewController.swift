//
//  ViewController.swift
//  iOS101-PreWork
//
//  Created by Ahnaf Labib on 1/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    
    private let playerManager = PlayerManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        playerManager.setup()
    }
    
    private func setupUI() {
        updateSongInfo()
        playPauseButton.setTitle("Play", for: .normal)
    }
    
    private func updateSongInfo() {
        let currentSong = playerManager.currentSong
        songTitleLabel.text = currentSong.title
        artistLabel.text = currentSong.artist
    }
    
    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        let isPlaying = playerManager.playPause()
        playPauseButton.setTitle(isPlaying ? "Pause" : "Play", for: .normal)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        playerManager.nextSong()
        updateSongInfo()
        playPauseButton.setTitle("Play", for: .normal)
    }
}

