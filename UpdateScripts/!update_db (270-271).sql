/*
---------------------------------------------------------------------------------------
This source file is part of swgANH (Star Wars Galaxies - A New Hope - Server Emulator)
For more information, see http://www.swganh.org


Copyright (c) 2006, 2007 The swgANH Team

---------------------------------------------------------------------------------------
*/

--
-- Switch database to swganh
-- Update script for database from Build 270 --> 271
--

USE swganh;

--
-- Create / Populate schema
--



--
-- Create Stored Functions / Procedures
--

source [DRIVE]:\\[PATH]\\schema\\buildings.sql
source [DRIVE]:\\[PATH]\\schema\\entertainer_performances.sql
source [DRIVE]:\\[PATH]\\schema\\npc_chatter.sql
source [DRIVE]:\\[PATH]\\schema\\persistent_npc_attributes.sql
source [DRIVE]:\\[PATH]\\schema\\persistent_npcs.sql
source [DRIVE]:\\[PATH]\\schema\\terminal_elevator_data.sql
source [DRIVE]:\\[PATH]\\schema\\terminals.sql

--
-- Populate the logging schema (swganh_logs)
--




--
-- Populate the archive schema (swganh_archive)
--




--
-- End
--