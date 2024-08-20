//
//  GamePlayWidgetBundle.swift
//  GamePlayWidget
//
//  Created by eng.omar on 20/08/2024.
//

import WidgetKit
import SwiftUI

@main
struct GamePlayWidgetBundle: WidgetBundle {
    var body: some Widget {
        GamePlayWidget()
        GamePlayWidgetLiveActivity()
    }
}
