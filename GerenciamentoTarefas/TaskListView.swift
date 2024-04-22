//
//  TaskListView.swift
//  GerenciamentoTarefas
//
//  Created by Silvanei  Martins on 22/04/24.
//

import SwiftUI

struct TaskListView: View {
    
    let title: String
    @Binding var tasks: [Task]
    @State private var selectedTask: Task? = nil
    
    @State private var inspectorIsShown: Bool = false
    
    var body: some View {
        List($tasks) { $task in
            TaskView(task: $task, selectTask: $selectedTask, inspectorIsShowm: $inspectorIsShown)
        }
        .navigationTitle(title)
        .toolbar {
            ToolbarItemGroup {
                Button {
                    tasks.append(Task(title: "Nova Tarefa"))
                } label: {
                    Label("Adicionar Nova Tarefa", systemImage: "plus")
                }
                
                Button {
                    inspectorIsShown.toggle()
                } label: {
                    Label("Mostrar inspetor", systemImage: "sidebar.right")
                }
            }
        }
        .inspector(isPresented: $inspectorIsShown) {
            Group {
                if let selectedTask {
                    Text(selectedTask.title)
                        .font(.title)
                        .padding()
                } else {
                    Text("Não selecionou nada.")
                }
            }
            .frame(minWidth: 100, maxWidth: .infinity)
        }
    }
}

#Preview {
    TaskListView(title: "All", tasks: .constant(Task.examples()))
}
