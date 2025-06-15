//
//  UserListUseCase.swift
//  MyCleanProject
//
//  Created by jechoi on 6/14/25.
//

import Foundation

public protocol UserListUseCaseProtocol {
    func fetchUser(query: String, page: Int) async -> Result<UserListResult, NetworkError>
    func getFavoriteUsers() -> Result<[UserListItem], CoreDataError>
    func saveFavoriteUser(user: UserListItem) -> Result<Bool, CoreDataError>
    func deleteFavoriteUser(user: Int) -> Result<Bool, CoreDataError>

    // 배열 -> dictionary [초성 : [유저리스트]]
    // 유저리스트 - 즐겨찾기에 포함된 유저인지 체크
}

public struct UserListUseCase: UserListUseCaseProtocol {
    private let repository: UserListRepositoryProtocol

    init(repository: UserListRepositoryProtocol) {
        self.repository = repository
    }

    public func fetchUser(query: String, page: Int) async -> Result<UserListResult, NetworkError> {
        return await repository.fetchUser(query: query, page: page)
    }

    public func getFavoriteUsers() -> Result<[UserListItem], CoreDataError> {
        return repository.getFavoriteUsers()
    }

    public func saveFavoriteUser(user: UserListItem) -> Result<Bool, CoreDataError> {
        return repository.saveFavoriteUser(user: user)
    }

    public func deleteFavoriteUser(user: Int) -> Result<Bool, CoreDataError> {
        return repository.deleteFavoriteUser(user: user)
    }
}
