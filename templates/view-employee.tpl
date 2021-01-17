% const renderStatus = {"1": "Angemeldet", "2": "Nimmt teil", "3": "Storniert", "4": "Nicht erfolgreich beendet", "5": "Erfolgreich beendet"}
% window.setTitle("Mitarbeiter Details")
<h2>Mitarbeiter:</h2>
<input hidden name="id" value="${employee['id']}"/>
<label>Name</label>
<input disabled name="name" value="${employee['name']}"/>
<label>Nachname</label>
<input disabled name="surname" value="${employee['surname']}"/>
<label>Akademischer Grad</label>
<input disabled name="degree" value="${employee['degree']}"/>
<label>Beschäftigung</label>
<input disabled name="occupation" value="${employee['occupation']}"/>
<br/>
<h3>Qualifikationen:</h3>
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
<h3>Zertifikate:</h3>
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
<h3>Weiterbildungen:</h3>
<div class="list-header list-trainings-employee">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div>Von</div>
  <div>Bis</div>
  <div>Status</div>
</div>
% participations.forEach(training => {
  <div data-training-id="${training['id']}" class="list-row list-trainings-employee">
    <input disabled name="title" value="${training['title']}"/>
    <input disabled name="desc" value="${training['desc'].replace("\n", " ")}"/>
    <input disabled name="data_from" type="date" value="${training['date_from']}"/>
    <input disabled name="date_to" type="date" value="${training['date_to']}"/>
    <input disabled value="${renderStatus[training['status']]}"/>
  </div>
% })
<div></div>
