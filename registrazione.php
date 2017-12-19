<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Registrazione</title>
    <script src="controlli.js"></script>
  </head>
  <body>
    <?php
    include"login_script.php";
    $cid = new mysqli('localhost','root','', 'blablabike');
    if($cid->connect_errno)
    { die('Errore connessione (' . $cid->connect_errno .
      ')' . $cid->connect_error); }
    ?>
    <form id="loginForm" action="registrazione.php" method="post">
    <table>
      <tr>
        <th>Nickname</th>
        <td><input type="text" name="nickname"></td>
      </tr>
      <tr>
        <th>Password</th>
        <td> <input type="password" name="password"> </td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" name="loggato" value="Login" >
          <input type="reset" value="Cancel">
        </td>
      </tr>
    </table>
    </form>
    <?php
    if(isset($_POST['loggato'])){
      $flag=conferma_login($cid);
      if($flag== TRUE)
        header("location: home.php");
      else
        echo "<h2>Password o nome utente non validi</h2>";
    }
    ?>
     <form id="regForm" action="registrazione.php" method="post">
     <table>
       <tr>
         <td>Registrati</a></td>
       </tr>
     <tr><td><b>Nickname</b></td><td><input type="text" name="nick_reg"></td></tr>
     <tr><td><b>Email</b></td><td><input type="text" name="email"></td></tr>
     <tr><td><b>Passwordd</b></td><td><input type="password" name="pswd_reg"></td></tr>
     <tr><td><b>Conferma password</b></td><td><input type="password" name="conferma"></td></tr>
     <tr>
       <td colspan="2">
         <input type="submit"   name="check" value="Invia" onclick=" return Modulo()">
         <input type="reset" value="Cancel">
       </td>
     </tr>
   </table>
    </form>
    <?php
    if(isset($_POST['check'])){
        echo "Ti sei registrato con successo ora esegui il Login";
        crea_utente($cid);
      }
    ?>

  </body>
</html>
