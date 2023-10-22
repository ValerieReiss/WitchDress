//
//  UserDefaults.swift
//  TarotDay
//
//  Created by Valerie on 03.04.23.
//

import Foundation

extension UserDefaults {
    struct Key<Value> {
        let name: String
        init(_ name: String) {
            self.name = name
        }
    }
    subscript<V: Codable>(key: Key<V>) -> V? {
        get {
            guard let data = self.data(forKey: key.name) else {
                return nil
            }
            return try? JSONDecoder().decode(V.self, from: data)
        }
        set {
            guard let value = newValue, let data = try? JSONEncoder().encode(value) else {
                self.set(nil, forKey: key.name)
                return
            }
            self.set(data, forKey: key.name)
        }
    }
   
    subscript(key: Key<Bool>) -> Bool {
        get { return self.bool(forKey: key.name) }
        set { self.set(newValue, forKey: key.name) }
    }
    subscript(key: Key<Int>) -> Int {
        get { return self.integer(forKey: key.name) }
        set { self.set(newValue, forKey: key.name) }
    }
    subscript(key: Key<Float>) -> Float {
        get { return self.float(forKey: key.name) }
        set { self.set(newValue, forKey: key.name) }
    }
    subscript(key: Key<Double>) -> Double {
        get { return self.double(forKey: key.name) }
        set { self.set(newValue, forKey: key.name) }
    }
}

// -----------------------------------------------------------------------------
// TEST
struct Person: Codable {
    var name: String
    var age: Int
}

extension UserDefaults.Key {
    typealias Key = UserDefaults.Key
    //static let test = Key<Bool>("aaaa")
    static var test: Key<Bool> { return Key<Bool>("test") }
    static var array: Key<[Person]> { return Key<[Person]>("array") }
}


