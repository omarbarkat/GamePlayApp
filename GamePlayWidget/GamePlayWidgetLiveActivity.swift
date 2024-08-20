//
//  GamePlayWidgetLiveActivity.swift
//  GamePlayWidget
//
//  Created by eng.omar on 20/08/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct GamePlayWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct GamePlayWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GamePlayWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension GamePlayWidgetAttributes {
    fileprivate static var preview: GamePlayWidgetAttributes {
        GamePlayWidgetAttributes(name: "World")
    }
}

extension GamePlayWidgetAttributes.ContentState {
    fileprivate static var smiley: GamePlayWidgetAttributes.ContentState {
        GamePlayWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: GamePlayWidgetAttributes.ContentState {
         GamePlayWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: GamePlayWidgetAttributes.preview) {
   GamePlayWidgetLiveActivity()
} contentStates: {
    GamePlayWidgetAttributes.ContentState.smiley
    GamePlayWidgetAttributes.ContentState.starEyes
}
