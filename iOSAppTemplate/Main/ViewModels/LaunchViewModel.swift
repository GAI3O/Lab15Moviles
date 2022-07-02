//
//  LaunchViewModel.swift
//  iOSAppTemplate
//
//  Created by Gabriel on 10/06/22.
//

import FirebaseAuth

class LaunchViewModel: ObservableObject{
    let appState = AppState.shared

    init(){
        appState.currentScreen = Auth.auth().currentUser != nil ? .main : .login 
    }
}
