//
//  SplashView.swift
//  SkillTestApp
//
//  Created by David Penagos on 20/02/23.
//

import SwiftUI

struct SplashView: View {
    // MARK: - Properties
    @ObservedObject var viewModel = SplashViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isActive {
                HomeView()
            } else {
                Image(Asset.splashImage.name)
                    .resizable()
                    .ignoresSafeArea()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    viewModel.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
