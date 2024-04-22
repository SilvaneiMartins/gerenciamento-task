//
//  GerenciamentoTarefasApp.swift
//  GerenciamentoTarefas
//
//  Created by Silvanei  Martins on 22/04/24.
//

import SwiftUI

@main
struct GerenciamentoTarefasApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandMenu("Tarefa") {
                Button("Adicionar nova tarefa") {
                    
                }
                .keyboardShortcut(KeyEquivalent("r"), modifiers: .command)
            }
            
            CommandGroup(after: .newItem) {
                Button("Adicionar novo grupo") {
                    
                }
                .keyboardShortcut(KeyEquivalent("a"), modifiers: .command)
            }
        }
        
        WindowGroup("Janela Especial") {
            Text("Janela Especial")
                .frame(minWidth: 200, idealWidth: 300, minHeight: 200)
        }
        .defaultPosition(.center)
        
        Settings {
            Text("Configuração")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        MenuBarExtra("Tarefas") {
            Button("Fazer algo incrível") {
                
            }
        }
    }
}
