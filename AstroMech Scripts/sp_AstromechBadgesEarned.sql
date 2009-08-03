/*
---------------------------------------------------------------------------------------
This source file is part of swgANH (Star Wars Galaxies - A New Hope - Server Emulator)
For more information, see http://www.swganh.org


Copyright (c) 2006 - 2008 The swgANH Team

---------------------------------------------------------------------------------------
*/

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

use swganh_astromech;

--
-- Definition of procedure `sp_AstromechBadgesEarned`
--

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_AstromechBadgesEarned` $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$

CREATE DEFINER=`root`@`%` PROCEDURE `sp_AstromechBadgesEarned`()
BEGIN

  DECLARE mbadge_count INT DEFAULT 0;
  DECLARE mbadge_id INT DEFAULT 0;
  DECLARE loop_counter INT(5);
  DECLARE loop_end INT(5);
  DECLARE badges_total INT(5);
  DECLARE badge_current INT(5);

-- Create TEMP Table

DROP TABLE IF EXISTS `swganh_astromech`.`MemAstromechBadgesEarned`;
CREATE TABLE `swganh_astromech`.`MemAstromechBadgesEarned` (
  `badge_id` int(11) unsigned,
  `badge_count` int(11) unsigned default '0',
  KEY (`badge_id`)
) ENGINE=Memory;

--
-- Select Badge Counts
--

  SET badges_total = 140;

	SET loop_counter = 0;

  SET badge_current = 0;

	loop1: LOOP

    SELECT COUNT(badge_id), badge_id from character_badges WHERE badge_id = loop_counter INTO mbadge_count, mbadge_id;

	  INSERT INTO MemAstromechBadgesEarned VALUES (loop_counter, mbadge_count);

    IF loop_counter = badges_total THEN
  	LEAVE loop1;

      ELSE SET loop_counter = loop_counter + 1;

    END IF;

  END LOOP loop1;

END $$

/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;