//
//  HealthManager.swift
//  FitShark
//
//  Created by Anshuman Bhatt on 29/07/25.
//

import SwiftUI
import HealthKit

extension Date {
    
    static var startofDay: Date {
        let calender = Calendar.current
        return calender.startOfDay(for: Date())
    }
}

class HealthManager {
    static let shared = HealthManager()
    
    let healthStore = HKHealthStore()
    
    private init () {
       
        Task {
            do {
                try await requestHealthKitAccess()
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    func requestHealthKitAccess() async throws {
        let calories = HKQuantityType(.activeEnergyBurned)
        let exercise = HKQuantityType(.appleExerciseTime)
        let stand = HKCategoryType(.appleStandHour)
        
        let healthTypes: Set = [calories , exercise, stand]
        try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
    }
    func fetchTodayCaloriesBurned(completion: @escaping(Result<Double, Error>) -> Void) {
         let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startofDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories , quantitySamplePredicate: predicate) { _, results, error in
            guard let quantity = results?.sumQuantity(), error == nil else {
                completion(.failure(NSError()))
                return
            }
            let calorieCount = quantity.doubleValue(for: .kilocalorie())
            completion(.success(calorieCount))
            
        }
        healthStore.execute(query)
    }
    
    func fetchTodayStandHours(completion: @escaping(Result<Int, Error>) -> Void) {
        let stand = HKCategoryType(.appleStandHour)
        let predicate = HKQuery.predicateForSamples(withStart: .startofDay, end: Date())
        let query = HKSampleQuery(sampleType: stand, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { _, results, error in
            guard let samples = results as? [HKCategorySample] , error == nil else {
                completion(.failure(NSError()))
                return
            }
            print(samples)
            print(samples.map({$0.value}))
            let standCount = samples.filter({$0.value == 0}).count
            
            completion(.success(2))
            
        }
        healthStore.execute(query)
    }
    func fetchTodayExercisetime(completion: @escaping(Result<Double, Error>) -> Void) {
        let exercise = HKQuantityType(.appleExerciseTime)
        let predicate = HKQuery.predicateForSamples(withStart: .startofDay, end: Date())
        let query = HKStatisticsQuery(quantityType: exercise , quantitySamplePredicate: predicate) { _, results, error in
            guard let quantity = results?.sumQuantity(), error == nil else {
                completion(.failure(NSError()))
                return
            }
            let exerciseTime = quantity.doubleValue(for: .minute() )
            completion(.success(exerciseTime))
            
        }
        healthStore.execute(query)
    }
}
