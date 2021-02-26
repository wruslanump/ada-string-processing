-- File: main_ada_string_processing.adb
-- Date: Fri 26 Feb 2021 08:39:05 PM +08
-- Author: WRY wruslan.ump@gmail.com
-- ========================================================
-- IMPORT STANDARD ADA PACKAGES
with Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Strings.Unbounded;
with GNAT.String_Split;

-- IMPORT USER-DEFINED ADA PACKAGES
with pkg_ada_dtstamp;
with pkg_ada_split_string;
--with pkg_ada_split_unbounded_string;

-- ========================================================
procedure main_ada_string_processing
-- ========================================================
--	with SPARK_Mode => on
is 
   -- RENAME STANDARD ADA PACKAGES FOR CONVENIENCE
   package ATIO    renames Ada.Text_IO;
   package ART     renames Ada.Real_Time;
   package ASU     renames Ada.Strings.Unbounded;
   package GSS     renames GNAT.String_Split;
   
   -- RENAME USER-DEFINED ADA PACKAGES FOR CONVENIENCE
   package PADTS   renames pkg_ada_dtstamp;
   package PASS    renames pkg_ada_split_string;
   -- package PASUS   renames pkg_ada_split_unbounded_string;
   
   -- GLOBAL MAIN VARIABLES
   -- ====================================================
   
   
-- =======================================================      
begin
   PADTS.dtstamp; ATIO.Put_Line ("Bismillah 3 times WRY");
   PADTS.dtstamp; ATIO.Put_Line ("Executing: main_ada_string_processing"); 
   ATIO.New_Line;
   -- ====================================================
   
   PASS.exec_split_line_string;
   
   -- PASUS.exec_split_line_unbounded_string;
  
   
   -- ====================================================      
   ATIO.New_Line; 
   PADTS.dtstamp; ATIO.Put_Line ("Ended main: Alhamdulillah 3 times WRY");
-- ========================================================   
end main_ada_string_processing;
-- ========================================================
