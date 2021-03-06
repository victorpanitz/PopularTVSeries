//
//  SeriesCVCellPresenter.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 18/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class SeriesCVCellPresenter {
    
    // MARK: Properties
    
    private weak var view: SeriesCVCellView?
    private let model: Serie
    
    // MARK: Object Lifecycle
    
    init(model: Serie) {
        self.model = model
    }
    
    // MARK: Public Methods
    
    func attachView(_ view: SeriesCVCellView) {
        self.view = view
        
        setTitle()
        setVoteAverage()
        setPosterImage()
        setFirstAirDate()
    }
    
    // MARK: Private Methods
    
    private func setTitle() {
        view?.setTitle(with: model.title)
    }
    
    private func setVoteAverage() {
        view?.setVoteAverage(with: "Vote average: \(model.voteAverage)")
    }
    
    private func setPosterImage() {
        view?.setPosterImage(with: Urls.imageBase + model.image)
    }
    
    private func setFirstAirDate() {
        let formmatedDate = model.firstAirDate.formattedDate()
        view?.setFirstAirDate(with: "First air date: \(formmatedDate)")
    }
}
