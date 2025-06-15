//
//  UserListItem.swift
//  MyCleanProject
//
//  Created by jechoi on 6/14/25.
//

import Foundation

public struct UserListResult: Decodable {
    let totalCount: Int
    let incompleteResult: Bool
    let items: [UserListItem]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResult = "incomplete_results"
        case items
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalCount = try container.decode(Int.self, forKey: .totalCount)
        self.incompleteResult = try container.decode(Bool.self, forKey: .incompleteResult)
        self.items = try container.decode([UserListItem].self, forKey: .items)
    }
}

public struct UserListItem: Decodable {
    let id: Int
    let login: String
    let imageURL: String


    enum CodingKeys: String, CodingKey {
        case id
        case login
        case imageURL = "avatar_url"
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.login = try container.decode(String.self, forKey: .login)
        self.imageURL = try container.decode(String.self, forKey: .imageURL)
    }
}
