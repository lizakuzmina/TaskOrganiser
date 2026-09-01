//
//  Design.swift
//  Oraniser
//
//  Created by Yelyzaveta Kuzmina on 06.06.2026.
//

import SwiftUI

let appBackgroundColor = Color("BackgroundColor")
let appAccentColor = Color("AccentColor")
let appSecondaryColor = Color("SecondaryColor")

let appColorOfIconsTask = Color("ColorIconsTask")

let appBackgroundGradient = LinearGradient(
    stops: [
        .init(color: Color("BackgroundTop"), location: 0.36),
        .init(color: Color("BackgroundBottom"), location: 1.0)
    ],
    startPoint: .top,
    endPoint: .bottom
)
