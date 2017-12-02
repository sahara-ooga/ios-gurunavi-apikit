//
// Created by orakaro on 2017/09/15.
// Copyright (c) 2017 orakaro. All rights reserved.
//

import Foundation

//README.md中のMonadic Mealy Machine
struct MonadicAutomaton<S, A, B> {
    typealias T = (A) -> State<S, B>
    private var f : T

    //今回はfに渡ってくるのはtransitionFunc
    init(f: @escaping T) {
        self.f = f
    }

    func transition(from: S, by: A) -> (S, B) {
        return f(by).run(s: from)
    }
}
