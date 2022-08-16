//
//  Pun.swift
//  2.10
//
//  Created by Александр on 11.08.2022.
//

struct Joke: Decodable {
    let category: String?
    let setup: String?
    let delivery: String?
    
    let flags: [String: Bool]?
}

