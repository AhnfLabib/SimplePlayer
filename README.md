# SimplePlayer - iOS Music Player App

## Description
SimplePlayer is a minimalist iOS music player application built with Swift. It provides a clean, user-friendly interface for playing music with basic playback controls.

## Features
- 🎵 Play/Pause functionality
- ⏭️ Skip to next track
- 📱 Clean and intuitive user interface
- 🔄 Automatic playlist looping
- 📊 Real-time display of current song and artist information

## Technologies Used
- Swift
- UIKit
- AVFoundation
- Interface Builder / Storyboard
- Auto Layout

## Installation
1. Clone this repository
2. Open `iOS101-PreWork.xcodeproj` in Xcode
3. Add your MP3 files to the project:
   - Rename them as `song1.mp3`, `song2.mp3`, and `song3.mp3`
   - Add them to the project navigator
   - Ensure "Copy items if needed" is selected
4. Update the song information in `PlayerManager.swift` to match your audio files
5. Build and run the project

## Requirements
- iOS 13.0+
- Xcode 12.0+
- Swift 5.0+

## Project Structure
- `ViewController.swift`: Main view controller handling UI interactions
- `PlayerManager.swift`: Singleton class managing audio playback
- `Song.swift`: Model structure for song information
- `Main.storyboard`: UI layout and design

## Future Enhancements
- Volume control
- Shuffle functionality
- Progress bar for tracking playback
- Previous track button
- Playlist management
- Album artwork display

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Author
Ahnaf Labib

## Acknowledgments
- This project was created as part of the iOS 101 Pre-work
- Thanks to CodePath for the project guidelines and support
