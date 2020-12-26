% window.setTitle("Qualifikationen Pflege")
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
      <a href="#" class="edit"><img title="Bearbeiten" class="icon" src="/static/icons/edit.svg" /></a>
      <a href="#" hidden class="save"><img title="Speichern" class="icon" src="/static/icons/check.svg" /></a>
      <a href="#" hidden class="cancel"><img title="Abbrechen" class="icon" src="/static/icons/x.svg" /></a>
      <a href="#" class="delete"><img title="Löschen" class="icon" src="/static/icons/trash-2.svg" /></a>
    </div>
  </div>
% })
<br/>
<h2>Qualifikation hinzufügen:</h2>
<div class="list-header list-qualifications">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div></div>
</div>
<div class="active list-row list-qualifications">
  <input name="title"/>
  <input name="desc"/>
  <div class="actions">
    <a href="#" class="add">Hinzufügen</a>
  </div>
</div>
