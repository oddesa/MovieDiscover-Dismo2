//
//  MovieDiscoverRouter.swift
//  Dismo 2
//
//  Created by Jehnsen Hirena Kane on 15/04/23.
//

import UIKit
import Shared

public class MovieDiscoverRouter: MovieDiscoverRouterProtocol {
    public func presentMovieCollectionsScreen(from view: MovieDiscoverViewProtocol, for genre: MovieGenre) {
//        let collectionsVC = MovieCollectionsRouter.createMovieCollectionsModule(with: genre)
//        guard let viewVC = view as? UIViewController else {
//            fatalError("Invalid View Protocol type")
//        }
//        viewVC.navigationController?.pushViewController(collectionsVC, animated: true)
        Router.route?(.collectionsPage(genre: genre))
    }
    
    public static func createMovieDiscoverModule() -> UIViewController {
        let viewController: MovieDiscoverViewProtocol & UIViewController = MovieDiscoverViewController()
        let presenter: MovieDiscoverPresenterProtocol & MovieDiscoverInteractorOutputProtocol = MovieDiscoverPresenter()
        let interactor: MovieDiscoverInteractorInputProtocol = MovieDiscoverInteractor()
        let router: MovieDiscoverRouterProtocol = MovieDiscoverRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return UINavigationController(rootViewController: viewController)
    }
    
    public func presentMovieDetailsScreen(from view: MovieDiscoverViewProtocol , for details: MovieDetails) {
//        let movieDetailsVC = MovieDetailsRouter.createMovieDetailsModule(with: details)
        guard let _ = view as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }
//        viewVC.navigationController?.pushViewController(movieDetailsVC, animated: true)
        Router.route?(.detailsPage(details: details))
    }
}
