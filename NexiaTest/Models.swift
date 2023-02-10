//
//  Models.swift
//  NexiaTest
//
//  Created by icarus on 07/02/23.
//
import Foundation


enum CellModel {
    case collectionView(models: [CollectionTableCellModel], rows: Int)
    case list(models: [ListCellModel])
}

struct ListCellModel {
    let title : String
}

struct CollectionTableCellModel {
    let tile : String
    let image : String

}
