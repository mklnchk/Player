//
//  CacheManager.swift
//  PlayerApp
//
//  Created by Catherine Volohova on 23.01.2023.
//

import Foundation

class CacheManager {
    static var cache = [String: Data]()
    static func setVideoCache(_ url: String, _ data: Data?) {
        cache[url] = data
    }
    static func getVideoCache(_ url: String) -> Data? {
        return cache[url]
    }
}
