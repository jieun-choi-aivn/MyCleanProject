//
//  UserListRepositoryProtocol.swift
//  MyCleanProject
//
//  Created by jechoi on 6/14/25.
//

import Foundation

public protocol UserListRepositoryProtocol {
    func fetchUser(query: String, page: Int) async -> Result<UserListResult, NetworkError>
    func getFavoriteUsers() -> Result<[UserListItem], CoreDataError>
    func saveFavoriteUser(user: UserListItem) -> Result<Bool, CoreDataError>
    func deleteFavoriteUser(user: Int) -> Result<Bool, CoreDataError>
}

