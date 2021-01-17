% window.setTitle("Weiterbildung bearbeiten")
<h2>Weiterbildung Bearbeiten:</h2>
<input name="id" value="${training["id"]}" hidden/>
<label>Bezeichnung:</label>
<input name="title" value="${training["title"]}"/>
<label>Beschreibung:</label>
<textarea name="desc">${training["desc"]}</textarea>
<label>Von:</label>
<input type="date" name="date_from" value="${training["date_from"]}"/>
<label>Bis:</label>
<input type="date" name="date_to" value="${training["date_to"]}"/>
<label>minimale Teilnehmer:</label>
<input type="number" name="min_participants" value="${training["min_participants"]}"/>
<label>maximale Teilnehmer:</label>
<input type="number" name="max_participants" value="${training["max_participants"]}"/>
<label>Zertifikat:</label>
<select name="certificate">
% certificates.forEach(certificate => {
    <option value="${certificate["id"]}" ${certificate["id"] == training["certificate_id"] && "selected" || ""}>${certificate["title"]}</option>
% })
</select>
<br/>
<br/>
<div class="flex-buttons">
  <a href="#" class="save button">Speichern</a>
  <a href="/edit-trainings" class="back button">Zurück</a>
</div>
<br/>
<h2>Qualifikationen:</h2>
<div class="list-header list-qualifications">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div>Aktionen</div>
</div>
% qualifications.forEach(qualification => {
  <div data-qualification-id="${qualification['id']}" class="list-row list-qualifications">
    <input disabled name="title" data-init-value="${qualification['title']}" value="${qualification['title']}"/>
    <input disabled name="desc" data-init-value="${qualification['desc']}" value="${qualification['desc']}"/>
    <div class="actions">
      <a href="#" class="delete"><img title="Löschen" class="icon" src="/static/icons/trash-2.svg" /></a>
    </div>
  </div>
% })

  <h3>Qualifikation hinzufügen</h3>
  <select name="qualification">
% all_qualifications.forEach(qualification => {
    <option value="${qualification["id"]}">${qualification["title"]}</option>
% })
  </select>
  <a href="#" class="add">Hinzufügen</a>
<br/>
<br/>
<div class="flex-buttons">
  <a href="/participation-employees" class="back button">Zurück</a>
</div>
