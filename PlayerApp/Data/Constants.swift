//
//  Constants.swift
//  PlayerApp
//
//  Created by Catherine Volohova on 23.01.2023.
//

import Foundation

struct Constants {
    // ADD YOUR API KEY
    static var apiKey = ""
    // ADD YOUR PLAYLIST ID
    static var playlistId = ""
    static var apiUrl = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.playlistId)&key=\(Constants.apiKey)"
    static var videoCellId = "VideoCell"
    static var embedVideoUrl = "https://www.youtube.com/embed/"
}
