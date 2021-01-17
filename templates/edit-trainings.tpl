% window.setTitle("Weiterbildungs Pflege")
<h2>Weiterbildungen:</h2>
<div class="list-header list-trainings">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div>Von</div>
  <div>Bis</div>
  <div>min. Teilnehmer</div>
  <div>max. Teilnehmer</div>
  <div>Aktionen</div>
</div>
% trainings.forEach(training => {
  <div data-training-id="${training['id']}" class="list-row list-trainings">
    <input disabled name="title" value="${training['title']}"/>
    <input disabled name="desc" value="${training['desc'].replace("\n", " ")}"/>
    <input disabled name="data_from" type="date" value="${training['date_from']}"/>
    <input disabled name="date_to" type="date" value="${training['date_to']}"/>
    <input disabled name="min_participants" value="${training['min_participants']}"/>
    <input disabled name="max_participants" value="${training['max_participants']}"/>
    <div class="actions">
      <a href="/edit-training/${training['id']}" class="edit"><img title="Bearbeiten" class="icon" src="/static/icons/edit.svg" /></a>
      <a href="#" class="delete"><img title="Löschen" class="icon" src="/static/icons/trash-2.svg" /></a>
      <a href="/view-training/${training['id']}" class="display"><img title="Anzeigen" class="icon" src="/static/icons/search.svg" /></a>
    </div>
  </div>
% })
<br/>
<a href="/add-training" class="add button">Neue Weiterbildung hinzufügen</a>
