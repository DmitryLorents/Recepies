// TermsView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Экран Terms of Use
final class TermsView: UIView {
    // MARK: - Types
    private enum Constants {
        static let cancelImage = "xmark"
    }
/// Виды показа вью
    private enum ViewState {
        /// Полное открытие вью
        case expanded
        /// Закрытие вью
        case collapsed
    }
    

    // MARK: - Visual Components

    private let nameTermsLabel: UILabel = {
        let label = UILabel()
        label.text = Terms.titleTerms
        label.font = UIFont.makeVerdanaBold(size: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

    }()

    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constants.cancelImage), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapCancelButton), for: .touchUpInside)
        return button
    }()

    private let textTermsLabel: UILabel = {
        let label = UILabel()
        label.font = .makeVerdanaRegular(size: 14)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Terms.textTerms
        return label

    }()

    private let handleArea = UIView()

    // MARK: - Public Properties

    var darkHandler: VoidHandler?

    // MARK: - Private Properties

    private let cardHeight: CGFloat = 750
    private let cardHandlerAreaHeight: CGFloat = -50

    private var cardVisible = false

    private var nextState: ViewState {
        cardVisible ? .collapsed : .expanded
    }

    private var animationsProgressWhenInterrupted: CGFloat = 0

    private var runningAnimations: [UIViewPropertyAnimator] = .init()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        configureView()
    }

    // MARK: - Private Methods

    private func configureView() {
        addSubview(handleArea)
        addSubview(nameTermsLabel)
        addSubview(textTermsLabel)
        addSubview(cancelButton)
        layer.cornerRadius = 20
        backgroundColor = .white
        setConstraint()
    }

    private func setConstraint() {
        setHandleAreaConstraint()
        setTitleConstraint()
        setTextTermsConstraint()
        setCancelButtonConstraint()
    }

    private func setHandleAreaConstraint() {
        handleArea.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            handleArea.topAnchor.constraint(equalTo: topAnchor),
            handleArea.leadingAnchor.constraint(equalTo: leadingAnchor),
            handleArea.widthAnchor.constraint(equalToConstant: bounds.width),
            handleArea.heightAnchor.constraint(equalToConstant: 25)
        ])
    }

    private func setTitleConstraint() {
        NSLayoutConstraint.activate([
            nameTermsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            nameTermsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 26)

        ])
    }

    private func setTextTermsConstraint() {
        NSLayoutConstraint.activate([
            textTermsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            textTermsLabel.topAnchor.constraint(equalTo: nameTermsLabel.bottomAnchor, constant: 10),
            textTermsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            textTermsLabel.heightAnchor.constraint(equalToConstant: bounds.height - 190)
        ])
    }

    private func setCancelButtonConstraint() {
        NSLayoutConstraint.activate([
            cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            cancelButton.topAnchor.constraint(equalTo: topAnchor, constant: 25)
        ])
    }

    private func setupView() {
        let tapGestureRecoconizer = UITapGestureRecognizer(
            target: self,
            action: #selector(handleCardTap(recognizer:))
        )
        let panGestureRecognizer = UIPanGestureRecognizer(
            target: self,
            action: #selector(handleCardPan(recognizer:))
        )
        handleArea.addGestureRecognizer(tapGestureRecoconizer)
        handleArea.addGestureRecognizer(panGestureRecognizer)
    }

    private func animateTransitionIfNeeded(state: ViewState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.frame.origin.y = self.frame.height - self.cardHeight
                case .collapsed:
                    self.darkHandler?()
                    self.frame.origin.y = self.frame.height - self.cardHandlerAreaHeight
                }
            }
            frameAnimator.addCompletion { _ in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
        }
    }

    private func startInteractiveTransition(state: ViewState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationsProgressWhenInterrupted = animator.fractionComplete
        }
    }

    private func updateInteractiveTransition(fractionCompleted: CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionCompleted + animationsProgressWhenInterrupted
        }
    }

    private func continueInteractiveTRasition() {
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }

    @objc private func tapCancelButton() {
        darkHandler?()
        animateTransitionIfNeeded(state: .collapsed, duration: 0.9)
    }

    @objc private func handleCardTap(recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
        default:
            break
        }
    }

    @objc private func handleCardPan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            startInteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            let traslation = recognizer.translation(in: handleArea)
            var fractionComplete = traslation.y / cardHeight
            fractionComplete = cardVisible ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionCompleted: fractionComplete)
        case .ended:
            continueInteractiveTRasition()
        default:
            break
        }
    }
}
