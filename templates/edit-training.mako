<%inherit file="layout.mako"/>
<%def name="head()">
  <script defer src="/static/edit-training.js"></script>
</%def>
<%def name="title()">
  Weiterbildung bearbeiten
</%def>
<h2>Weiterbildung Bearbeiten:</h2>
<input name="id" value="${training["id"]}" hidden/>
<label for="title">Bezeichnung:</label>
<input name="title" value="${training["title"] | h}"></input>
<label for="desc">Beschreibung:</label>
<textarea name="desc">${training["desc"]}</textarea>
<label for="date_from">Von:</label>
<input type="date" name="date_from" value="${training["date_from"] | h}"></input>
<label for="date_to">Bis:</label>
<input type="date" name="date_to" value="${training["date_to"] | h}"></input>
<label for="min_participants">minimale Teilnehmer:</label>
<input type="number" name="min_participants" value="${training["min_participants"] | h}"></input>
<label for="max_participants">maximale Teilnehmer:</label>
<input type="number" name="max_participants" value="${training["max_participants"] | h}"></input>
<label>Zertifikat:</label>
<select name="certificate">
  % for certificate in certificates:
    <option value="${certificate["id"]}" ${certificate["id"] == training["certificate_id"] and "selected" or ""}>${certificate["title"]}</option>
  % endfor
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
% for qualification in qualifications:
  <div data-qualification-id="${qualification['id']}" class="list-row list-qualifications">
    <input disabled name="title" data-init-value="${qualification['title'] | h}" value="${qualification['title'] | h}"></input>
    <input disabled name="desc" data-init-value="${qualification['desc'] | h}" value="${qualification['desc'] | h}"></input>
    <div class="actions">
      <a href="#" class="delete"><img title="Löschen" class="icon" src="/static/icons/trash-2.svg" /></a>
    </div>
  </div>
% endfor

  <h3>Qualifikation hinzufügen</h3>
  <select name="qualification">
  % for qualification in all_qualifications:
    <option value="${qualification["id"]}">${qualification["title"]}</option>
  % endfor
  </select>
  <a href="#" class="add">Hinzufügen</a>
<br/>
<br/>
<div class="flex-buttons">
  <a href="/edit-trainings" class="back button">Zurück</a>
</div>
