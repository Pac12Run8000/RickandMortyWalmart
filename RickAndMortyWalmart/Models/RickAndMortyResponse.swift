//
//  RickAndMortyResponse.swift
//  RickAndMortyWalmart
//
//  Created by Michelle Grover on 5/23/22.
//

import Foundation

struct RickAndMortyResponse:Codable {
    var results:[RickandMortyCharacter]
}

struct RickandMortyCharacter:Codable {
    var id:Int
    var name:String
    var species:String
    var status:String
    var gender:String
    var image:String
    var type:String
    var location:Location?
    var origin:Origin?
}

struct Origin:Codable {
    var name:String
    var url:String
}

struct Location:Codable {
    var name:String
    var url:String
}






