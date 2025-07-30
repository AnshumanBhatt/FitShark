//
//  HomeViewModel.swift
//  FitShark
//
//  Created by Anshuman Bhatt on 29/07/25.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    
     let healthManager = HealthManager.shared
    
    @Published var calories:Int = 0
    @Published var exercise:Int = 0
    @Published var Stand:Int = 0
    
    @Published var mocktivities = [
        Activity(id: 0, title: "Today Steps", subtitle: "Goal 12, 000", image: "figure.walk",tintColor: .green, amount: "9812"),
        Activity(id: 1, title: "Today Steps", subtitle: "Goal 12, 000", image: "figure.walk",tintColor: .blue, amount: "5555"),
        Activity(id: 2, title: "Today Steps", subtitle: "Goal 12, 000", image: "figure.run",tintColor: .red, amount: "66")    ]
    
    @Published var mockWorkouts = [
        Workout(id: 0, title: "Running", image: "figure.run", duration: "51mins", date: "Aug 1", calories: "512 kcal", tintColor: .cyan),
        Workout(id: 1, title: "Running", image: "figure.run", duration: "2 hr", date: "5 Aug", calories: "2140 kcal", tintColor: .red)
    ]
    
    init() {
        Task {
            do {
                try await healthManager.requestHealthKitAccess()
               
            } catch {
                print(error.localizedDescription)
            }
        }
      
    }
    func fetchTodayCalories() {
        healthManager.fetchTodayCaloriesBurned { result in
            switch result {
            case .success(let calories):
                DispatchQueue.main.async {
                    self.calories = Int(calories)
                }
               
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    
    func fetchTodayExercise() {
        healthManager.fetchTodayExercisetime { result in
            switch result {
            case .success(let exercise):
                DispatchQueue.main.async {
                    self.exercise = Int(exercise)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
        }
        
    }
    
    
    func fetchTodayStandHour() {
        healthManager.fetchTodayStandHours { result in
            switch result {
            case .success(let hours):
                DispatchQueue.main.async {
                    self.Stand = Int(hours) 
                }
                
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        
    }
}
