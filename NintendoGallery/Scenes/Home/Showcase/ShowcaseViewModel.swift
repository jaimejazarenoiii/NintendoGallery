//
//  ShowcaseViewModel.swift
//  NintendoGallery
//
//  Created by Jaime Jazareno III on 5/3/20.
//  Copyright © 2020 Jaime Jazareno III. All rights reserved.
//

import ReactiveSwift

protocol ShowcaseViewModelInputs {
    func preselect(amiibo: Character.Amiibo)
    func viewDidLoad()
}

protocol ShowcaseViewModelOutputs {
    var imageUrl: MutableProperty<URL?> { get }
}

protocol ShowcaseViewModelTypes {
    var inputs: ShowcaseViewModelInputs { get }
    var outputs: ShowcaseViewModelOutputs { get }
}

class ShowcaseViewModel: ShowcaseViewModelTypes, ShowcaseViewModelOutputs, ShowcaseViewModelInputs {
    var inputs: ShowcaseViewModelInputs { return self }
    var outputs: ShowcaseViewModelOutputs { return self }
    var imageUrl: MutableProperty<URL?> = MutableProperty(nil)

    init() {
        let signal = Signal.combineLatest(viewDidLoadProperty.signal, preselectProperty.signal)
        signal.observeValues { [unowned self] _, amiibo in
            self.imageUrl.value = URL(string: amiibo.image)!
        }
    }

    var viewDidLoadProperty = MutableProperty(())
    func viewDidLoad() {
        viewDidLoadProperty.value = ()
    }

    var preselectProperty = MutableProperty(Character.Amiibo.template)
    func preselect(amiibo: Character.Amiibo) {
        preselectProperty.value = amiibo
    }
}
