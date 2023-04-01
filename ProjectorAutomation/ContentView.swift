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
            if #available(iOS 15.0, *) {
                VStack {
                    resetCache()
                    refreshPlan()
                    projectorHelp()
                }
                .buttonStyle(.bordered)
            } else {
                VStack {
                    resetCache()
                    refreshPlan()
                    projectorHelp()
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct resetCache: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        Button {
            let url = URL (string: "projector://reset/cache")!
            if(UIApplication.shared.canOpenURL(url)) {
                UIApplication.shared.open(url)
            }
            
        } label: {
            Label("Reset Cache", systemImage: "digitalcrown.press")
        }
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
