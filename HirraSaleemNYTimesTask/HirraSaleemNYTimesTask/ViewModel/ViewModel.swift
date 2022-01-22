//
//  ViewModel.swift
//  HirraSaleemNYTimesTask
//
//  Created by Hirra on 22/01/2022.
//

import UIKit
import Combine

let APIKEY = "Gdi6QC1MZQS0SDSMcSP4dS5NxL5GAKQl"
class ViewModel: ObservableObject {
    @Published var results = [Results]()
    var pub: AnyPublisher<(data: Data, response: URLResponse), URLError>? = nil
    var sub: Cancellable? = nil
    @Published var loading = false

    init() {
        
        guard let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=Gdi6QC1MZQS0SDSMcSP4dS5NxL5GAKQl") else {return}
    
        pub = URLSession.shared.dataTaskPublisher(for: url)
                .eraseToAnyPublisher()
        sub = pub?.sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
//                    fatalError(error.localizedDescription)
                }
            },
            receiveValue: { item in
                do {
                    print(item.data)
                    let item = try JSONDecoder().decode(NYTimeModel.self , from: item.data)
                    DispatchQueue.main.async {
                        
                        self.results = item.results  ?? []
                        self.loading = true
                    }
                } catch {
                      print("Failed to decode \(error)")
                  }
                }
            )
        }
}
