<?php
$configs = include('config.php');
$guess = isset($_GET["guess"]) ? filter_var($_GET["guess"], FILTER_SANITIZE_STRING) : "*";
$user = isset($_GET["user"]) ? filter_var($_GET["user"], FILTER_SANITIZE_STRING) : "";
$hof = isset($_GET["hof"]) ? $_GET["hof"] : "";

$mask = "";
$guessed = "";
$state = "";
$wrong = 0;
$word = "";
$parts = array(
"+-----+
|/    |
|
|
|
|
|
+===========",
"+-----+
|/    |
|     O
|
|
|
|
+===========",
"+-----+
|/    |
|     O
|     |
|
|
|
+===========",
"+-----+
|/    |
|     O
|    \|
|
|
|
+===========",
"+-----+
|/    |
|     O
|    \|/
|
|
|
+===========",
"+-----+
|/    |
|     O
|    \|/
|     |
|
|
+===========",
"+-----+
|/    |
|     O
|    \|/
|     |
|    / 
|
+===========",
"+-----+
|/    |
|     O
|    \|/
|     |
|    / \
|
+===========",
"+-----+
|/    |
|     O
|    /|\
|     |
|    / \
|
+===========",
"+-----+
|/    |
|
|        O
|       \|/
|        |
|       / \
+==========="
);

if ($guess && $user) {
    $conn = new mysqli($configs['servername'], $configs['username'], $configs['password'], $configs['database']);
    if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
    }
    $conn->query( "CALL sp_play('$user', '$guess', @mask, @guessed, @state, @wrong, @word)" );
    $result = $conn->query("SELECT @mask as mask, @guessed as guessed, @state as state, @wrong as wrong, @word as word");
    $row = $result->fetch_assoc();
    $mask = $row["mask"];
    $guessed = $row["guessed"];
    $state = $row["state"];
    $wrong = $row["wrong"];
    $word = $row["word"];
    $conn -> close();
}

function hangman() {
    global $state, $parts, $wrong;
    switch($state) {
        case "GAMEOVER":
            return $parts[8];
        case "WON":
            return $parts[9];
        default:
            return $parts[$wrong];
    }
}

function mask() {
    global $mask, $state, $word;
    return ($state === "INPROGRESS") ? implode(" ", str_split($mask)) : implode(" ", str_split($word));
}

function letter_picker() {
    global $state, $guessed, $user;
    $ret = ""; 
    if ($state === "INPROGRESS") {
        $ret="<table border='0' cellpadding='5'><tr>";
        foreach (str_split("ABCDEFGHIJKLMNOPQRSTUVWXYZ") as $letter) {
            $letter_html = (strpos($guessed, $letter) !== false) ? "$letter" : "<a href='?user=$user&guess=$letter'>$letter</a>"; 
            $ret = $ret."<td>".$letter_html."</td>\n";
            if ($letter === "M") {
                $ret = $ret."</tr><tr>";
            }
        }
        $ret = $ret."</tr></table><br>";
    } else {
        $ret = "<p><a href='?user=$user'>New Game</a></p>";
    }
    return $ret;
}

function state_message() {
    global $state;
    switch ($state) {
        case "GAMEOVER":
            return "<p><font color='#FF0000'>Game Over</font></p>";
        case "WON":
            return "<p><font color='#27AE60'>Winner!</font></p>";
        default:
            return "&nbsp;";
    }
}

function hall_of_fame() {
    global $configs, $hof, $state, $user;
   /* if (($state !== "INPROGRESS")||($hof)) {
        $conn = new mysqli($configs['servername'], $configs['username'], $configs['password'], $configs['database']);
        $sql = "SELECT username, games, won, ratio FROM hall_of_fame";
        $result = $conn->query($sql);
        $ret = "";
        if ($result->num_rows > 0) {
            $ret = $ret."<table border='1' cellpadding='5'>";
            $ret = $ret."<tr><th colspan='4'>Hall of Fame</th></tr>";
            $ret = $ret."<tr><th>Player</th><th>Games</th><th>Won</th><th>Ratio</th></tr>";
            while($row = $result->fetch_assoc()) {
                $ret = $ret."<tr><td>".$row["username"]."</td><td>".$row["games"]."</td><td>".$row["won"]."</td><td>".$row["ratio"]."</td></tr>";
            }
            $ret = $ret."</table>";
        }
        $conn -> close();
        return $ret;
    } else {
        return "<a href='?hof=1&user=$user'>Hall of Fame</a>";
    }*/
}
?>