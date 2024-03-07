// LoggerInvoker.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Save user activities logs
final class LoggerInvoker {
    // MARK: - Singletone

    static let shated = LoggerInvoker()
    private init() {}

    // MARK: - Private Prperties

    private let logger = Logger()
    private let batchSize = 1
    private var commands: [LogCommand] = []

    // MARK: - Public Methods

    func addLogCommand(_ command: LogCommand) {
        commands.append(command)
        executeCommandsIfNeeded()
    }

    // MARK: - Private Methods

    private func executeCommandsIfNeeded() {
        guard commands.count >= batchSize else { return }
        commands.forEach { logger.writeMessageToLog($0.message) }
    }
}
