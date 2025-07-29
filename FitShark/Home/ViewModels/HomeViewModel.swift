//
//  HomeViewModel.swift
//  FitShark
//
//  Created by Anshuman Bhatt on 29/07/25.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @State var calories:Int = 123
    @State var active:Int = 52
    @State var Stand:Int = 8
    
    @Published var mocktivities = [
        Activity(id: 0, title: "Today Steps", subtitle: "Goal 12, 000", image: "figure.walk",tintColor: .green, amount: "9812"),
        Activity(id: 1, title: "Today Steps", subtitle: "Goal 12, 000", image: "figure.walk",tintColor: .blue, amount: "5555"),
        Activity(id: 2, title: "Today Steps", subtitle: "Goal 12, 000", image: "figure.run",tintColor: .red, amount: "66")    ]
    
    @Published var mockWorkouts = [
        Workout(id: 0, title: "Running", image: "figure.run", duration: "51mins", date: "Aug 1", calories: "512 kcal", tintColor: .cyan),
        Workout(id: 1, title: "Running", image: "figure.run", duration: "2 hr", date: "5 Aug", calories: "2140 kcal", tintColor: .red)
    ]
    
}
