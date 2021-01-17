% window.setTitle("Zertifikat Auswertung")
<h2>Mitarbeiter:</h2>
% employees.forEach(employee => {
  <div>
    <label>${employee['name']} ${employee['surname']}:</label>
    % employee['certificates'].forEach(certificate => {
        <div class="report">
            ${certificate['title']}
        </div>
    % })
  </div>
% })
