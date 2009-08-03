/*
---------------------------------------------------------------------------------------
This source file is part of swgANH (Star Wars Galaxies - A New Hope - Server Emulator)
For more information, see http://www.swganh.org


Copyright (c) 2006 - 2009 The swgANH Team

---------------------------------------------------------------------------------------
*/

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

use swganh;

--
-- Definition of function `sf_BidUpdate`
--

DROP FUNCTION IF EXISTS `sf_BidUpdate`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `sf_BidUpdate`(ID BIGINT(20), Bid INT(11), Proxy INT(11), Name CHAR(32)) RETURNS bigint(20)
BEGIN

--
-- Declare Variables
--

  DECLARE bid_count INT(11);


--
-- See if we have bid before - update or insert as necessary
-- The SF_BidAuction tends to the BId of the HighBidder whereas SF_BidUpdate updates the Bid if we should not be the high bidder
--

  SELECT COUNT(*) FROM commerce_bidhistory WHERE ((auction_id = ID) AND (bidder_Name = Name)) INTO bid_count;


  IF bid_count = 0 THEN INSERT INTO commerce_bidhistory VALUES (ID,Name,Proxy,Bid);


  ELSE UPDATE commerce_bidhistory SET bidder_name = Name, proxy_bid = Proxy, max_bid = Bid WHERE auction_id = ID;


  END IF;

--
-- Return the Auction_ID
--

  RETURN ID;

--
-- Exit
--

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;