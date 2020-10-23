//
//  iTunnesServiceImplement.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 17/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation
import RxSwift

protocol ItemService {
    //func getItens(completionHandler: @escaping (Result<ITunnes, NetworkErrors>) -> Void )
    
}

class ItemServiceImpl{
//: ItemService {
    let baseURL = ConverterConstants.baseUrl.rawValue
    
    var apiCLient = APIClient<ITunnes<ItunesResult>>()
     let disposeBag = DisposeBag()
    
    
    static let instance = ItemServiceImpl()
    
    func searchMusic(searchText: String) -> Observable<[ItunesResult]> {
           return Observable<[ItunesResult]>.create { [unowned self] observer in
            self.apiCLient.send(apiRequest: iTunesMusicRequest(term: searchText.lowercased()))
                   .subscribe(
                       onNext: { data in
                        observer.onNext(data.results)
                       },
                       onError: { error in
                           observer.onError(error)
                       },
                       onCompleted: {
                           observer.onCompleted()
                       }
                   )
                .disposed(by: self.disposeBag)
               return Disposables.create()
           }
       }
    
    func searchMovie(searchText: String) -> Observable<[ItunesResult]> {
        return Observable<[ItunesResult]>.create { [unowned self] observer in
         self.apiCLient.send(apiRequest: iTunesMovieRequest(term: searchText.lowercased()))
                .subscribe(
                    onNext: { data in
                     observer.onNext(data.results)
                    },
                    onError: { error in
                        observer.onError(error)
                    },
                    onCompleted: {
                        observer.onCompleted()
                    }
                )
             .disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
    
 
//    func storeModels()
//       {
//           guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {
//               return
//           }
//
//           do {
//               let data = try Data(contentsOf: url)
//             let decoder = JSONDecoder()
//             decoder.keyDecodingStrategy = .convertFromSnakeCase
//               guard let user = try? decoder.decode(CurrencyRlm.self, from: data) else {
//                   return
//               }
//
//               let realm = try Realm()
//               print(realm.configuration.fileURL?.absoluteString ?? "")
//
//               try realm.write {
//                   realm.add(user, update: true)
//               }
//
//           } catch {
//           }
//       }
    
}

