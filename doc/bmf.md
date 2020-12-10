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

Die Anwendung "Mitarbeiter Qualifizierung" ermöglicht das Erfassen von Mitarbeitern, Weiterbildungen, Zertifikaten und Qualifizierungen.
Mitarbeiter können an Weiterbildungen teilnehmen und erlangen dadurch neue Zertifikate und Qualifikationen.
Desweiteren stehen Funktionen zur Auswertung zur verfügung welche eine Übersicht über alle Mitarbeiter und deren Zertifikate und Qualifikationen liefern.

### Übersicht der fachlichen Funktionen

#### Startseite

Hier wird die Anzahl der bereits erfassten Mitarbeiter, Weiterbildungen und der gesamten Teilnahmen an diesen angezeigt.

#### Pflege

Die Pflege Seiten stellen Funktionalität zur Verwaltung der Daten zur verfügung.
Es können neue Mitarbeiter, Weiterbildungen, Zertifikate und Qualifikationen angelegt werden.
Den Weiterbildungen können hier die Zertifikate und Qualifikationen zugeordnet werden welche die Mitarbeiter durch eine erfolgreiche Teilnahme erlangen können.

#### Teilnahme

Auf den Teilnahme Seiten hat der Nutzer die Möglichkeit Teilnahmen an Weiterbildungen zu verwalten.
Die Sichtweise Mitarbeiter listet alle erfassten Mitarbeiter im System auf und ermöglicht über eine Detailansicht die Mitarbeiter für eine Weiterbildung einzutragen.
In der Weiterbildungsansicht werden alle laufenden Weiterbildungen gelistet und über die Detailansicht kann der Status der Teilnahmen für die einzelnen Mitarbeiter angepasst werden.

#### Auswertungen

Die Auswertungsseiten liefern einen Überblick über aktuelle Teilnahmen inklusive Status und den bereits erlangten Zertifikaten der einzelnen Mitarbeiter.

## Beschreibung der Komponenten des Servers

### application.py

#### Zweck

#### Aufbau

#### Zusammenwirken mit anderen Komponenten

#### API

### employee_api.py

#### Zweck

#### Aufbau

#### Zusammenwirken mit anderen Komponenten

#### API

### training_api.py

#### Zweck

#### Aufbau

#### Zusammenwirken mit anderen Komponenten

#### API

### participation_api.py

#### Zweck

#### Aufbau

#### Zusammenwirken mit anderen Komponenten

#### API

### certificate_api.py

#### Zweck

#### Aufbau

#### Zusammenwirken mit anderen Komponenten

#### API

### qualification_api.py

#### Zweck

#### Aufbau

#### Zusammenwirken mit anderen Komponenten

#### API

### view.py

#### Zweck

Die View Klasse verwaltet die Mako Templates der einzelnen Seiten dieser Anwendung.

#### Aufbau

#### Zusammenwirken mit anderen Komponenten

Der Hauptkontroller bezieht den HTML Code der Seiten von dieser Klasse.

#### API

`def __init__(self)`
        
Der Constructor erzeugt ein Mako TemplateLookup.

`def index(self, data)`

Gibt den HTML Code der Startseite zurück.

`def editEmployees(self, data)`
    
Gibt den HTML Code der Mitarbeiter Pflege zurück.

`def viewEmployee(self, data)`
        
Gibt den HTML Code der Mitarbeiter Detailansicht zurück.

`def editCertificates(self, data)`

Gibt den HTML Code der Zertifikat Pflege zurück.

`def editQualifications(self, data)`

Gibt den HTML Code der Qualifikationen Pflege zurück.

`def editTrainings(self, data)`

Gibt den HTML Code der Weiterbildungen Pflege zurück.

`def viewTraining(self, data)`

Gibt den HTML Code der Weiterbildungs Detailansicht zurück.

`def editTraining(self, data)`

Gibt den HTML Code der Weiterbildungsbearbeitungsseite zurück.

`def addTraining(self, data)`

Gibt den HTML Code der Seite zum Hinzufügen einer Weiterbildung zurück.

`def participationEmployees(self, data)`

Gibt den HTML Code der Teilnahme Mitarbeiterübersicht zurück.

`def participationEmployee(self, data)`

Gibt den HTML Code der Bearbeitungsseite für Mitarbeiterteilnahmen zurück.

`def participationTrainings(self, data)`

Gibt den HTML Code der Teilnahme Weiterbildungsübersicht zurück.

`def participationTraining(self, data)`

Gibt den HTML Code der Bearbeitungsseite für Weiterbildungsteilnahmen zurück.

`def reportEmployees(self, data)`

Gibt den HTML Code der Mitarbeiterauswertung zurück.

`def reportTrainings(self, data)`

Gibt den HTML Code der Weiterbbildungsauswertung zurück.

`def reportCertificates(self, data)`

Gibt den HTML Code der Zertifikatauswertung zurück.

### database.py

#### Zweck

Die Klasse bietet eine Schnittstelle zur SQlite Datenbank.
Die Datenmodels können per decorator aufgesetzt werden was ein automatisiertes erstellen der Tabellen erlaubt.

#### Aufbau

#### Zusammenwirken mit anderen Komponenten

Instanzen der Datenbanken werden an die API controller übergeben.

#### API

`def __init__(self, model)`

Der Contruktor bekommt den Typ des Models übergeben und ruft `__createTable()` auf.

`def __createTable(self)`

Erzeugt aus den Metadaten des Models eine passende Tabelle in der Datenbank falls diese noch nicht existiert.

`def insert(self, obj)`

Fügt ein neues Objekt der Tabelle hinzu.

`def update(self, obj)`

Aktualisiert die Daten eines bereits existierenden Objektes in der Tabelle.

`def get_all(self)`

Liefert alle Einträge der Tabelle.

`def get_by_index(self, index)`

Gibt den Eintrag entsprechend des übergebenen Indexes zurück.

`def delete(self, index)`

Löscht den Eintrag entsprechend des übergebenen Indexes.

`def count(self)`

Gibt die Anzahl der Einträge zurück.

`def query(self, sql)`

Erlaubt das Ausführen eines beliebiegen SQL Queries welches als String übergeben wird.

`def deserialize_result(self, result, additional_fields = None)`

Erzeugt ein Model/Liste von Models anhand des Rückgabewertes eines queries.
Über additional fields können zusätzliche Felder deserialisiert werden, dabei ist zu beachten dass diese Felder im Query erst nach den ursprünglichen Feldern des Models zurückgegeben werden dürfen.
Außerdem muss im Query die Reihenfolge der Felder mit denen im Model übereinstimmen.


## Datenablage

Die Daten der Anwendung werden in einer SQLite Datenbank gespeichert.
Diese Datenbank ist in folgende Tabellen unterteilt.

- employee
- employee_owns_certificate
- employee_owns_qualification
- training
- training_grants_qualification
- certificate
- qualification
- participation

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
| --- | --- |
| main.css | 0 |
| layout.css | 0 |
| counter.css | 2 |

Die Fehler in der counter.css Datei kommen daher zustande, dass wir sehr neue CSS Regeln nutzen, welche noch nicht in dem CSS3 Standard sind. Die Counter animation wird z.B. nur von Chrome bzw. Chromium unterstützt. Das ist aber nicht schlimm, da Browser welche die Animation nicht unterstützen immer noch alles anzeigen können. Es ist natürlich schade aber nicht das Ende, wenn nicht alle Browser die tolle Animation darstellen können.
