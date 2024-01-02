//
//  NewViewModel.swift
//  MVVMTEST
//
//  Created by Rajeshwari Sharma on 02/01/24.
//

import Foundation


import Foundation

class NewViewModel {
    private var todos: [NewDataModel] = []

    var numberOfTodos: Int {
        return todos.count
    }

    func getTodoAtIndex(_ index: Int) -> NewDataModel {
        return todos[index]
    }

    func fetchTodos(completion: @escaping () -> Void) {
        
       
        
        print("APIService")
        
        APIService.shared.fetchTodos( completion: { [weak self] (result) in
            switch result {
            case .success(let todos):
                self?.todos = todos
                completion()
            case .failure(let error):
                print("Error fetching todos: \(error.localizedDescription)")
            }
        })
    }
}
