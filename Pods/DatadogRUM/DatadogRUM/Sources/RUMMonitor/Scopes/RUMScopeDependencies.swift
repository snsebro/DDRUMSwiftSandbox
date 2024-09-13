/*
 * Unless explicitly stated otherwise all files in this repository are licensed under the Apache License Version 2.0.
 * This product includes software developed at Datadog (https://www.datadoghq.com/).
 * Copyright 2019-Present Datadog, Inc.
 */

import Foundation
import DatadogInternal

internal struct VitalsReaders {
    let frequency: TimeInterval

    var cpu: SamplingBasedVitalReader
    var memory: SamplingBasedVitalReader
    var refreshRate: ContinuousVitalReader

    init(
        frequency: TimeInterval,
        telemetry: Telemetry = NOPTelemetry()
    ) {
        self.frequency = frequency
        self.cpu = VitalCPUReader(telemetry: telemetry)
        self.memory = VitalMemoryReader()
        self.refreshRate = VitalRefreshRateReader()
    }
}

/// Dependency container for injecting components to `RUMScopes` hierarchy.
internal struct RUMScopeDependencies {
    weak var core: DatadogCoreProtocol?
    let rumApplicationID: String
    let sessionSampler: Sampler
    let trackBackgroundEvents: Bool
    let trackFrustrations: Bool
    let firstPartyHosts: FirstPartyHosts?
    let eventBuilder: RUMEventBuilder
    let rumUUIDGenerator: RUMUUIDGenerator
    /// Integration with CIApp tests. It contains the CIApp test context when active.
    let ciTest: RUMCITest?
    let vitalsReaders: VitalsReaders?
    let onSessionStart: RUM.SessionListener?

    var telemetry: Telemetry {
        core?.telemetry ?? NOPTelemetry()
    }
}
