% window.setTitle("Zertifikate Pflege")
<h2>Zertifikate:</h2>
<div class="list-header list-certificates">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div>Bereichtigt zu</div>
  <div>Aktionen</div>
</div>
% certificates.forEach(certificate => {
  <div data-certificate-id="${certificate['id']}" class="list-row list-certificates">
    <input disabled name="title" data-init-value="${certificate['title']}" value="${certificate['title']}"/>
    <input disabled name="desc" data-init-value="${certificate['desc']}" value="${certificate['desc']}"/>
    <input disabled name="qualifies" data-init-value="${certificate['qualifies']}" value="${certificate['qualifies']}"/>
    <div class="actions">
      <a href="#" class="edit"><img title="Bearbeiten" class="icon" src="/static/icons/edit.svg" /></a>
      <a href="#" hidden class="save"><img title="Speichern" class="icon" src="/static/icons/check.svg" /></a>
      <a href="#" hidden class="cancel"><img title="Abbrechen" class="icon" src="/static/icons/x.svg" /></a>
      <a href="#" class="delete"><img title="Löschen" class="icon" src="/static/icons/trash-2.svg" /></a>
    </div>
  </div>
% })
<br/>
<h2>Zertifikat hinzufügen:</h2>
<div class="list-header list-certificates">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div>Bereichtigt zu</div>
  <div></div>
</div>
<div class="active list-row list-certificates">
  <input name="title"/>
  <input name="desc"/>
  <input name="qualifies"/>
  <div class="actions">
    <a href="#" class="add">Hinzufügen</a>
  </div>
</div>
