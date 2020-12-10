<%inherit file="layout.mako"/>
<%def name="head()">
  <script defer src="/static/add-training.js"></script>
</%def>
<%def name="title()">
  Weiterbildung hinzufügen
</%def>
<h2>Weiterbildung Hinzufügen:</h2>
<label>Bezeichnung:</label>
<input name="title"/>
<label>Beschreibung:</label>
<textarea name="desc"></textarea>
<label>Von:</label>
<input type="date" name="date_from"/>
<label>Bis:</label>
<input type="date" name="date_to"/>
<label>minimale Teilnehmer:</label>
<input type="number" name="min_participants"/>
<label>maximale Teilnehmer:</label>
<input type="number" name="max_participants"/>
<label>Zertifikat:</label>
<select name="certificate_id">
  % for certificate in certificates:
    <option value="${certificate["id"]}">${certificate["title"]}</option>
  % endfor
</select>
<br/>
<div class="alert-box-warning">
  Qualifikationen können erst nach der Erstellung über die Bearbeiten-Funktion hinzufügen werden.
</div>
<div class="flex-buttons">
  <a href="#" class="add button">Weiterbildung hinzufügen</a>
  <a href="/edit-trainings" class="back button">Zurück</a>
</div>
