//
//  WebViewModel.swift
//  NintendoGallery
//
//  Created by Jaime Jazareno III on 5/3/20.
//  Copyright © 2020 Jaime Jazareno III. All rights reserved.
//

import ReactiveSwift

protocol WebViewModelInputs {
    func preselect(amiibo: Character.Amiibo)
    func viewDidLoad()
}

protocol WebViewModelOutputs {
    var webUrl: MutableProperty<URL?> { get }
}

protocol WebViewModelTypes {
    var inputs: WebViewModelInputs { get }
    var outputs: WebViewModelOutputs { get }
}

class WebViewModel: WebViewModelTypes,
WebViewModelOutputs, WebViewModelInputs {
    var inputs: WebViewModelInputs { return self }
    var outputs: WebViewModelOutputs { return self }
    var webUrl: MutableProperty<URL?> = MutableProperty(nil)

    init() {
        let signal = Signal.combineLatest(viewDidLoadProperty.signal, preselectProperty.signal)
        signal.observeValues { [unowned self] _, amiibo in
            let gameSeries = amiibo.gameSeries.replacingOccurrences(of: " ", with: "+")
            let urlString = "https://www.google.com/search?safe=on&site=imghp&tbm=isch&q=\(gameSeries)"
            self.webUrl.value = URL(string: urlString)
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
