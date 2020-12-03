<!DOCTYPE html>
  <head>
    <title>${self.title()}</title>
    ${(hasattr(self, 'head') and self.head()) or ''}
    <link rel="stylesheet" href="/static/main.css">
    <script defer src="/static/main.js"></script>
  </head>
  <body>
    <header>
      <div class="box">
        <div>
          <h1>Mitarbeiterqualifizierung - ${self.title()}</h1>
          <p>Version 1.0 / 25.11.2020</p>
        </div>
        <div>
          <code>
            Erik Simon (1049804)
            <br/>
            Gordon Goldbach (1290002)
          </code>
        </div>
      </div>
    </header>
    <nav>
      <div class="box">
        <span class="nav-headline"><a href="/">Startseite</a></span>
      </div>
      <div class="box">
        <span class="nav-headline">
          Pflege
        </span>
        <ul>
          <li><a href="/edit-employees">Pflege Mitarbeiterdaten</a></li>
          <li><a href="/edit-trainings">Pflege Weiterbildungen</a></li>
        </ul>
      </div>
      <div class="box">
        <span class="nav-headline">
          Teilnahme
        </span>
        <ul>
          <li><a href="/participation-employees">Sichtweise Mitarbeiter</a></li>
          <li><a href="/participation-trainings">Sichtweise Weiterbildungen</a></li>
        </ul>
      </div>
      <div class="box">
        <span class="nav-headline">
          Auswertungen
        </span>
        <ul>
          <li><a href="/report-employees">Auswertung Mitarbeiter</a></li>
          <li><a href="/report-trainings">Auswertung Weiterbildungen</a></li>
          <li><a href="/report-certificates">Auswertung Zertifikate</a></li>
        </ul>
      </div>
    </nav>
    <main>
      <div class="box">
        ${self.body()}
      </div>
    </main>
  </body>
</html>
