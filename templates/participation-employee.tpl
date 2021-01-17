% const renderStatus = {"1": "Angemeldet", "2": "Nimmt teil", "3": "Storniert", "4": "Nicht erfolgreich beendet", "5": "Erfolgreich beendet"}
% window.setTitle("Teilname Mitarbeiter")
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
<br/>
<h2>Weiterbildungen:</h2>
<div class="list-header list-participation-trainings">
  <div>Bezeichnung</div>
<div>Beschreibung</div>
<div>Von</div>
<div>Bis</div>
<div>Status</div>
<div>Aktionen</div>
</div>
% trainings_assigned.forEach(training => {
<div data-training-id="${training['id']}" class="list-row list-participation-trainings">
  <input disabled name="title" value="${training['title']}"/>
  <input disabled name="desc" value="${training['desc'].replace('\n', ' ')}"/>
  <input disabled name="data_from" type="date" value="${training['date_from']}"/>
  <input disabled name="date_to" type="date" value="${training['date_to']}"/>
  % selected = participations[training['id']]
  % can_be_cancelled = new Date(training['date_from']) > new Date() && selected == 1
  <input disabled value="${renderStatus[selected]}"/>
  % if(can_be_cancelled){
    <a href="#" class="cancel">Stonieren</a>
  % }
</div>
% })
<br/>
<h2>Training hinzufügen:</h2>
<div class="list-header list-participation-employees-action">
<div>Bezeichnung</div>
<div>Beschreibung</div>
<div>Von</div>
<div>Bis</div>
<div>Aktionen</div>
</div>
% trainings_available.forEach(training => {
<div data-training-id="${training['id']}" class="list-row list-participation-employees-action">
  <input disabled name="title" value="${training['title']}"/>
  <input disabled name="desc" value="${training['desc']}"/>
  <input disabled name="data_from" type="date" value="${training['date_from']}"/>
  <input disabled name="date_to" type="date" value="${training['date_to']}"/>
    <div class="actions">
      <a href="#" class="add">Teilnehmen</a>
    </div>
  </div>
% })
<br/>
<div class="flex-buttons">
  <a href="/participation-employees" class="back button">Zurück</a>
</div>
