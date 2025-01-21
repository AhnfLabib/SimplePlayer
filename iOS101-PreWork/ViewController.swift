//
//  ViewController.swift
//  iOS101-PreWork
//
//  Created by Ahnaf Labib on 1/1/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var albumArtImageView: UIImageView!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    private let playerManager = PlayerManager.shared
    private var progressTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        playerManager.setup()
        setupProgressTimer()
    }
    
    private func setupUI() {
        // Configure album art image view
        albumArtImageView.layer.cornerRadius = 20
        albumArtImageView.clipsToBounds = true
        albumArtImageView.layer.shadowColor = UIColor.black.cgColor
        albumArtImageView.layer.shadowOffset = CGSize(width: 0, height: 2)
        albumArtImageView.layer.shadowRadius = 4
        albumArtImageView.layer.shadowOpacity = 0.3
        
        // Configure progress bar
        progressBar.layer.cornerRadius = 2
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 2
        progressBar.subviews[1].clipsToBounds = true
        
        updateSongInfo()
        updatePlayPauseButton(isPlaying: false)
    }
    
    private func setupProgressTimer() {
        progressTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.updateProgress()
        }
    }
    
    private func updateProgress() {
        guard let player = playerManager.currentPlayer else { return }
        let progress = Float(player.currentTime / player.duration)
        progressBar.progress = progress
        
        // Update time labels
        currentTimeLabel.text = formatTime(player.currentTime)
        totalTimeLabel.text = formatTime(player.duration)
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    private func updateSongInfo() {
        let currentSong = playerManager.currentSong
        songTitleLabel.text = currentSong.title
        artistLabel.text = currentSong.artist
    }
    
    private func updatePlayPauseButton(isPlaying: Bool) {
        let imageName = isPlaying ? "pause.circle.fill" : "play.circle.fill"
        let configuration = UIImage.SymbolConfiguration(pointSize: 40)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        playPauseButton.setImage(image, for: .normal)
    }
    
    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        let isPlaying = playerManager.playPause()
        updatePlayPauseButton(isPlaying: isPlaying)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        playerManager.nextSong()
        updateSongInfo()
        updatePlayPauseButton(isPlaying: false)
        progressBar.progress = 0
    }
}

