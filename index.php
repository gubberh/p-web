<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>BlaBlaBike Login</title>
  </head>
  <body>
    <?php
    include"login_script.php";
    $cid = new mysqli('localhost','root','', 'blablabike');
    if($cid->connect_errno)
    { die('Errore connessione (' . $cid->connect_errno .
      ')' . $cid->connect_error); }
    ?>
    <form action="index.php" method="post">
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
      <tr>
        <td><a href="registrazione.php">Registrati</a></td>
      </tr>
    </table>
    <?php
    if(isset($_POST['loggato'])){
      $flag=conferma_login($cid);
      if($flag== TRUE)
        header("location: home.php");
      else
        echo "<h2>Password o nome utente non validi</h2>";
    }
     ?>
    </form>
  </body>
</html>
