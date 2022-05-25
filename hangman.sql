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

-- Dump completed on 2022-05-25 13:20:14
