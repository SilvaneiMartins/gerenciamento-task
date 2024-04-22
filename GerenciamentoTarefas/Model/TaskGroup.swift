//
//  TaskGroup.swift
//  GerenciamentoTarefas
//
//  Created by Silvanei  Martins on 22/04/24.
//

import Foundation

struct TaskGroup: Identifiable, Hashable {
    
    let id = UUID()
    var title: String
    let creationDate: Date
    var tasks: [Task]
    
    init(title: String, tasks: [Task] = []) {
        self.title = title
        self.creationDate = Date()
        self.tasks = tasks
    }
    
    static func example() -> TaskGroup {
        let task1 = Task(title: "Comprar mantimentos")
        let task2 = Task(title: "Concluir projeto")
        let task3 = Task(title: "Ligue para o dentista")
        
        var group = TaskGroup(title: "Pessoal")
        group.tasks = [task1, task2, task3]
        return group
    }
    
    static func examples() -> [TaskGroup] {
        let group1 = TaskGroup.example()
        let group2 = TaskGroup(title: "Nova Lista")
        return [group1, group2]
    }
}
