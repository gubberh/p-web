function Modulo() {
  var nickname = document.getElementById('regForm').nick_reg.value;
  var email = document.getElementById('regForm').email.value;
  var password = document.getElementById('regForm').pswd_reg.value;
  var conferma = document.getElementById('regForm').conferma.value;

  //Effettua il controllo sul campo NICKNAME
  if ((nickname == "") || (nickname == "undefined")) {
      alert("Il campo Nickname è obbligatorio.");
      document.getElementById('regForm').nick_reg.focus();
      return false;
  }
  //Effettua il controllo sul campo PASSWORD
  else if ((password == "") || (password == "undefined")) {
      alert("Il campo Password è obbligatorio.");
       document.getElementById('regForm').pswd_reg.focus();
      return false;
  }
  //Effettua il controllo sul campo CONFERMA PASSWORD
  else if ((conferma == "") || (conferma == "undefined")) {
      alert("Il campo Conferma password è obbligatorio.");
      document.getElementById('regForm').conferma.focus();
      return false;
  }
  //Verifica l'uguaglianza tra i campi PASSWORD e CONFERMA PASSWORD
  else if (password != conferma) {
      alert("La password confermata è diversa da quella scelta, controllare.");
      document.getElementById('regForm').conferma.value = "";
      document.getElementById('regForm').conferma.focus();
      return false;
  }
  else
    return true;
}
