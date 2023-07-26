//
//  HomeButton.swift
//  CDZGoldenJab
//
//  Created by Roberto Mascarenhas on 09/11/22.
//

import SwiftUI

struct HomeButton: View {
    @EnvironmentObject var dataModel : DataModel
    var body: some View {
        Button {
            dataModel.reset()
            dataModel.clockReset()
            dataModel.singlePlayerIsOn = false
        } label: {
            Image(systemName: "house.circle")
        }
    }
}

