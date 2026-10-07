import ActivityKit
import SwiftUI
import WidgetKit

@main
struct IOStestLiveActivityBundle: WidgetBundle {
    var body: some Widget {
        HelloLiveActivity()
    }
}

struct HelloLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: HelloAttributes.self) { context in
            Text(context.state.message)
                .font(.headline)
                .padding()
                .activityBackgroundTint(.indigo)
                .activitySystemActionForegroundColor(.white)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    Text(context.state.message)
                        .font(.headline)
                }
            } compactLeading: {
                Image(systemName: "hand.wave.fill")
                    .foregroundStyle(.yellow)
            } compactTrailing: {
                Text("Hi")
            } minimal: {
                Image(systemName: "hand.wave.fill")
                    .foregroundStyle(.yellow)
            }
            .keylineTint(.indigo)
        }
    }
}
