//
//  SidebarView.swift
//  GerenciamentoTarefas
//
//  Created by Silvanei  Martins on 22/04/24.
//

import SwiftUI

struct SidebarView: View {
    
    @Binding var userCreatedGroups: [TaskGroup]
    @Binding var selection: TaskSection
    
    var body: some View {
        List(selection: $selection) {
            Section("Favoritos") {
                ForEach(TaskSection.allCases) {selection in
                    Label(selection.displayName, systemImage: selection.iconName)
                    .tag(selection)
                }
            }
            
            Section("Meus Grupos") {
                ForEach($userCreatedGroups) { $group in
                    HStack {
                        Image(systemName: "folder")
                        TextField("Novo Grupo", text: $group.title)
                    }
                    .tag(TaskSection.list(group))
                    .contextMenu {
                        Button("Excluir", role: .destructive) {
                            if let index = userCreatedGroups.firstIndex(where: { $0.id == group.id}) {
                                userCreatedGroups.remove(at: index)
                            }
                        }
                    }
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            Button(action: {
                let newGroup = TaskGroup(title: "Novo Grupo")
                userCreatedGroups.append(newGroup)
            }, label: {
                Label("Adicionar Grupo", systemImage: "plus.circle")
            })
            .buttonStyle(.borderless)
            .foregroundColor(.accentColor)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    SidebarView(userCreatedGroups: .constant(TaskGroup.examples()), selection: .constant(.all))
        .listStyle(.sidebar)
}
