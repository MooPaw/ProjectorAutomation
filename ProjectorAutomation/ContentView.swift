//
//  ContentView.swift
//  ProjectorAutomation
//
//  Created by Butch Davis on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "car.circle")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Projector Automation")
            VStack(spacing: 20) {
                Divider()
                refreshPlan()
                Divider()
                slideLogo()
                slideBlack()
                slidePrevious()
                slideNext()
                Divider()
                projectorHelp()
            }
            .buttonStyle(.automatic)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct refreshPlan: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        Button {
            let url = URL (string: "projector://refresh/current-plan")!
            if(UIApplication.shared.canOpenURL(url)) {
                UIApplication.shared.open(url)
            }

        } label: {
            Label("Refresh Plan", systemImage: "arrow.clockwise.circle")
        }
    }
}

struct slideLogo: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        Button {
            if let url = URL(string: "projector://slide/logo") {
                openURL(url)
            }
        } label: {
            Label("Logo Slide", systemImage: "apple.logo")
        }
    }
}

struct slideBlack: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        Button {
            if let url = URL(string: "projector://slide/black") {
                openURL(url)
            }
        } label: {
            Label("Black Slide", systemImage: "square.fill")
        }
    }
}

struct slidePrevious: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        Button {
            if let url = URL(string: "projector://slide/previous") {
                openURL(url)
            }
        } label: {
            Label("Previous Slide", systemImage: "arrow.backward.circle")
        }
    }
}

struct slideNext: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        Button {
            if let url = URL(string: "projector://slide/next") {
                openURL(url)
            }
        } label: {
            Label("Next Slide", systemImage: "arrow.right.circle")
        }
    }
}

struct projectorHelp: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        Button {
            if let url = URL(string: "https://worshipstorm.zendesk.com/hc/en-us") {
                openURL(url)
            }
        } label: {
            Label("Projector Help", systemImage: "questionmark.circle")
        }
    }
}
