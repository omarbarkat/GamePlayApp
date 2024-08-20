//
//  GamePlayWidget.swift
//  GamePlayWidget
//
//  Created by eng.omar on 20/08/2024.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct GamePlayWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
                   Image("defulatFootball")
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .edgesIgnoringSafeArea(.all)
                   
                   VStack(alignment: .leading, spacing: 8) {
                       // App Name
                       Text("Omar barkat")
                           .font(.caption)
                           .bold()
                           .foregroundColor(.white)
                           .padding(.top, 20)

//                       // League Name
//                       if let league = entry.league {
//                           Text(league.name)
//                               .font(.headline)
//                               .foregroundColor(.white)
//                       } else {
//                           Text("Loading...")
//                               .font(.headline)
//                               .foregroundColor(.white)
//                       }

                       // Current Time
                       Text("\(entry.date, formatter: timeFormatter)")
                           .font(.caption)
                           .foregroundColor(.white)
                           .padding(.top, 110)

                       Spacer()
                   }
                   .padding()
               }
           }
    
}
private let timeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a"
    return formatter
}()
struct GamePlayWidget: Widget {
    let kind: String = "GamePlayWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            GamePlayWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    GamePlayWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}
