<?php

  function conferma_login(&$cid){
      $flag= FALSE;
      $nick= $_POST['nickname'];
      $pwdsha1 = sha1($_POST['password']);
      $res= $cid->query("SELECT  Nickname, Password FROM utente;") or die("<p>Inpossibile eseguire query.</p>"
      . "<p>Codice errore " . $cid->errno
      . ": " . $cid->error) . "</p>" ;

      while($row = $res->fetch_row()){
        if( $row[0]== $nick && $row[1]== $pwdsha1){
          $flag= TRUE;
          break;
        }
      }
      return $flag;
    }

    function conferma_nick(&$cid){
        $flag_reg= FALSE;
        $nick= $_POST['nick_reg'];
        $res= $cid->query("SELECT  Nickname FROM utente;")
        or die("<p>Inpossibile eseguire query.</p>"
        . "<p>Codice errore " . $cid->errno
        . ": " . $cid->error) . "</p>" ;

        while($row = $res->fetch_row()){
          if( $row[0]== $nick){
            $flag_reg= TRUE;
            break;
          }
        }
        return $flag_reg;
      }


      function crea_utente(&$cid){
          
          if($stmt = $cid->prepare("INSERT INTO utente (Nickname,Email,Password)  VALUES ( ?, ?, ?)")){
            $stmt->bind_param('sss', $new_nick,$new_email,$new_pswd);
            $new_nick= $_POST['nick_reg'];
            $new_email= $_POST['email'];
            $new_pswd= sha1($_POST['pswd_reg']);
            $stmt->execute();

            $stmt->close();

          }
        }
