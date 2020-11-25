<html>
  <head>
    <%block name="header"/>
    <link rel="stylesheet" href="/main.css">
    <script defer src="/main.js"></script>
  </head>
  <body>
    <header>
      <div class="box">
        <p>Mitarbeiterqualifizierung</p>
        <p>Version xx / xx.xx.xxxx</p>
      </div>
      <div class="box">
        Team: Erik Simon | Gordon Goldbach
      </div>
    </header>
    <nav>
      <div class="box">
        <a href="/">Startseite</a>
      </div>
      <div class="box">
        <a href="/edit-employees">Pflege Mitarbeiterdaten</a>
        <a href="/edit-trainings">Pflege Weiterbildungen</a>
      </div>
      <div class="box">
        <a href="/participation-employees">Sichtweise Mitarbeiter</a>
        <a href="/participation-trainings">Sichtweise Weiterbildungen</a>
      </div>
      <div class="box">
        <a href="/report-employees">Auswertung Mitarbeiter</a>
        <a href="/report-trainings">Auswertung Weiterbildungen</a>
        <a href="/report-certificates">Auswertung Zertifikate</a>
      </div>
    </nav>
    <main>
      <div class="box">
        ${self.body()}
      </div>
    </main>
  </body>
</html>
