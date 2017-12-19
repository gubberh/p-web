<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Profilo_BlaBlaBike</title>
  </head>
  <body>
    <?php
    include"login_script.php";
    $cid = new mysqli('localhost','root','', 'blablabike');
    if($cid->connect_errno)
    { die('Errore connessione (' . $cid->connect_errno .
      ')' . $cid->connect_error); }
    ?>
    <form action="index.html" method="post">
    <table>
    <form method="post" name="modulo">
        <tr>
            <td colspan="2" align="center"><b>Registrazione al servizio<br>Tutti i campi sono obbligatori</b></td>
        </tr>
        <tr><td><b>Nickname</b></td><td><input type="text" name="nickname"></td></tr>
        <tr><td><b>Email</b></td><td><input type="text" name="email"></td></tr>
        <tr><td><b>Password</b></td><td><input type="password" name="password"></td></tr>
        <tr><td><b>Conferma password</b></td><td><input type="password" name="conferma"></td></tr>
        <tr><td><b>Nome</b></td><td><input type="text" name="nome"></td></tr>
        <tr><td><b>Cognome</b></td><td><input type="text" name="cognome"></td></tr>
        <tr><td><b>Data di nascita </b></td><td><input type="text" name="nascita" value="gg/mm/aaaa"></td></tr>
        <tr><td><b>Sesso</b></td><td>
          <input type="radio" name="sesso" value="M" checked>M
          <input type="radio" name="sesso" value="F">F
        </td>
        </tr>
        <tr><td><b>Luogo di nascità</b></td><td><input type="text" name="luogo_na"></td></tr>
        <tr><td><b>Città di residenza</b></td><td><input type="text" name="residenza"></td></tr>
        <tr><td>Livello</td>
            <td>
              <select>
                <option value=""></option>
                <option name="livello" value="Principiante">Principiante</option>
                <option name="livello" value="Intermedio">Intermedio</option>
                <option name="livello" value="Esperto">Esperto</option>
              </select>
            </td>
        </tr>
        <tr>
          <td colspan="2">
            <input type="button" value="Invia" onClick="Modulo()">
            <input type="reset" value="Cancel">
          </td>
        </tr>
    </form>
    </table>
    </form>
  </body>
</html>
