<%inherit file="layout.mako"/>
<%def name="head()">
  <script defer src="/static/edit-trainings.js"></script>
</%def>
<%def name="title()">
  Weiterbildungs Pflege
</%def>
<h2>Weiterbildungen:</h2>
<div class="list-header list-trainings">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div>Von</div>
  <div>Bis</div>
  <div>max. Teilnehmer</div>
  <div>min. Teilnehmer</div>
  <div>Aktionen</div>
</div>
% for training in trainings:
  <div data-training-id="${training['id']}" class="list-row list-trainings">
    <input disabled name="title" value="${training['title'] | h}"></input>
    <input disabled name="desc" value="${training['desc'] | h}"></input>
    <input disabled name="data_from" type="date" value="${training['date_from'] | h}"></input>
    <input disabled name="date_to" type="date" value="${training['date_to'] | h}"></input>
    <input disabled name="min_participants" value="${training['min_participants'] | h}"></input>
    <input disabled name="max_participants" value="${training['max_participants'] | h}"></input>
    <div class="actions">
      <a href="/edit-training?index=${training['id']}" class="edit"><img title="Bearbeiten" class="icon" src="/static/icons/edit.svg" /></a>
      <a href="#" class="delete"><img title="Löschen" class="icon" src="/static/icons/trash-2.svg" /></a>
      <a href="#" class="display"><img title="Anzeigen" class="icon" src="/static/icons/search.svg" /></a>
    </div>
  </div>
% endfor
</br>
<a href="/add-training" class="add button">Neue Weiterbildung hinzufügen</a>
