//
//  Post.swift
//  AlmofireDemoInSwiftUI
//
//  Created by Sakir Saiyed on 2025-06-11.
//
 
import Foundation

struct Post: Decodable, Identifiable {
    let id: Int
    let title: String
    let body: String
}

