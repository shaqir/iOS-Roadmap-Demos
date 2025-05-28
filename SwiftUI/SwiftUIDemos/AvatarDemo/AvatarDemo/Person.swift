//
//  Person.swift
//  AvatarDemo
//
//  Created by Sakir Saiyed on 27/05/25.
//

import Foundation

struct Person: Identifiable{
    
    var id = UUID()
    let fullName: String
    let jobTitle: String
    let affiliation: String
    var isParticipant: Bool = false
    
    var profileImageName: String{
        fullName.lowercased().replacingOccurrences(of: " ", with: "-")
    }
}

extension Person{
    static var samples: [Person] = [
        .init(fullName: "Peter Friese", jobTitle: "Senior Developer Advocate", affiliation: "Google"),
        .init(fullName: "Alex Kudelka", jobTitle: "Co-Founder & CRO", affiliation: "Glassfy"),
        .init(fullName: "SakirAli Saiyed", jobTitle: "iOS Tech Lead", affiliation: "Bumble", isParticipant: true),
        .init(fullName: "Allison Mcentire", jobTitle: "Software Engineer", affiliation: "URBN"),
        .init(fullName: "Anum Mian", jobTitle: "iOS Developer", affiliation: "The Guardian"),
        .init(fullName: "Araks Avoyan", jobTitle: "iOS Engineer", affiliation: "Spotify"),
        .init(fullName: "Audrey Sobgou Zebaze", jobTitle: "iOS/macOS Software Engineer", affiliation: "Proton"),
        .init(fullName: "Avi Tsadok", jobTitle: "Head Of Mobile", affiliation: "Melio"),
        .init(fullName: "Chris Greening", jobTitle: "Technology Advisor", affiliation: "Self-employed"),
        .init(fullName: "Daniel Kennett", jobTitle: "Cocoa developer", affiliation: "Cascable"),
        .init(fullName: "Daniel Tull", jobTitle: "Cocoa developer", affiliation: "Cascable"),
        .init(fullName: "Evgenii Matsiuk", jobTitle: "Co-Founder", affiliation: "MarathonLabs"),
        .init(fullName: "Leah Vogel", jobTitle: "Senior Engineering Manager", affiliation: "Chegg"),
        .init(fullName: "Lena Mattea Stöxen", jobTitle: "Student", affiliation: "Volkswagen Commercial Vehicles"),
        .init(fullName: "Luke Stringer", jobTitle: "Tech Principal", affiliation: "AND Digital"),
        .init(fullName: "Michael Baldock", jobTitle: "Senior Software Engineer", affiliation: "Skyscanner"),
        .init(fullName: "Mike Abdullah", jobTitle: "Lead iOS & Mac Developer", affiliation: "Karelia Software"),
        .init(fullName: "Natalia Panferova", jobTitle: "Senior iOS Developer & Director", affiliation: "Nil Coalescing Limited"),
        .init(fullName: "Oliver Binns", jobTitle: "Lead Mobile Developer", affiliation: "Deloitte"),
        .init(fullName: "Oliver Foggin", jobTitle: "iOS Principal", affiliation: "Jugo"),
        .init(fullName: "Pol Piella Abadia", jobTitle: "Senior Software Engineer", affiliation: "BBC"),
        .init(fullName: "Rich Turton", jobTitle: "iOS Developer", affiliation: "MartianCraft"),
        .init(fullName: "Rizwan Ahmed", jobTitle: "Senior iOS Engineer", affiliation: "ohmyswift.com"),
        .init(fullName: "Tim Condon", jobTitle: "Engineer & Founder", affiliation: "Broken Hands"),
        .init(fullName: "Zamzam Farzamipooya", jobTitle: "Tech Lead & Senior iOS Engineer", affiliation: "Veo.co"),
        .init(fullName: "Emad Ghorbaninia", jobTitle: "Lead Engineer", affiliation: "Visma Acubiz"),
        .init(fullName: "Paul Hudson", jobTitle: "himself", affiliation: "Hacking with Swift"),
        .init(fullName: "Anna Beltrami", jobTitle: "Software Engineer", affiliation: "Spotify"),
    ]
    
    static var sample = samples[0]
}



