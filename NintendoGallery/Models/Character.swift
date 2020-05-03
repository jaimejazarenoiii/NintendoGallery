//
//  Character.swift
//  NintendoGallery
//
//  Created by Jaime Jazareno III on 5/3/20.
//  Copyright © 2020 Jaime Jazareno III. All rights reserved.
//

import Foundation

struct Character: Codable {
    var amiibo: [Amiibo]

    struct Amiibo: Codable, Equatable {
        var amiiboSeries: String
        var character: String
        var gameSeries: String
        var image: String
    }
}

extension Character {
    static let template: Character = .init(amiibo: [])
}

extension Character.Amiibo {
    static let template: Character.Amiibo = .init(amiiboSeries: "",
                                                  character: "",
                                                  gameSeries: "",
                                                  image: "")
}
