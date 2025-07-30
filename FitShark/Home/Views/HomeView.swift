//
//  HomeView.swift
//  FitShark
//
//  Created by Anshuman Bhatt on 28/05/25.
//

import SwiftUI

struct HomeView: View {
   
    
    @StateObject var viewmodel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("Welcome")
                        .font(.largeTitle)
                        .padding()
                    
                    HStack {
                        
                        Spacer()
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading,spacing: 8) {
                                Text("Calorioes")
                                    .font(.callout)
                                    .bold()
                                    .foregroundStyle(.red)
                                
                                Text("\(viewmodel.calories)")
                                    .bold()
                            }
                            .padding(.bottom)
                            
                            VStack(alignment: .leading) {
                                Text("Active")
                                    .font(.callout)
                                    .bold()
                                    .foregroundStyle(.green)
                                
                                Text("\(viewmodel.exercise)")
                                    .bold()
                            }
                            .padding(.bottom)
                            
                            VStack(alignment: .leading) {
                                Text("Stand")
                                    .font(.callout)
                                    .bold()
                                    .foregroundStyle(.blue)
                                
                                Text("\(viewmodel.Stand)")
                                    .bold()
                            }
                            
                            
                        }
                        Spacer()
                        
                        ZStack {
                            ProgessCircleView(progress: $viewmodel.calories , color: .red, goal: 600)
                            ProgessCircleView(progress: $viewmodel.exercise , color: .green, goal: 60)
                                .padding(.all,20)
                            ProgessCircleView(progress: $viewmodel.Stand , color: .blue, goal: 12)
                                .padding(.all,40)
                        }
                        .padding(.horizontal)
                        Spacer()
                    }
                    .padding()
                    
                    HStack {
                        Text("Fitnes Activity")
                        Spacer()
                        
                        Button {
                            print("Show more")
                        } label: {
                            Text("Show more")
                                .padding(.all,10)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                        
                        ForEach(viewmodel.mocktivities, id: \.id) { activity in
                            ActivityCard(activity: activity)
                            
                        }
                        
                        
                        
                        
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("Recent Workouts")
                        Spacer()
                        
                        NavigationLink {
                            EmptyView()
                        } label: {
                            Text("Show more")
                                .padding(.all,10)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(20)
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    LazyVStack {
                        ForEach(viewmodel.mockWorkouts, id: \.id) {
                            workout in
                            WorkoutCard(workout: workout)
                        }
                    }
                    .padding(.bottom)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}


