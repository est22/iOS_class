//
//  ModelData.swift
//  Landmarks
//
//  Created by Lia An on 10/30/24.
//

import Foundation

var landmarks: [Landmark] = load(filename: "landmarkData.json")

func load<T: Decodable>(filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("메인번들에서 파일을 찾을 수 없습니다.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("메인번들에서 파일을 읽을 수 없습니다.")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("디코딩을 할 수 없습니다")
    }
}
