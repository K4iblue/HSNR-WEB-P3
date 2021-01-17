% const renderStatus = {"1": "Angemeldet", "2": "Nimmt teil", "3": "Storniert", "4": "Nicht erfolgreich beendet", "5": "Erfolgreich beendet"}
% window.setTitle("Mitarbeiter Auswertung")
<h2>Mitarbeiter:</h2>
% employees.forEach(employee => {
  <div>
    <label>${employee['name']} ${employee['surname']}:</label>
    % employee['trainings'].forEach(training => {
        <div class="report">
          ${training['title']} von <input disabled value="${training['date_from']}" type="date" /> bis <input disabled value="${training['date_to']}" type="date" /> | ${renderStatus[training['status']]}
        </div>
    % })
  </div>
% })
