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
    <input disabled name="title" value="${training['title']}"></input>
    <input disabled name="desc" value="${training['desc']}"></input>
    <input disabled name="data_form" value="${training['date_from']}"></input>
    <input disabled name="date_to" value="${training['date_to']}"></input>
    <input disabled name="min_participants" value="${training['min_participants']}"></input>
    <input disabled name="max_participants" value="${training['max_participants']}"></input>
    <div class="actions">
      <a href="/edit-training?id=${training['id']}" class="edit"><img title="Bearbeiten" class="icon" src="/static/icons/edit.svg" /></a>
      <a href="#" class="delete"><img title="Löschen" class="icon" src="/static/icons/trash-2.svg" /></a>
      <a href="#" class="display"><img title="Anzeigen" class="icon" src="/static/icons/search.svg" /></a>
    </div>
  </div>
% endfor
</br>
  <a href="#" class="add">Weiterbildung hinzufügen</a>
</div>
