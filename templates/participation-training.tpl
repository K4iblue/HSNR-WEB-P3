% const renderStatus = {"1": "Angemeldet", "2": "Nimmt teil", "3": "Storniert", "4": "Nicht erfolgreich beendet", "5": "Erfolgreich beendet"}
% window.setTitle("Teilname Training")
<h2>Training:</h2>
<input hidden name="id" value="${training['id']}"/>
<label>Bezeichnung:</label>
<input disabled name="name" value="${training['title']}"/>
<label>Beschreibung:</label>
<textarea disabled name="desc">${training['desc']}</textarea>
<label>Von:</label>
<input disabled name="date_from" type="date" value="${training['date_from']}"/>
<label>Bis:</label>
<input disabled name="date_to" type="date" value="${training['date_to']}"/>
<label>minimale Teilnehmer:</label>
<input disabled name="min_participants" value="${training['min_participants']}"/>
<label>maximale Teilnehmer:</label>
<input disabled name="max_participants" value="${training['max_participants']}"/>
<br/>
<br/>
<h2>Weiterbildungen:</h2>
<div class="list-header list-employees">
  <div>Name</div>
  <div>Nachname</div>
  <div>Akademischer Grad</div>
  <div>Beschäftigung</div>
  <div>Status</div>
</div>
% employees_assigned.forEach(employee => {
  <div data-employee-id="${employee['id']}" class="list-row list-employees">
    <input disabled name="name" value="${employee['name']}"/>
    <input disabled name="surname" value="${employee['surname']}"/>
    <input disabled name="degree" value="${employee['degree']}"/>
    <input disabled name="occupation" value="${employee['occupation']}"/>
    % selected = participations[employee['id']]
    <select>
      % for(let s=1;s<=5;s++){
        <option ${selected == s && "selected" || ""} value="${s}">${renderStatus[s]}</option>
      % }
    </select>
  </div>
% })
<br/>
<h2>Mitarbeiter hinzufügen:</h2>
<div class="list-header list-employees">
  <div>Name</div>
  <div>Nachname</div>
  <div>Akademischer Grad</div>
  <div>Beschäftigung</div>
  <div>Status</div>
</div>
% employees_available.forEach(employee => {
  <div data-employee-id="${employee['id']}" class="list-row list-employees">
    <input disabled name="name" value="${employee['name']}"/>
    <input disabled name="surname" value="${employee['surname']}"/>
    <input disabled name="degree" value="${employee['degree']}"/>
    <input disabled name="occupation" value="${employee['occupation']}"/>
    <div class="actions">
      <a href="#" class="add">Teilnehmen</a>
    </div>
  </div>
% })
