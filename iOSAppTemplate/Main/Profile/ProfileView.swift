//
//  ProfileView.swift
//  iOSAppTemplate
//
//  Created by Gabriel on 24/06/22.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @EnvironmentObject var appState: AppState
    
    @State private var name: String = "name"
    @State private var email: String = "email@gmail.com"
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 15) {
                    Image("monkey")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .frame(maxWidth: 100)
                    Text(name)
                        .font(.system(size: 26, weight: .black))
                    Text(email)
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                    HStack {
                        Button {
                            print("update")
                        } label: {
                            Text("Update profile")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                        }
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        Spacer()
                        
                        Button {
                            print("update")
                        } label: {
                            Text("Follow")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                        }
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding()
                
                Spacer()
                
                VStack {
                    Divider()
                    Button {
                        try? Auth.auth().signOut()
                        appState.currentScreen = .login
                    } label: {
                        Text("Sign Out")
                            .foregroundColor(.pink)
                    }
                }
                .padding()
                .padding(.bottom)
                
            }
            
            .navigationTitle("Profile")
        }
        .onAppear {
            let user  = Auth.auth().currentUser
            name = user?.displayName ?? "name"
            email = user?.email ?? "email@gmail.com"
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
