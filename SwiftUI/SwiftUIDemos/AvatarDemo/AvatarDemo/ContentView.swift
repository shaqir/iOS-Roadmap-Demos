//
//  ContentView.swift
//  AvatarDemo
//
//  Created by Sakir Saiyed on 27/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var people = Person.samples
    @State var participants = Person.samples.filter{$0.isParticipant}
    
    var body: some View {
        List {
            Section("Participants"){
                ForEach(participants) { person in
                    AvatarView(person.fullName,
                               subTitle: person.jobTitle,
                               detailsTitle: person.affiliation,
                               image: person.profileImageName)
                    .avatarImageShape(.round)
                     
                }
            }
            
            Section("Speakers"){
                ForEach(people) { person in
                    AvatarView(person.fullName,
                               subTitle: person.jobTitle,
                               detailsTitle: person.affiliation,
                               image: person.profileImageName)
                }
            }
        }
        .avatarImageShape(.round)
    }
}

#Preview {
    ContentView()
}

