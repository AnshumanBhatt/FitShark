//
//  WorkoutCard.swift
//  FitShark
//
//  Created by Anshuman Bhatt on 29/07/25.
//

import SwiftUI

struct WorkoutCard: View {
    @State var workout: Workout
    var body: some View {
        HStack {
            Image(systemName: workout.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .foregroundColor(workout.tintColor)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
            
            VStack(spacing: 16) {
                HStack {
                    Text(workout.title)
                        .font(.title3)
                        .bold()
                    Spacer()
                    Text(workout.duration)
                }
                
                HStack {
                    Text(workout.date)
                    Spacer()
                    Text(workout.calories)
                }
            }
        }
        .padding()
    }
}

#Preview {
    WorkoutCard(workout: Workout(id: 0, title: "Running", image: "figure.run", duration: "23mins", date: "3Aug", calories: "341 kcal", tintColor: .cyan))
}
