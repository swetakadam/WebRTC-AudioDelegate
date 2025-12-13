# WebRTC with Audio Delegate

Custom WebRTC iOS framework with audio delegate support for real-time transcription.

## Features

- ✅ Separate local (microphone) and remote (peer) audio streams
- ✅ Real-time PCM16 audio buffer access
- ✅ `RTCAudioDelegate` protocol for easy integration
- ✅ Support for iPhone, iPad, and Simulator (arm64 & x86_64)
- ✅ Built on WebRTC M120

## Installation

### Swift Package Manager

In Xcode:
1. File → Add Package Dependencies
2. Enter: `https://github.com/swetakadam/WebRTC-AudioDelegate`
3. Select version and add to your project

Or in `Package.swift`:
```swift
dependencies: [
    .package(url: "https://github.com/swetakadam/WebRTC-AudioDelegate", from: "1.0.0")
]
```

## Usage
```swift
import WebRTC
import AVFoundation

class TranscriptionManager: NSObject, RTCAudioDelegate {
    private var peerConnection: RTCPeerConnection?
    
    func setup() {
        let factory = RTCPeerConnectionFactory()
        let config = RTCConfiguration()
        
        peerConnection = factory.peerConnection(
            with: config,
            constraints: RTCMediaConstraints(mandatoryConstraints: nil, optionalConstraints: nil),
            delegate: self
        )
        
        // Set audio delegate - automatically connects to audio device
        peerConnection?.audioDelegate = self
    }
    
    // MARK: - RTCAudioDelegate
    
    func didCaptureAudioData(_ audioData: Data, 
                            sampleRate: Int, 
                            channels: Int, 
                            streamType: RTCAudioStreamType) {
        if streamType == .local {
            // User's microphone audio - display in right bubble
            transcribeLocal(audioData)
        } else {
            // Remote peer audio - display in left bubble
            transcribeRemote(audioData)
        }
    }
}
```

## Audio Format

- Format: PCM16 (Int16)
- Sample Rate: 48000 Hz or 16000 Hz
- Channels: 1 (mono)
- Buffer size: ~960 bytes per callback (20ms at 48kHz)

## Requirements

- iOS 14.0+
- Xcode 15.0+
- Swift 5.9+

## System Frameworks Required

The package automatically links these frameworks:
- AudioToolbox
- AVFoundation
- CoreAudio
- CoreMedia
- CoreVideo
- VideoToolbox
- Metal
- MetalKit

## Permissions

Add to your `Info.plist`:
```xml
<key>NSMicrophoneUsageDescription</key>
<string>We need microphone access for voice calls</string>
```

## What's Modified

This is a fork of WebRTC with the following additions:

1. **RTCAudioDelegate.h** - Protocol for audio callbacks
2. **RTCPeerConnection.audioDelegate** - Property to set delegate
3. **Auto-registration** - Setting audioDelegate automatically connects to audio device
4. **Separate streams** - Local and remote audio delivered separately

## License

BSD 3-Clause License (same as WebRTC)

## Credits

Based on [WebRTC](https://webrtc.org/) by Google
