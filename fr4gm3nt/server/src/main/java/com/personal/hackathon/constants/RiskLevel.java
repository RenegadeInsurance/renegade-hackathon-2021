package com.personal.hackathon.constants;

import lombok.Getter;

@Getter
public enum RiskLevel {

    LOW("LOW"), MODERATE("MODERATE"), HIGH("HIGH");

    private final String riskLevel;

    RiskLevel(String riskLevel) {
        this.riskLevel = riskLevel;
    }

}
