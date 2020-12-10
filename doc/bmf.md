---
title: Mitarbeiter Qualifizierung
author:
- Erik Simon
- Gordon Goldbach
date: 10.12.2020
---

# Mitarbeiter Qualifizierung

## Allgemeine Beschreibung

### Aufgabe der Anwendung

### Übersicht der fachlichen Funktionen

## Beschreibung der Komponenten des Servers

### Application.py

#### Zweck

#### Aufbau

#### Zusammenwirken mit anderen Komponenten

#### API

## Datenablage

## Konfiguration

## Durchführung und Ergebnis der geforderten Prüfungen

### Markup Validierung

Wir haben den Source Code aller Routen mittels dem [Markdown Validator](https://validator.w3.org/nu/) getestet.

| Route | Fehler |
| --- | --- |
| / | 0 |
| /edit-employees | 0 |
| /view-employee/MITARBEITER_NUMMER | 0 |
| /edit-trainings | 0 |
| /edit-training/TRAINING_NUMMER | 0 |
| /view-training/TRAINING_NUMMER | 0 |
| /add-training | 0 |
| /edit-certificates | 0 |
| /edit-qualifications | 0 |
| /participation-employees | 0 |
| /participation-employee/MITARBEITER_NUMMER | 0 |
| /participation-trainings | 0 |
| /participation-training/MITARBEITER_NUMMER | 0 |
| /report-employees | 0 |
| /report-trainings | 0 |
| /report-certificates | 0 |

### CSS Validierung

Wir haben den Source Code von allen CSS-Dateien mit dem [CSS Validator](http://jigsaw.w3.org/css-validator/validator) überprüft und sind zu folgenden Ergebnissen gekommen.

| Datei | Fehler |
| main.css | 0 |
| layout.css | 0 |
| counter.css | 2 |

Die Fehler in der counter.css Datei kommen daher zustande, dass wir sehr neue CSS Regeln nutzen, welche noch nicht in dem CSS3 Standard sind. Die Counter animation wird z.B. nur von Chrome bzw. Chromium unterstützt. Das ist aber nicht schlimm, da Browser welche die Animation nicht unterstützen immer noch alles anzeigen können. Es ist natürlich schade aber nicht das Ende, wenn nicht alle Browser die tolle Animation darstellen können.
