<%inherit file="layout.mako"/>
<%def name="head()">
</%def>
<%def name="title()">
  Weiterbildung bearbeiten
</%def>
<h2>Weiterbildung Bearbeiten:</h2>
<input disabled name="id" value="${training["id"]}" hidden/>
<label for="title">Bezeichnung:</label>
<input disabled name="title" value="${training["title"] | h}"></input disabled>
<label for="desc">Beschreibung:</label>
<textarea disabled name="desc">${training["desc"]}</textarea>
<label for="date_from">Von:</label>
<input disabled type="date" name="date_from" value="${training["date_from"] | h}"></input disabled>
<label for="date_to">Bis:</label>
<input disabled type="date" name="date_to" value="${training["date_to"] | h}"></input disabled>
<label for="min_participants">minimale Teilnehmer:</label>
<input disabled type="number" name="min_participants" value="${training["min_participants"] | h}"></input disabled>
<label for="max_participants">maximale Teilnehmer:</label>
<input disabled type="number" name="max_participants" value="${training["max_participants"] | h}"></input disabled>
<label>Zertifikat:</label>
<input disabled value="${certificate["title"]}"></input>
<br/>
<h2>Qualifikationen:</h2>
<div class="list-header list-qualifications">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
</div>
% for qualification in qualifications:
  <div data-qualification-id="${qualification['id']}" class="list-row list-qualifications">
    <input disabled disabled name="title" data-init-value="${qualification['title'] | h}" value="${qualification['title'] | h}"></input disabled>
    <input disabled disabled name="desc" data-init-value="${qualification['desc'] | h}" value="${qualification['desc'] | h}"></input disabled>
  </div>
% endfor

<br/>
<div class="flex-buttons">
  <a href="/edit-trainings" class="back button">Zurück</a>
  <a href="/edit-training/${training["id"]}" class="edit button">Bearbeiten</a>
</div>
