//
//  GApiStateMachine.swift
//  ios-gurunavi-apikit
//
//  Created by yogasawara@stv on 2017/11/25.
//  Copyright © 2017年 Sunday Carpenter. All rights reserved.
//

import Foundation

let apiAccessGraph:[Transition<GApiState,GApiEvent>] = [
    //from root
    Transition(from: .root, to: .loadedError,
               by: DefaultEvent.errorOccur),
    Transition(from: .root, to: .partiallyLoaded,
               by: DefaultEvent.loadPartially),
    Transition(from: .root, to: .fullyLoaded,
               by: DefaultEvent.loadFully),
    
    //from loadedError
    Transition(from: .loadedError, to: .loadedError,
               by: DefaultEvent.errorOccur),
    Transition(from: .loadedError, to: .partiallyLoaded,
               by: DefaultEvent.loadPartially),
    Transition(from: .loadedError, to: .fullyLoaded,
               by: DefaultEvent.loadFully),

    //from partially loaded
    Transition(from: .partiallyLoaded, to: .loadedError,
               by: DefaultEvent.errorOccur),
    Transition(from: .partiallyLoaded, to: .partiallyLoaded,
               by: DefaultEvent.loadPartially),
    Transition(from: .partiallyLoaded, to: .fullyLoaded,
               by: DefaultEvent.loadFully),

    //from partially loaded
    Transition(from: .fullyLoaded, to: .loadedError,
               by: DefaultEvent.errorOccur),
    Transition(from: .fullyLoaded, to: .partiallyLoaded,
               by: DefaultEvent.loadPartially),
    Transition(from: .fullyLoaded, to: .fullyLoaded,
               by: DefaultEvent.loadFully),
]

struct AutomatonManager {
    static let apiAccessMachine = Automaton<GApiState,GApiEvent>(
        initialState: .root,
        transitions: apiAccessGraph
    )
}
