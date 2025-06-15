//
//  CoreDataError.swift
//  MyCleanProject
//
//  Created by jechoi on 6/14/25.
//

import Foundation


public enum CoreDataError: Error {
    case entityNotFound(String)
    case saveError(String)
    case readError(String)
    case deleteError(String)

    public var description: String {
        switch self {
        case .entityNotFound(let name):
            "객체를 찾을 수 없습니다. \(name)"
        case .saveError(let message):
            "객체 저장 실패 \(message)"
        case .readError(let message):
            "객체 조회 에러 \(message)"
        case .deleteError(let message):
            "객체 삭제 에러 \(message)"
        }
    }
}
