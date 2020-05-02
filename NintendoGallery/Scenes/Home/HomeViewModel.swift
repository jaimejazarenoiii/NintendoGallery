//
//  HomeViewModel.swift
//  NintendoGallery
//
//  Created by Jaime Jazareno III on 5/3/20.
//  Copyright © 2020 Jaime Jazareno III. All rights reserved.
//

import ReactiveSwift

protocol HomeViewModelInputs {
    func viewDidLoad()
}

protocol HomeViewModelOutputs {
    var characters: MutableProperty<[Character.Amiibo]> { get }
}

protocol HomeViewModelTypes {
    var inputs: HomeViewModelInputs { get }
    var outputs: HomeViewModelOutputs { get }
}

class HomeViewModel: HomeViewModelTypes, HomeViewModelOutputs, HomeViewModelInputs {
    var inputs: HomeViewModelInputs { return self }

    var outputs: HomeViewModelOutputs { return self }

    var characters: MutableProperty<[Character.Amiibo]> = MutableProperty([])

    init() {
        viewDidLoadProperty.signal.observeValues { [unowned self] _ in
            self.fetchCharacters { characters in
                self.characters.value = characters
            }
        }
    }

    var viewDidLoadProperty = MutableProperty(())
    func viewDidLoad() {
        viewDidLoadProperty.value = ()
    }
}

extension HomeViewModel {
    func fetchCharacters(completionHandler: @escaping ([Character.Amiibo]) -> Void) {
        let url = URL(string: Constants.baseUrl + "api/amiibo")!

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching characters: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(String(describing: response))")
                    fatalError()
            }

            if let data = data,
                let characters = try? JSONDecoder().decode(Character.self, from: data) {
                completionHandler(characters.amiibo)
            }
        })
        task.resume()
    }
}
