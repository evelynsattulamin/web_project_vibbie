<?php
function set_header($title)
{

    echo '<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>' . $title . '</title>
        <link rel="stylesheet" href="./css/bootstrap.css" type="text/css">
        <link rel="stylesheet" href="./css/main.css" type="text/css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand mx-5" href="index.php">Eve Drug Center</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav m-auto">
          <li class="nav-item active">
            <a class="nav-link" href="index.php">Home </span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="medicine_controller.php">Track Medicine</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="dosages.php">Track Daily Dosages</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="">View Daily Notifications</a>
          </li>

          <li class="nav-item">
            <a class="nav-link text-danger" href="logout.php">Logout</a>
          </li>

        </ul>

      </div>
    </nav>';

}

function set_footer()
{
    echo '  <script src="./js/jquery.js"></script>
    <script src="./js/bootstrap.js"></script>
  </body>
  </html>';
}

function check_email_exist($connection, $email)
{
    try {
        $query = "SELECT * FROM userregister WHERE Email = ?";
        $email_exist = false;
        $stmt = $connection->prepare($query);
        $stmt->bind_param('s', $email);
        $stmt->execute();
        $stmt->store_result();
        if ($stmt->num_rows > 0) {
            $email_exist = true;

        }

        return $email_exist;

    } catch (Exception $ex) {
        throw $ex;
    }

}

function check_username_exist($connection, $username)
{
    try {
        $query = "SELECT * FROM userregister WHERE username = ?";
        $username_exist = false;
        $stmt = $connection->prepare($query);
        $stmt->bind_param('s', $username);
        $stmt->execute();
        $stmt->store_result();
        if ($stmt->num_rows > 0) {
            $username_exist = true;

        }

        return $username_exist;

    } catch (Exception $ex) {
        throw $ex;
    }

}