//
//  SerieDetailsService.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 20/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class SerieDetailsService: SeriesDetailsServiceInput {
    
    weak var output: SeriesDetailsServiceOutput?
    private let api: APIProvider
    private let serieId: Int
    
    init(api: APIProvider = APICore(), serieId: Int) {
        self.api = api
        self.serieId = serieId
    }
    
    // MARK: SeriesDetailsServiceInput Interface Implementation
    
    func fetchSerieDetails() {
        api.request(url: Urls.serieDetailsPart1 + "\(serieId)" + Urls.serieDetailsPart2, success: { [output] (serieDetail: SerieDetails) in
            output?.fetchSerieDetailsSucceeded(serieDetails: serieDetail)
        }) { [output] (error) in
            output?.fetchSerieDetailsFailed(error: error)
        }
    }
    
    func fetchSimilarSeries() {
        api.request(url: Urls.similarSeriesPart1 + "\(serieId)" + Urls.similarSeriesPart2, success: { [output] (similarSeries: SimilarSeriesResponse) in
            output?.fetchSimilarSeriesSucceeded(similarSeries: similarSeries.results)
        }) { [output] (error) in
            output?.fetchSerieDetailsFailed(error: error)
        }
    }
    
}
