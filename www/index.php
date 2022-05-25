<?php
require('./game.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Hangman</title>
</head>
<body bgcolor="#E5E7E9">
<?php if ($user) { ?>
<pre><?php echo hangman(); ?></pre>
<?php echo mask(); ?><br>
<small><?php echo implode(",", str_split($guessed)) ?>&nbsp</small>
<?php echo letter_picker(); ?>
<?php echo hall_of_fame(); ?>
<?php } else { ?>
<form>
Username: <input type="text" name="user"><input type="submit" value="Play">
</form>
<?php } ?>
</body>
</html>
<?php if ($user && ($state === "INPROGRESS")) { ?>
<!-- <?php echo $user ?>! are you trying to cheat!? did you expect to see the word in the page source? nope nothing here! come now ... you still have <?php echo (7-$wrong); echo (($wrong == 6) ? " guess" : " guesses"); ?> left. //-->
<?php } ?>