//
//  TaskView.swift
//  GerenciamentoTarefas
//
//  Created by Silvanei  Martins on 22/04/24.
//

import SwiftUI

struct TaskView: View {
        
    @Binding var task: Task
    @Binding var selectTask: Task?
    @Binding var inspectorIsShowm: Bool
    
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            
            TextField("Digite nome da tarefa", text: $task.title)
                .textFieldStyle(.plain)
            
            Button(action: {
                inspectorIsShowm = true
                selectTask = task
            }, label: {
                Text("Mais")
            })
        }
    }
}

#Preview {
    TaskView(task: .constant(Task.example()), selectTask: .constant(nil), inspectorIsShowm: .constant(false))
        .padding()
}
