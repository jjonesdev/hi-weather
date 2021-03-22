//
//  NSCollectionLayoutSectionExtensions.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/21/21.
//

import UIKit

extension NSCollectionLayoutSection {
    enum Height {
        case estimated(CGFloat)
        case absolute(CGFloat)
        case fractional(CGFloat)

        var layoutDimension: NSCollectionLayoutDimension {
            switch self {
            case let .estimated(height):
                return .estimated(height)
            case let .absolute(height):
                return .absolute(height)
            case let .fractional(height):
                return .fractionalHeight(height)
            }
        }
    }

    static func fullWidth(
        groupHeight: Height,
        itemHeight: Height = .fractional(1.0),
        interGroupSpacing: CGFloat = Spacing.small,
        contentInsets: NSDirectionalEdgeInsets = .init(
            top: Spacing.small,
            leading: Spacing.medium,
            bottom: Spacing.small,
            trailing: Spacing.medium)
        )-> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: itemHeight.layoutDimension)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: groupHeight.layoutDimension)

        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                     subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = interGroupSpacing
        section.contentInsets = contentInsets

        return section
    }
}
