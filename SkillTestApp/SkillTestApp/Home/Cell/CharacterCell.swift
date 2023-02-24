//
//  CharacterCell.swift
//  SkillTestApp
//
//  Created by David Penagos on 23/02/23.
//

import SwiftUI

struct CharacterCell: View {
    // MARK: - Properties
    var characterResult: Results
    
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .frame(width: 120, height: 120, alignment: .center)
                    .padding([.leading], 16)
                    .scaledToFit()
                
                VStack {
                    VStack(spacing: 0) {
                        /// Name
                        Text(characterResult.name ?? String.emptyString)
                            .font(.system(size: 26,
                                          weight: .bold,
                                          design: .rounded))
                            .foregroundColor(.white)
                            .minimumScaleFactor(0.1)
                        
                        HStack {
                            /// Alive, dead or unknown - icon
                            Circle()
                                .frame(width: 9, height: 9, alignment: .center)
                                .foregroundColor(((characterResult.status ?? String.emptyString) == L10n.CharacterCell.Status.dead) ? Color.red : ((characterResult.status ?? String.emptyString) == L10n.CharacterCell.Status.alive) ? Color.green : Color.gray)
                                .scaledToFit()
                            
                            /// Alive, dead or unknown - Text
                            Text(characterResult.status ?? String.emptyString)
                                .font(.system(size: 14,
                                              weight: .bold,
                                              design: .rounded))
                                .foregroundColor(.white)
                                .minimumScaleFactor(0.1)
                        }
                    }
                    .padding([.bottom], 6)
                    
                    VStack(spacing: 2) {
                        /// Last known location - Title
                        Text(L10n.CharacterCell.lastKnowLocation)
                            .font(.system(size: 14,
                                          weight: .regular,
                                          design: .rounded))
                            .foregroundColor(.white)
                            .minimumScaleFactor(0.1)
                        
                        /// Last known location - Description
                        Text(characterResult.location?.name ?? String.emptyString)
                            .font(.system(size: 16,
                                          weight: .bold,
                                          design: .rounded))
                            .foregroundColor(.white)
                            .minimumScaleFactor(0.1)
                    }
                    .padding([.bottom], 6)
                    
                    VStack(spacing: 2) {
                        /// Gender - Title
                        Text(L10n.CharacterCell.gender)
                            .font(.system(size: 14,
                                          weight: .regular,
                                          design: .rounded))
                            .foregroundColor(.white)
                            .minimumScaleFactor(0.1)
                        
                        /// Gender - Description
                        Text(characterResult.gender ?? String.emptyString)
                            .font(.system(size: 16,
                                          weight: .bold,
                                          design: .rounded))
                            .foregroundColor(.white)
                            .minimumScaleFactor(0.1)
                    }
                    .padding([.bottom], 6)
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(Color(Asset.grayCell.color))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 2)
            )
        }
    }
}
