//
//  Character.swift
//  SuperBook
//
//  Created by Philipp Lazarev on 16.08.2024.
//

import Foundation

struct Superhero: Codable {
    let id: Int
    let name: String
    let slug: String
    let powerstats: Powerstats?
    let appearance: Appearance?
    let biography: Biography?
    let work: Work?
    let connections: Connections?
    let images: Images
}

// MARK: - Powerstats
struct Powerstats: Codable {
    let intelligence: Int?
    let strength: Int?
    let speed: Int?
    let durability: Int?
    let power: Int?
    let combat: Int?
}

// MARK: - Appearance
struct Appearance: Codable {
    let gender: String?
    let race: String?
    let height: [String]
    let weight: [String]
    let eyeColor: String?
    let hairColor: String?
}

// MARK: - Biography
struct Biography: Codable {
    let fullName: String?
    let alterEgos: String?
    let aliases: [String]
    let placeOfBirth: String?
    let firstAppearance: String?
    let publisher: String?
    let alignment: String?
}

// MARK: - Work
struct Work: Codable {
    let occupation: String?
    let base: String?
}

// MARK: - Connections
struct Connections: Codable {
    let groupAffiliation: String?
    let relatives: String?
}

// MARK: - Images
struct Images: Codable {
    let xs: String!
    let sm: String?
    let md: String?
    let lg: String?
}

// Пример JSON-строки
let jsonString = """
[
  {
    "id": 1,
    "name": "A-Bomb",
    "slug": "1-a-bomb",
    "powerstats": {
      "intelligence": 38,
      "strength": 100,
      "speed": 17,
      "durability": 80,
      "power": 24,
      "combat": 64
    },
    "appearance": {
      "gender": "Male",
      "race": "Human",
      "height": [
        "6'8",
        "203 cm"
      ],
      "weight": [
        "980 lb",
        "441 kg"
      ],
      "eyeColor": "Yellow",
      "hairColor": "No Hair"
    },
    "biography": {
      "fullName": "Richard Milhouse Jones",
      "alterEgos": "No alter egos found.",
      "aliases": [
        "Rick Jones"
      ],
      "placeOfBirth": "Scarsdale, Arizona",
      "firstAppearance": "Hulk Vol 2 #2 (April, 2008) (as A-Bomb)",
      "publisher": "Marvel Comics",
      "alignment": "good"
    },
    "work": {
      "occupation": "Musician, adventurer, author; formerly talk show host",
      "base": "-"
    },
    "connections": {
      "groupAffiliation": "Hulk Family; Excelsior (sponsor), Avengers (honorary member); formerly partner of the Hulk, Captain America and Captain Marvel; Teen Brigade; ally of Rom",
      "relatives": "Marlo Chandler-Jones (wife); Polly (aunt); Mrs. Chandler (mother-in-law); Keith Chandler, Ray Chandler, three unidentified others (brothers-in-law); unidentified father (deceased); Jackie Shorr (alleged mother; unconfirmed)"
    },
    "images": {
      "xs": "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/images/xs/1-a-bomb.jpg",
      "sm": "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/images/sm/1-a-bomb.jpg",
      "md": "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/images/md/1-a-bomb.jpg",
      "lg": "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/images/lg/1-a-bomb.jpg"
    }
  }
]
"""

// Преобразование строки в Data
func checkDecoding() {
    if let jsonData = jsonString.data(using: .utf8) {
        do {
            // Декодирование данных
            let superheroResponse = try JSONDecoder().decode([Superhero].self, from: jsonData)
            let superheroes = superheroResponse
            print(superheroes)
        } catch {
            print("Ошибка при декодировании: \(error)")
        }
    } else {
        print("Ошибка при преобразовании строки в Data")
    }
}
