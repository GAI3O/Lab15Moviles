//
//  SingUpView.swift
//  iOSAppTemplate
//
//  Created by Gabriel on 24/06/22.
//

import SwiftUI

struct SingUpView: View {
    
    @StateObject var authViewModel = AuthViewModel()
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State var alertError = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Sign Up")
                    .font(.system(size: 25, weight: .black))
                Text("Welcome to PokeTinder match with your favorite pokemon")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Spacer()
            VStack(spacing: 25) {
                TextField("Enter your name", text: $name)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(.pink, lineWidth: 1))
                    .keyboardType(.default)
                
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
                    authViewModel.register(name: name, email: email, password: password)
                } label: {
                    Text("Sign Up")
                        .padding()
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                }
                .frame(maxWidth: .infinity)
                .background(.pink)
                .cornerRadius(8)
                
            }
            .padding()
            .alert(isPresented: $alertError) {
                Alert(
                    title: Text("Error"),
                    message: Text(authViewModel.errorMessage),
                    dismissButton: .default(Text("Ok"))
                )
            }
            .onReceive(authViewModel.$showError, perform: { newValue in
                print("newValue \(newValue)")
                alertError = newValue
            })
        }
    }
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpView()
    }
}
