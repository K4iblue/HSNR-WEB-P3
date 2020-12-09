<%inherit file="layout.mako"/>
<%def name="head()">
  <script defer src="/static/edit-training.js"></script>
</%def>
<%def name="title()">
  Weiterbildung hinzufügen
</%def>
<h2>Weiterbildungen:</h2>
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
<br/>
<br/>
<div class="flex-buttons">
  <a href="#" class="save button">Speichern</a>
  <a href="/edit-trainings" class="back button">Zurück</a>
</div>
