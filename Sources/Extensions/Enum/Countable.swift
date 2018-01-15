//
//  Countable.swift
//  WASKit
//
//  Created by Wagner Sales on 02/11/17.
//  Copyright © 2017 Wagner Sales. All rights reserved.
//

import Foundation

protocol Countable: Hashable {}
extension Countable {
	static var all: [Self] {
		let sequence = AnySequence { () -> AnyIterator<Self> in
			var raw = 0
			return AnyIterator {
				let current: Self = withUnsafePointer(to: &raw) {
					$0.withMemoryRebound(to: Self.self, capacity: 1) {
						$0.pointee
					}
				}
				guard current.hashValue == raw else { return nil }
				raw += 1
				return current
			}
		}
		return Array(sequence)
	}
}
