//
//  Music.swift
//  Music
//
//  Created by 박성수 on 11/5/24.
//

import Foundation

struct Music: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var url: String = ""
    var data: Data
}
