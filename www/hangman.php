<?php
class Hangman {
    
    private $conn;
    private $user;

    function __construct($db_server, $db_username, $db_password, $db_database) {
        $this->conn = new mysqli(
            $db_server,
            $db_username, 
            $db_password,
            $db_database
        );
        if ($this->conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
    }

    function __destruct() {
        $this->store_user();
        $this->conn->close();
    }

    function allowed_guesses() {
        return 7;
    }

    function create_user($username) {
        $ts = time();
        $sql = "INSERT INTO players (username, word, ts) values (?, (SELECT UPPER(word) AS word FROM words ORDER BY RAND() LIMIT 1), ?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("si", $username, $ts);
        $stmt->execute();
        $stmt->close();
        return $this->get_user($username);
    }

    function get_user($username) {
        $sql = "SELECT username, games, won, letters, word, ts FROM players WHERE username = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();
        $stmt->close();
        if (!$user) {
            return $this->create_user($username);
        }
        return $user;
    }

    function get_new_word() {
        $sql = "SELECT UPPER(word) AS word FROM words ORDER BY RAND() LIMIT 1";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        $word = $result->fetch_assoc();
        $stmt->close();
        return $word["word"];
    }

    function store_user() {
        if (!$this->user) return;
        $ts = time();
        $sql = "UPDATE players SET games = ?, won = ?, letters = ?, word = ?, ts = ? WHERE username = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("iissis", 
            $this->user["games"],
            $this->user["won"],
            $this->user["letters"],
            $this->user["word"],
            $ts,
            $this->user["username"]
        );
        $stmt->execute();
        $stmt->close();
        return;
    }

    function get_hall_of_fame() {
        $this->store_user();
        $sql = "SELECT username, games, won FROM players WHERE won > 0 ORDER BY ((won/games)*100)*games desc";
        $result = $this->conn->query($sql);
        if ($result->num_rows > 0) {
            $rows = [];
            while($row = $result->fetch_assoc()) {
                $row["ratio"] = intval(($row["won"]/$row["games"])*100)."%";
                array_push($rows, $row);
            }
            return $rows;
        }
        return [];
    }

    function set_user($username) {
        $this->user = $this->get_user($username);
        return $this->user;
    }

    function get_guesses() {
        $letters = $this->user["letters"];
        return ($letters) ? $letters : "";
    }

    function get_word() {
        $word = $this->user["word"];
        return ($word) ? $word : "";
    }

    function is_letter_in_word($letter) {
        if(strpos($this->get_word(), $letter) !== false) {
            return true;
        }
        return false;
    }

    function is_letter_guessed($letter) {
        if(strpos($this->get_guesses(), $letter) !== false) {
            return true;
        }
        return false;
    }

    function get_incorrect_guesses() {
        $incorrect = 0;
        $guesses = $this->get_guesses();
        for ($i = 0; $i < strlen($guesses); $i++) {
            $c = substr($guesses, $i, 1);
            if(!$this->is_letter_in_word($c)) {
                $incorrect++;
            }
        }
        return $incorrect;
    }

    function found_word() {
        $word = $this->get_word();
        for ($i = 0; $i < strlen($word); $i++) {
            $c = substr($word, $i, 1);
            if(!$this->is_letter_guessed($c)) {
                return false;
            }
        }
        return true;
    }

    function get_remaining_guesses() {
        return $this->allowed_guesses() - $this->get_incorrect_guesses();
    }

    function get_mask() {
        $mask = "";
        $word = $this->get_word();
        for ($i = 0; $i < strlen($word); $i++) {
            $c = substr($word, $i, 1);
            if ($this->is_letter_guessed($c)) {
                $mask .= $c;
            } else {
                $mask .= "_";
            }
        }
        return $mask;
    }

    function get_state() {
        if ($this->get_remaining_guesses() <= 0) return "GAMEOVER";
        if ($this->found_word()) return "WON";
        return "INPROGRESS";
    }

    function inprogress() {
        return ($this->get_state() === "INPROGRESS");
    }

    function won() {
        return ($this->get_state() === "WON");
    }

    function gameover() {
        return ($this->get_state() === "GAMEOVER");
    }

    function update_score() {
        $games = $this->user["games"]+1;
        $won = $this->user["won"] + ($this->won() ? 1 : 0);
        $this->user["games"] = $games;
        $this->user["won"] = $won;
    }

    function new_game() {
        $guesses = "";
        $word = $this->get_new_word();
        $this->user["letters"] = $guesses;
        $this->user["word"] = $word;
    }

    function do_guess($guess) {
        $guess = strtoupper($guess);
        $current = $this->get_guesses();
        if(strpos($current, $guess) === false) {
            $this->user["letters"] = $current.$guess;
        }
    }

    function get_hangman() {
        if ($this->won()) {
return "+-----+
|/    |
|
|        O
|       \|/
|        |
|       / \
+===========";
        } elseif ($this->gameover()) {
return "+-----+
|/    |
|     O
|    /|\
|     |
|    / \
|
+===========";
        } elseif ($this->get_incorrect_guesses() == 0) {
return "+-----+
|/    |
|
|
|
|
|
+===========";
        } elseif ($this->get_incorrect_guesses() == 1) {
return "+-----+
|/    |
|     O
|
|
|
|
+===========";
        } elseif ($this->get_incorrect_guesses() == 2) {
return "+-----+
|/    |
|     O
|     |
|
|
|
+===========";
        } elseif ($this->get_incorrect_guesses() == 3) {
return "+-----+
|/    |
|     O
|    \|
|
|
|
+===========";
        } elseif ($this->get_incorrect_guesses() == 4) {
return "+-----+
|/    |
|     O
|    \|/
|
|
|
+===========";
        } elseif ($this->get_incorrect_guesses() == 5) {
return "+-----+
|/    |
|     O
|    \|/
|     |
|
|
+===========";
        } elseif ($this->get_incorrect_guesses() == 6) {
return "+-----+
|/    |
|     O
|    \|/
|     |
|    / 
|
+===========";
        }
    }
}
?>
