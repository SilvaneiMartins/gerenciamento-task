//
//  ContentView.swift
//  GerenciamentoTarefas
//
//  Created by Silvanei  Martins on 22/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = TaskSection.all
    
    @State private var allTasks = Task.examples()
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()
    
    @State private var searchTerm: String = ""
    
    var body: some View {
        NavigationSplitView {
            SidebarView(userCreatedGroups: $userCreatedGroups, selection: $selection)
        } detail: {
            
            if searchTerm.isEmpty {
                switch selection {
                case .all:
                    TaskListView(title: "All", tasks: $allTasks)
                case .done:
                    StaticTaskListView(title: "All", tasks: allTasks.filter({
                        $0.isCompleted
                    }))
                case .upcoming:
                    StaticTaskListView(title: "All", tasks: allTasks.filter({
                        !$0.isCompleted
                    }))
                case .list(let taskGroup):
                    StaticTaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
                }
            } else {
                StaticTaskListView(title: "All", tasks: allTasks.filter({
                    $0.title.contains(searchTerm)
                }))
            }
        }
        .searchable(text: $searchTerm, prompt: "Procurar tarefa")
    }
}

#Preview {
    ContentView()
}
