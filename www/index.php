<?php
require("hangman.php");
$configs = include('config.php');
$guess = isset($_GET["guess"]) ? filter_var($_GET["guess"], FILTER_SANITIZE_STRING) : "";
$user = isset($_GET["user"]) ? filter_var($_GET["user"], FILTER_SANITIZE_STRING) : "";
$hof = isset($_GET["hof"]) ? $_GET["hof"] : "";

$game = new Hangman(
    $configs['servername'],
    $configs['username'],
    $configs['password'],
    $configs['database']
);

if ($user) {
    $game->set_user($user);
    if ($guess) {
        $game->do_guess($guess);
    }
};
?>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Hangman</title>
</head>
<body bgcolor="#E5E7E9">
<?php if ($user) { ?>
<pre><?php echo $game->get_hangman(); ?></pre>
<?php 
    if ($game->inprogress()) {
        echo implode(" ", str_split($game->get_mask()));
    } else {
        echo implode(" ", str_split($game->get_word()));
    }
?><br>
<small><?php echo implode(",", str_split($game->get_guesses())) ?>&nbsp</small>
<?php
    if ($game->inprogress()) {
        $tbl="<table border='0' cellpadding='3'><tr>";
        foreach (str_split("ABCDEFGHIJKLMNOPQRSTUVWXYZ") as $letter) {
            $letter_html = $game->is_letter_guessed($letter) ? "$letter" : "<a href='?user=$user&guess=$letter'>$letter</a>"; 
            $tbl .= "<td>".$letter_html."</td>\n";
            if ($letter === "M") {
                $tbl .= "</tr><tr>";
            }
        }
        $tbl .= "</tr></table>";
        echo $tbl;
    } else {
        if ($game->gameover()) {
            echo "<p><font color='#FF0000'>Game Over</font></p>";
        } else {
            echo "<p><font color='#27AE60'>Winner!</font></p>";
        }
        $game->update_score();
        echo "<p><a href='?user=$user'><small>New Game</small></a></p>";
    }
    echo "<p>";
    if (($hof)||($game->inprogress())) {
        $rows = $game->get_hall_of_fame();
        if ($rows) {
            $tbl = "<table border='1' cellpadding='5'>";
            $tbl .= "<tr><th colspan='4'>Hall of Fame</th></tr>";
            $tbl .= "<tr><th>Player</th><th>Games</th><th>Won</th><th>Ratio</th></tr>";
            foreach ($rows as $row) {
                $tbl .= "<tr><td>".$row["username"]."</td><td>".$row["games"]."</td><td>".$row["won"]."</td><td>".$row["ratio"]."</td></tr>";
            }
            $tbl .= "</table>";
            echo $tbl;
        }
    } else {
        echo "<a href='?hof=1&user=$user'>Hall of Fame</a>";
    }
    echo "</p>";
?>
<?php } else { ?>
<form>
Username: <input type="text" name="user"><input type="submit" value="Play">
</form>
<?php } ?>
</body>
</html>
<?php if ($user) {
    if ($game->inprogress()) { ?>
<!-- <?php echo $user ?>! are you trying to cheat!? did you expect to see the word in the page source? nope nothing here! come now ... you still have <?php echo $game->get_remaining_guesses(); echo (($game->get_remaining_guesses() == 1) ? " guess" : " guesses"); ?> left. //-->
<?php } else {
    $game->new_game();
}} ?>
