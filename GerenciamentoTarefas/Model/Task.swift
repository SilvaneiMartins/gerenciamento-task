//
//  Task.swift
//  GerenciamentoTarefas
//
//  Created by Silvanei  Martins on 22/04/24.
//

import Foundation


struct Task: Identifiable, Hashable {
    
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var dueDate: Date
    var details: String?
    
    init(title: String, isCompleted: Bool = false, dueDate: Date = Date(), details: String? = nil) {
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.details = details
    }
    
    static func example() -> Task {
        Task(title: "Compre leite", dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!)
    }
    
    static func examples() -> [Task] {
        [
            Task(title: "Aqui estão os loucos"),
            Task(title: "Os desajustados, os rebeldes, os desordeiros", isCompleted: true),
            Task(title: "As páginas redondas nos buracos quadrados", dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!),
            Task(title: "Aqueles que veem as coisas de maneira diferente - eles não gostam de regras"),
            Task(title: "Você pode citá-los, discordar, glorificá-los ou difamá-los."),
            Task(title: "Mas a única coisa que você não pode fazer é ignorá-los porque eles arriscam coisas."),
            Task(title: "E embora alguns possam considerá-los loucos.", isCompleted: true, dueDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!),
            Task(title: "Eles empurram a raça humana para a frente."),
            Task(title: "Vemos gênio.", isCompleted: true, dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!),
            Task(title: "Porque aqueles que são loucos o suficiente para pensar que podem mudar a palavra."),
            Task(title: "São aqueles que fazem."),
        ]
    }
}
