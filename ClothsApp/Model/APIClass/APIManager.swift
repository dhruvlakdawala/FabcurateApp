//
//  APIManager.swift
//  ClothsApp
//
//  Created by Test on 16/02/24.
//

import Foundation
import Alamofire

class APIManager{
    
    static let sharedInstance = APIManager()
    
    let topRepositoryURL = "http://app-interview.easyglue.in/top_repository.json"
    let middleRepositoryURL = "http://app-interview.easyglue.in/middle_repository.json"
    let bottomRepositoryURL = "http://app-interview.easyglue.in/bottom_repository.json"
    let categoryRepositoryURL = "http://app-interview.easyglue.in/category_repository.json"
    
    func getTopRepositoryData(completion: @escaping (Bool, [MainStickyMenu]) -> ()){
        AF.request(topRepositoryURL, method: .get, parameters: [:], encoding: URLEncoding.default)
            .responseData { response in
                switch response.result {
                    
                case .success(let data):
                    do{
                        let topRepositoryData = try JSONDecoder().decode(TopRepository.self, from: data)
                        print("Top Repository Data ==> \(topRepositoryData.mainStickyMenu)")
                        completion(true, topRepositoryData.mainStickyMenu)
                    } catch {
                        print("Success Catch Error ==> \(error.localizedDescription)")
                        completion(false, [])
                    }
                case .failure(let error):
                    print("Failure Error ==> \(error.localizedDescription)")
                    completion(false, [])
                }
            }
    }
    
    func getMiddleRepositoryData(completion: @escaping (Bool, MiddleRepository?) -> ()){
        AF.request(middleRepositoryURL, method: .get, parameters: [:], encoding: URLEncoding.default)
            .responseData { response in
                switch response.result {
                    
                case .success(let data):
                    do{
                        let middleRepositoryData = try JSONDecoder().decode(MiddleRepository.self, from: data)
                        print("Middle Repository Data ==> \(middleRepositoryData)")
                        completion(true, middleRepositoryData)
                    } catch {
                        print("Success Catch Error ==> \(error.localizedDescription)")
                        completion(false, nil)
                    }
                case .failure(let error):
                    print("Failure Error ==> \(error.localizedDescription)")
                    completion(false, nil)
                }
            }
    }
    
    func getBottomRepositoryData(completion: @escaping (Bool, BottomRepository?) -> ()){
        AF.request(bottomRepositoryURL, method: .get, parameters: [:], encoding: URLEncoding.default)
            .responseData { response in
                switch response.result {
                    
                case .success(let data):
                    do{
                        let bottomRepositoryData = try JSONDecoder().decode(BottomRepository.self, from: data)
                        print("Bottom Repository Data ==> \(bottomRepositoryData)")
                        completion(true, bottomRepositoryData)
                    } catch {
                        print("Success Catch Error ==> \(error.localizedDescription)")
                        completion(false, nil)
                    }
                case .failure(let error):
                    print("Failure Error ==> \(error.localizedDescription)")
                    completion(false, nil)
                }
            }
    }
    
    func getCategoryRepositoryData(completion: @escaping (Bool, [Category]?) -> ()){
        AF.request(categoryRepositoryURL, method: .get, parameters: [:], encoding: URLEncoding.default)
            .responseData { response in
                switch response.result {
                    
                case .success(let data):
                    do{
                        let categoryData = try JSONDecoder().decode(CategoryRepository.self, from: data)
                        print("Category Repository Data ==> \(categoryData.categories)")
                        completion(true, categoryData.categories)
                    } catch {
                        print("Success Catch Error ==> \(error.localizedDescription)")
                        completion(false, [])
                    }
                case .failure(let error):
                    print("Failure Error ==> \(error.localizedDescription)")
                    completion(false, [])
                }
            }
    }
}

