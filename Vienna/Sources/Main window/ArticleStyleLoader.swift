//
//  ArticleStyleLoader.swift
//  Vienna
//
//  Copyright 2019
//

import Foundation

class ArticleStyleLoader: NSObject {

    private static var loaded = false

    private static var styles = NSMutableDictionary()

    @objc static var stylesMap: NSMutableDictionary {
        loaded ? styles : reloadStylesMap()
    }

    @objc
    static func reloadStylesMap() -> NSMutableDictionary {
        guard let path = Bundle.main.sharedSupportURL?.appendingPathComponent("Styles").path else {
            return [:]
        }
        loadMapFromPath(path, styles, true, nil)
        loadMapFromPath(Preferences.standard.stylesFolder, styles, true, nil)

        loaded = true

        return styles
    }
}
