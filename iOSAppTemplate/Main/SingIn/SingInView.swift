//
//  SingInView.swift
//  iOSAppTemplate
//
//  Created by Gabriel on 24/06/22.
//

import SwiftUI

struct SingInView: View {
    
    @EnvironmentObject var appState: AppState
    @StateObject var authViewModel = AuthViewModel()
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var alertError = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    Text("Hello Again!")
                        .font(.system(size: 25, weight: .bold))
                    Text("Welcome back you've missedd")
                        .font(.system(size: 20))
                        .frame(maxWidth: 200)
                    
                    VStack(spacing: 25) {
                        TextField("Enter your email", text: $email)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(.pink, lineWidth: 1))
                            .keyboardType(.emailAddress)
                        
                        SecureField("Enter your password", text: $password)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(.pink, lineWidth: 1))
                        
                        Button {
                            authViewModel.login(email: email, password: password)
                        } label: {
                            Text("Sign In")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                        }
                        .frame(maxWidth: .infinity)
                        .background(.pink)
                        .cornerRadius(8)
                        
                        NavigationLink(destination: SingUpView()) {
                            Text("Not a member? Register now")
                        }
                        
                    }.padding()
                }
                .alert(isPresented: $alertError) {
                    Alert(
                        title: Text("Error"),
                        message: Text(authViewModel.errorMessage),
                        dismissButton: .destructive(Text("Ok"))
                    )
                }
                .onReceive(authViewModel.$showError, perform: { newValue in
                    print("newValue \(newValue)")
                    alertError = newValue
                })
            }
        }.accentColor(.pink)
    }
}

struct SingInView_Previews: PreviewProvider {
    static var previews: some View {
        SingInView()
    }
}
