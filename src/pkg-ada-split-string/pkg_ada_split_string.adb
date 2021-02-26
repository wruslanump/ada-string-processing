-- File   : pkg_ada_split_string.adb
-- Date   : Fri 26 Feb 2021 08:39:05 PM +08
-- Author : WRY wruslan.ump@gmail.com
-- ========================================================
-- REF URL: http://wiki.ada-dk.org/index.php/GNAT.String_Split_Basic_Usage_Example

with Ada.Text_IO; 
with Ada.Characters.Latin_1;
with GNAT.String_Split;

with pkg_ada_dtstamp;

-- ========================================================
package body pkg_ada_split_string   -- Body PASS
-- ========================================================
--   with SPARK_Mode => on
is
   -- RENAMING STANDARD PACKAGES FOR CONVENIENCE
   	package ATIO   renames Ada.Text_IO;
   	package ACL1   renames Ada.Characters.Latin_1;
	package GSS    renames GNAT.String_Split;
	package PADTS  renames pkg_ada_dtstamp;

  
   Data_String : constant String := "G01 X[180.657580*#10+#6] Y[124.749177*#10+#7] Z[1.000000*#11+#8] F[#21]";
     
   -- Data_String : constant String :=  "This becomes a " & ACL1.HT & " bunch of     substrings";
   --  The input data would normally be read from some external source or 
   --  whatever. Latin_1.HT is a horizontal tab.
 
   Subs : GSS.Slice_Set;
   --  Subs is populated by the actual substrings.
 
   Seps : constant String := " " & ACL1.HT;  
   --  just an arbitrary simple set of whitespace. 
   --  ACL1.HT is horizontal tab 
      
   -- =====================================================
   procedure exec_split_line_string is 
   -- =====================================================
   
   begin
      PADTS.dtstamp; ATIO.Put_Line ("Started PASS.exec_line_string_split"); 
      ATIO.New_LINE;
      -- ==================================================
      
      ATIO.Put_Line ("Splitting data string '" & Data_String & "' at whitespace.");
      --  Introduce our job.
 
      GSS.Create (S          => Subs,
                  From       => Data_String,
                  Separators => Seps,
                  Mode       => GSS.Multiple);
      --  Create the split, using Multiple mode to treat strings of multiple
      --  whitespace characters as a single separator.
      --  This populates the Subs object.
 
      ATIO.Put_Line ("Got" & GSS.Slice_Number'Image (GSS.Slice_Count (Subs)) & " substrings:");
      --  Report results, starting with the count of substrings created.
      ATIO.New_Line;
      
      for I in 1 .. GSS.Slice_Count (Subs) loop
         --  Loop though the substrings. 
         
         -- MARKER A INSIDE LOOP ==========================
         declare
            Sub : constant String := GSS.Slice (Subs, I);
            --  Pull the next substring out into a string object for easy handling.
         begin
            ATIO.Put_Line (GSS.Slice_Number'Image (I) & " -> " & Sub & " (length" & Positive'Image (Sub'Length) & ")");
            --  Output the individual substrings, and their length.
 
         end; -- MARKER A INSIDE LOOP =====================
         
      end loop;
      
      -- ==================================================
      ATIO.New_Line; 
      PADTS.dtstamp; ATIO.Put_Line ("Ended PASS.exec_line_string_split");
   
   end exec_split_line_string; 
   
-- ========================================================
begin
    null;
-- ========================================================
end pkg_ada_split_string;
-- ========================================================

