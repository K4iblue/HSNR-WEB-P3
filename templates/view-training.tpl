% window.setTitle("Weiterbildung Details")
<h2>Weiterbildung Details:</h2>
<input disabled name="id" value="${training["id"]}" hidden/>
<label>Bezeichnung:</label>
<input disabled name="title" value="${training["title"]}"/>
<label>Beschreibung:</label>
<textarea disabled name="desc">${training["desc"]}</textarea>
<label>Von:</label>
<input disabled type="date" name="date_from" value="${training["date_from"]}"/>
<label>Bis:</label>
<input disabled type="date" name="date_to" value="${training["date_to"]}"/>
<label>minimale Teilnehmer:</label>
<input disabled type="number" name="min_participants" value="${training["min_participants"]}"/>
<label>maximale Teilnehmer:</label>
<input disabled type="number" name="max_participants" value="${training["max_participants"]}"/>
<label>Zertifikat:</label>
<input disabled value="${certificate["title"]}"/>
<br/>
<h2>Qualifikationen:</h2>
<div class="list-header list-qualifications">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
</div>
% qualifications.forEach(qualification => {
  <div data-qualification-id="${qualification['id']}" class="list-row list-qualifications">
    <input disabled name="title" data-init-value="${qualification['title']}" value="${qualification['title']}"/>
    <input disabled name="desc" data-init-value="${qualification['desc']}" value="${qualification['desc']}"/>
  </div>
% })

<br/>
<div class="flex-buttons">
  <a href="/edit-trainings" class="back button">Zurück</a>
  <a href="/edit-training/${training["id"]}" class="edit button">Bearbeiten</a>
</div>
