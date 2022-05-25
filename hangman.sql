-- MySQL dump 10.19  Distrib 10.3.34-MariaDB, for debian-linux-gnueabihf (armv8l)
--
-- Host: localhost    Database: hangman
-- ------------------------------------------------------
-- Server version	10.3.34-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `hall_of_fame`
--

DROP TABLE IF EXISTS `hall_of_fame`;
/*!50001 DROP VIEW IF EXISTS `hall_of_fame`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `hall_of_fame` (
  `username` tinyint NOT NULL,
  `games` tinyint NOT NULL,
  `won` tinyint NOT NULL,
  `ratio` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `username` varchar(50) NOT NULL,
  `games` int(11) DEFAULT 0,
  `won` int(11) DEFAULT 0,
  `letters` varchar(26) DEFAULT NULL,
  `word` varchar(50) DEFAULT NULL,
  `ts` int(11) DEFAULT unix_timestamp(),
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES ('dadecoza',0,0,'','THAN',1653479959);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `words` (
  `word` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` VALUES ('ability'),('able'),('about'),('above'),('accept'),('according'),('account'),('across'),('act'),('action'),('activity'),('actually'),('add'),('address'),('administration'),('admit'),('adult'),('affect'),('after'),('again'),('against'),('age'),('agency'),('agent'),('ago'),('agree'),('agreement'),('ahead'),('air'),('all'),('allow'),('almost'),('alone'),('along'),('already'),('also'),('although'),('always'),('American'),('among'),('amount'),('analysis'),('and'),('animal'),('another'),('answer'),('any'),('anyone'),('anything'),('appear'),('apply'),('approach'),('area'),('argue'),('arm'),('around'),('arrive'),('art'),('article'),('artist'),('as'),('ask'),('assume'),('at'),('attack'),('attention'),('attorney'),('audience'),('author'),('authority'),('available'),('avoid'),('away'),('baby'),('back'),('bad'),('bag'),('ball'),('bank'),('bar'),('base'),('be'),('beat'),('beautiful'),('because'),('become'),('bed'),('before'),('begin'),('behavior'),('behind'),('believe'),('benefit'),('best'),('better'),('between'),('beyond'),('big'),('bill'),('billion'),('bit'),('black'),('blood'),('blue'),('board'),('body'),('book'),('born'),('both'),('box'),('boy'),('break'),('bring'),('brother'),('budget'),('build'),('building'),('business'),('but'),('buy'),('by'),('call'),('camera'),('campaign'),('can'),('cancer'),('candidate'),('capital'),('car'),('card'),('care'),('career'),('carry'),('case'),('catch'),('cause'),('cell'),('center'),('central'),('century'),('certain'),('certainly'),('chair'),('challenge'),('chance'),('change'),('character'),('charge'),('check'),('child'),('choice'),('choose'),('church'),('citizen'),('city'),('civil'),('claim'),('class'),('clear'),('clearly'),('close'),('coach'),('cold'),('collection'),('college'),('color'),('come'),('commercial'),('common'),('community'),('company'),('compare'),('computer'),('concern'),('condition'),('conference'),('Congress'),('consider'),('consumer'),('contain'),('continue'),('control'),('cost'),('could'),('country'),('couple'),('course'),('court'),('cover'),('create'),('crime'),('cultural'),('culture'),('cup'),('current'),('customer'),('cut'),('dark'),('data'),('daughter'),('day'),('dead'),('deal'),('death'),('debate'),('decade'),('decide'),('decision'),('deep'),('defense'),('degree'),('Democrat'),('democratic'),('describe'),('design'),('despite'),('detail'),('determine'),('develop'),('development'),('die'),('difference'),('different'),('difficult'),('dinner'),('direction'),('director'),('discover'),('discuss'),('discussion'),('disease'),('do'),('doctor'),('dog'),('door'),('down'),('draw'),('dream'),('drive'),('drop'),('drug'),('during'),('each'),('early'),('east'),('easy'),('eat'),('economic'),('economy'),('edge'),('education'),('effect'),('effort'),('eight'),('either'),('election'),('else'),('employee'),('end'),('energy'),('enjoy'),('enough'),('enter'),('entire'),('environment'),('environmental'),('especially'),('establish'),('even'),('evening'),('event'),('ever'),('every'),('everybody'),('everyone'),('everything'),('evidence'),('exactly'),('example'),('executive'),('exist'),('expect'),('experience'),('expert'),('explain'),('eye'),('face'),('fact'),('factor'),('fail'),('fall'),('family'),('far'),('fast'),('father'),('fear'),('federal'),('feel'),('feeling'),('few'),('field'),('fight'),('figure'),('fill'),('film'),('final'),('finally'),('financial'),('find'),('fine'),('finger'),('finish'),('fire'),('firm'),('first'),('fish'),('five'),('floor'),('fly'),('focus'),('follow'),('food'),('foot'),('for'),('force'),('foreign'),('forget'),('form'),('former'),('forward'),('four'),('free'),('friend'),('from'),('front'),('full'),('fund'),('future'),('game'),('garden'),('gas'),('general'),('generation'),('get'),('girl'),('give'),('glass'),('go'),('goal'),('good'),('government'),('great'),('green'),('ground'),('group'),('grow'),('growth'),('guess'),('gun'),('guy'),('hair'),('half'),('hand'),('hang'),('happen'),('happy'),('hard'),('have'),('he'),('head'),('health'),('hear'),('heart'),('heat'),('heavy'),('help'),('her'),('here'),('herself'),('high'),('him'),('himself'),('his'),('history'),('hit'),('hold'),('home'),('hope'),('hospital'),('hot'),('hotel'),('hour'),('house'),('how'),('however'),('huge'),('human'),('hundred'),('husband'),('I'),('idea'),('identify'),('if'),('image'),('imagine'),('impact'),('important'),('improve'),('in'),('include'),('including'),('increase'),('indeed'),('indicate'),('individual'),('industry'),('information'),('inside'),('instead'),('institution'),('interest'),('interesting'),('international'),('interview'),('into'),('investment'),('involve'),('issue'),('it'),('item'),('its'),('itself'),('job'),('join'),('just'),('keep'),('key'),('kid'),('kill'),('kind'),('kitchen'),('know'),('knowledge'),('land'),('language'),('large'),('last'),('late'),('later'),('laugh'),('law'),('lawyer'),('lay'),('lead'),('leader'),('learn'),('least'),('leave'),('left'),('leg'),('legal'),('less'),('let'),('letter'),('level'),('lie'),('life'),('light'),('like'),('likely'),('line'),('list'),('listen'),('little'),('live'),('local'),('long'),('look'),('lose'),('loss'),('lot'),('love'),('low'),('machine'),('magazine'),('main'),('maintain'),('major'),('majority'),('make'),('man'),('manage'),('management'),('manager'),('many'),('market'),('marriage'),('material'),('matter'),('may'),('maybe'),('me'),('mean'),('measure'),('media'),('medical'),('meet'),('meeting'),('member'),('memory'),('mention'),('message'),('method'),('middle'),('might'),('military'),('million'),('mind'),('minute'),('miss'),('mission'),('model'),('modern'),('moment'),('money'),('month'),('more'),('morning'),('most'),('mother'),('mouth'),('move'),('movement'),('movie'),('Mr'),('Mrs'),('much'),('music'),('must'),('my'),('myself'),('name'),('nation'),('national'),('natural'),('nature'),('near'),('nearly'),('necessary'),('need'),('network'),('never'),('new'),('news'),('newspaper'),('next'),('nice'),('night'),('no'),('none'),('nor'),('north'),('not'),('note'),('nothing'),('notice'),('now'),('number'),('occur'),('of'),('off'),('offer'),('office'),('officer'),('official'),('often'),('oh'),('oil'),('ok'),('old'),('on'),('once'),('one'),('only'),('onto'),('open'),('operation'),('opportunity'),('option'),('or'),('order'),('organization'),('other'),('others'),('our'),('out'),('outside'),('over'),('own'),('owner'),('page'),('pain'),('painting'),('paper'),('parent'),('part'),('participant'),('particular'),('particularly'),('partner'),('party'),('pass'),('past'),('patient'),('pattern'),('pay'),('peace'),('people'),('per'),('perform'),('performance'),('perhaps'),('period'),('person'),('personal'),('phone'),('physical'),('pick'),('picture'),('piece'),('place'),('plan'),('plant'),('play'),('player'),('PM'),('point'),('police'),('policy'),('political'),('politics'),('poor'),('popular'),('population'),('position'),('positive'),('possible'),('power'),('practice'),('prepare'),('present'),('president'),('pressure'),('pretty'),('prevent'),('price'),('private'),('probably'),('problem'),('process'),('produce'),('product'),('production'),('professional'),('professor'),('program'),('project'),('property'),('protect'),('prove'),('provide'),('public'),('pull'),('purpose'),('push'),('put'),('quality'),('question'),('quickly'),('quite'),('race'),('radio'),('raise'),('range'),('rate'),('rather'),('reach'),('read'),('ready'),('real'),('reality'),('realize'),('really'),('reason'),('receive'),('recent'),('recently'),('recognize'),('record'),('red'),('reduce'),('reflect'),('region'),('relate'),('relationship'),('religious'),('remain'),('remember'),('remove'),('report'),('represent'),('Republican'),('require'),('research'),('resource'),('respond'),('response'),('responsibility'),('rest'),('result'),('return'),('reveal'),('rich'),('right'),('rise'),('risk'),('road'),('rock'),('role'),('room'),('rule'),('run'),('safe'),('same'),('save'),('say'),('scene'),('school'),('science'),('scientist'),('score'),('sea'),('season'),('seat'),('second'),('section'),('security'),('see'),('seek'),('seem'),('sell'),('send'),('senior'),('sense'),('series'),('serious'),('serve'),('service'),('set'),('seven'),('several'),('sex'),('sexual'),('shake'),('share'),('she'),('shoot'),('short'),('shot'),('should'),('shoulder'),('show'),('side'),('sign'),('significant'),('similar'),('simple'),('simply'),('since'),('sing'),('single'),('sister'),('sit'),('site'),('situation'),('six'),('size'),('skill'),('skin'),('small'),('smile'),('so'),('social'),('society'),('soldier'),('some'),('somebody'),('someone'),('something'),('sometimes'),('son'),('song'),('soon'),('sort'),('sound'),('source'),('south'),('southern'),('space'),('speak'),('special'),('specific'),('speech'),('spend'),('sport'),('spring'),('staff'),('stage'),('stand'),('standard'),('star'),('start'),('state'),('statement'),('station'),('stay'),('step'),('still'),('stock'),('stop'),('store'),('story'),('strategy'),('street'),('strong'),('structure'),('student'),('study'),('stuff'),('style'),('subject'),('success'),('successful'),('such'),('suddenly'),('suffer'),('suggest'),('summer'),('support'),('sure'),('surface'),('system'),('table'),('take'),('talk'),('task'),('tax'),('teach'),('teacher'),('team'),('technology'),('television'),('tell'),('ten'),('tend'),('term'),('test'),('than'),('thank'),('that'),('the'),('their'),('them'),('themselves'),('then'),('theory'),('there'),('these'),('they'),('thing'),('think'),('third'),('this'),('those'),('though'),('thought'),('thousand'),('threat'),('three'),('through'),('throughout'),('throw'),('thus'),('time'),('to'),('today'),('together'),('tonight'),('too'),('top'),('total'),('tough'),('toward'),('town'),('trade'),('traditional'),('training'),('travel'),('treat'),('treatment'),('tree'),('trial'),('trip'),('trouble'),('true'),('truth'),('try'),('turn'),('TV'),('two'),('type'),('under'),('understand'),('unit'),('until'),('up'),('upon'),('us'),('use'),('usually'),('value'),('various'),('very'),('victim'),('view'),('violence'),('visit'),('voice'),('vote'),('wait'),('walk'),('wall'),('want'),('war'),('watch'),('water'),('way'),('we'),('weapon'),('wear'),('week'),('weight'),('well'),('west'),('western'),('what'),('whatever'),('when'),('where'),('whether'),('which'),('while'),('white'),('who'),('whole'),('whom'),('whose'),('why'),('wide'),('wife'),('will'),('win'),('wind'),('window'),('wish'),('with'),('within'),('without'),('woman'),('wonder'),('word'),('work'),('worker'),('world'),('worry'),('would'),('write'),('writer'),('wrong'),('yard'),('yeah'),('year'),('yes'),('yet'),('you'),('young'),('your'),('yourself');
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hangman'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_play` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`hangman`@`localhost` PROCEDURE `sp_play`(
    IN p_username varchar(50),
    IN p_guess CHAR,
    OUT p_mask VARCHAR(50),
    OUT p_guessed VARCHAR(50),
    OUT p_state VARCHAR(50),
    OUT p_ic INT,
    OUT p_word VARCHAR(50)
    )
BEGIN
    DECLARE v_exists INT DEFAULT 0;
    DECLARE v_word VARCHAR(50);
    DECLARE v_guesses VARCHAR(50) DEFAULT '';
    DECLARE v_mask VARCHAR(50) DEFAULT '';
    DECLARE v_word_len INT;
    DECLARE v_guess_len INT;
    DECLARE v_guess_letter CHAR;
    DECLARE v_word_letter CHAR;
    DECLARE v_word_index INT DEFAULT 0;
    DECLARE v_guess_index INT DEFAULT 0;
    DECLARE v_random_word VARCHAR(50);
    DECLARE v_incorrect_count INT DEFAULT 0;
    SELECT EXISTS(SELECT * FROM players WHERE username=p_username) into v_exists;
    SELECT UPPER(word) INTO v_random_word FROM words ORDER BY RAND() LIMIT 1;
    IF v_exists = 0 THEN
        INSERT INTO players (username, word) values (p_username, v_random_word);
    END IF;
    SELECT word, coalesce(letters,'') INTO v_word, v_guesses FROM players WHERE username=p_username;
    IF p_guess <> '*' AND LOCATE(upper(p_guess), v_guesses) = 0 THEN
        SET v_guesses = upper(CONCAT(v_guesses, p_guess));
    END IF;
    SET v_word_len = LENGTH(v_word);
    SET v_guess_len = LENGTH(v_guesses);
    WHILE v_word_index < v_word_len DO
        SET v_mask = CONCAT(v_mask, '_');
        SET v_word_index = v_word_index+1;
    END WHILE;
    SET v_mask = TRIM(v_mask);
    WHILE v_guess_index < v_guess_len DO
        SET v_guess_letter = SUBSTRING(v_guesses, v_guess_index+1, 1);
        IF LOCATE(v_guess_letter, v_word) > 0 THEN
            SET v_word_index = 0;
            WHILE v_word_index < v_word_len DO
                SET v_word_letter = SUBSTRING(v_word, v_word_index+1, 1);
                IF v_guess_letter = v_word_letter THEN
                    set v_mask = concat(left(v_mask, v_word_index), v_guess_letter, right(v_mask, v_word_len-(v_word_index+1)));
                END IF;
                SET v_word_index = v_word_index+1;
            END WHILE;
        ELSE
            SET v_incorrect_count = v_incorrect_count + 1;
        END IF;
        SET v_guess_index = v_guess_index+1;
    END WHILE;
    IF v_incorrect_count > 6 THEN
        UPDATE players SET letters = null, word = v_random_word, games = games+1, ts = UNIX_TIMESTAMP() WHERE username=p_username;
        SET p_state = 'GAMEOVER';
    ELSEIF LOCATE('_', v_mask) > 0 THEN
        UPDATE players SET letters = v_guesses WHERE username=p_username;
        SET p_state = 'INPROGRESS';
    ELSE
        UPDATE players SET letters = null, word = v_random_word, won = won+1, games = games+1, ts = UNIX_TIMESTAMP() WHERE username=p_username;
        SET p_state = 'WON';
    END IF;
    SET p_mask = v_mask;
    SET p_guessed = v_guesses;
    SET p_ic = v_incorrect_count;
    SET p_word = v_word;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `hall_of_fame`
--

/*!50001 DROP TABLE IF EXISTS `hall_of_fame`*/;
/*!50001 DROP VIEW IF EXISTS `hall_of_fame`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`hangman`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hall_of_fame` AS select `players`.`username` AS `username`,`players`.`games` AS `games`,`players`.`won` AS `won`,concat(cast(cast(`players`.`won` / `players`.`games` * 100 as signed) as char charset utf8mb4),'%') AS `ratio` from `players` order by `players`.`won` / `players`.`games` * 100 * `players`.`games` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-25 14:58:31
