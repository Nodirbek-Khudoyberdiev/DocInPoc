//
//  ReactiveCoordinator.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 27/04/24.
//

import RxSwift

class ReactiveCoordinator<ResultType>: NSObject {

    public typealias CoordinationResult = ResultType

    public let disposeBag = DisposeBag()
    private let identifier = UUID()
    private var childCoordinators = [UUID: Any]()

    private func store<T>(coordinator: ReactiveCoordinator<T>) {
        childCoordinators[coordinator.identifier] = coordinator
    }

    private func release<T>(coordinator: ReactiveCoordinator<T>) {
        childCoordinators[coordinator.identifier] = nil
    }

    @discardableResult
    func coordinate<T>(to coordinator: ReactiveCoordinator<T>) -> Observable<T> {
        store(coordinator: coordinator)
        return coordinator.start()
            .do(onNext: { [weak self] _ in
                self?.release(coordinator: coordinator) })
    }

    func start(_ di: DependencyContainerProtocol = DependencyContainer.shared) -> Observable<ResultType> {
        fatalError("start() method must be implemented")
    }
    
    func setRootViewController(_ viewController: UIViewController){
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as? SceneDelegate,
              let window = sceneDelegate.window else { return }
        
        let navVC = UINavigationController(rootViewController: viewController)
        navVC.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navVC
        
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.3
        
        UIView.transition(with: window, duration: duration, options: options, animations: {})
    }
}
