//
//  TaskSection.swift
//  GerenciamentoTarefas
//
//  Created by Silvanei  Martins on 22/04/24.
//

import Foundation

enum TaskSection: Identifiable, CaseIterable, Hashable {
    
    case all
    case done
    case upcoming
    case list(TaskGroup)
    
    var id: String {
        switch self {
            case .all:
                "Todos"
            case .done:
                "Realizado"
            case .upcoming:
                "A fazer"
            case .list(let taskgroup):
                taskgroup.id.uuidString
        }
    }
    
    var displayName: String {
        switch self {
            case .all:
                "Todos"
            case .done:
                "Realizado"
            case .upcoming:
                "A fazer"
            case .list(let taskgroup):
                taskgroup.title
        }
    }
    
    var iconName: String {
        switch self {
            case .all:
                "star"
            case .done:
                "checkmark.circle"
            case .upcoming:
                "calendar"
            case .list(_):
                "folder"
        }
    }
    
    static var allCases: [TaskSection] {
        [.all, .done, .upcoming]
    }
    
    static func == (lhs: TaskSection, rhs: TaskSection) -> Bool {
        lhs.id == rhs.id
    }
}
