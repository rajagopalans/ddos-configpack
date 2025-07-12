# DDOS Config Pack

## What does this Config Pack Do

This config pack creates the iba elements required to track how often traffic has exceeded the thresholds defined by DDoS protection policers.

It tracks the policer-violation-count metric on JunOS machines.

## JunOS Compatibility
This Config Pack will work with version 21.2r2 on JunOS families junos, junos-ex and junos-qfx

## Components

| Component | Name | Description                                                                             |
|-----------|------|-----------------------------------------------------------------------------------------|
|Service Registry |DDoS_Protection_Protocols| Service description for the DDOS collector                                              |
|Custom Collector| DDoS_Protection_Protocols| Custom Collector that reads the policer-violation-count in the ddos-system-statistics   |
|Probe|DDOS_Protection_Protocols| Probe that consumes the collector output and raises an anomaly if the count is not zero |
|Dashboard| DDoS Protection Protocols| Dashboard that consumes the Probe|                                              |

