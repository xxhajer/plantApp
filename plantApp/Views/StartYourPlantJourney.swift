//
//  Start your plant journey! .swift
//  plantApp
//
//  Created by hajer on 30/05/1448 AH.
//

import SwiftUI

struct StartYourPlantJourney : View {
    @State private var showSheet=false

    var body: some View {
        VStack(spacing: 0){
            VStack(alignment: .leading,spacing: 12){
                Text("My Plants 🌱")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .overlay(.gray)

            }
            .padding(.horizontal,16)
            .padding(.top,16)
            
            
            Image(.plant)
                .resizable()
                .scaledToFit()
                .frame(width: 164, height: 200)


                .padding(.top, 60)
                
            
            Text("Start your plant journey! ")
                .font(.title2)
                .bold()
                .padding(.top,30)
            
            Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                .multilineTextAlignment(.center)
                .padding(.horizontal,40)
                .padding(.top,12)
                .font(.body)
                .foregroundStyle(.sec)
              
            
            Button{
                  showSheet=true
            }label:{
               Text("Set Plant Reminder")
                .frame(width: 250,height: 15)            }
            .buttonStyle(.glassProminent)
            .controlSize(.large)
            .tint(.greenApp)
            .padding(.top,60)
            .sheet(isPresented: $showSheet){
                SetReminder()
            }
            
                
            
            
            
            
        }
        
        Spacer()
    }
}

#Preview {
    StartYourPlantJourney()
}

