-- $Id: analyze.vhdl,v 1.1 2006-01-16 03:40:22 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       :
-- Project     : 
-------------------------------------------------------------------------------
-- File        :
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2005/12/19
-- Last update : 
-- Simulators  :
-- Synthesizers: ISE Xilinx 6.3i
-- Target      : 
-------------------------------------------------------------------------------
-- Description : 
-------------------------------------------------------------------------------
-- Copyright (C) 2005 Arif E. Nugroho
-- This VHDL design file is an open design; you can redistribute it and/or
-- modify it and/or implement it after contacting the author
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- 
-- 	THIS SOURCE FILE MAY BE USED AND DISTRIBUTED WITHOUT RESTRICTION
-- PROVIDED THAT THIS COPYRIGHT STATEMENT IS NOT REMOVED FROM THE FILE AND THAT
-- ANY DERIVATIVE WORK CONTAINS THE ORIGINAL COPYRIGHT NOTICE AND THE
-- ASSOCIATED DISCLAIMER.
-- 
-------------------------------------------------------------------------------
-- 
-- 	THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
-- IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
-- MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
-- EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
-- SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
-- OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
-- WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
-- OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-- 
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity analyze is
   port (
      clear   : in  bit;
      start   : in  bit;
      match   : in  bit_vector (3 downto 0);
      col_0   : out integer;
      col_1   : out integer;
      col_2   : out integer;
      col_3   : out integer;
      result  : out integer
      );
end analyze;

architecture analyzer of analyze is

signal col_0_int  : integer range 0 to 19999;
signal col_1_int  : integer range 0 to 19999;
signal col_2_int  : integer range 0 to 19999;
signal col_3_int  : integer range 0 to 19999;
signal result_int : integer range 0 to 19999;

begin

process (start,clear)
begin

if (clear = '1') then
   col_0_int  <= 0;
   col_1_int  <= 0;
   col_2_int  <= 0;
   col_3_int  <= 0;
   result_int <= 0;
-- sample at rising edge then show the result at falling edge.
elsif (start = '1' and start'event) then
   if (match(0) = '0') then
      if (col_0_int < 19999) then
         col_0_int <= col_0_int + 1;
      else
         col_0_int <= 0;
      end if;
   end if;
   if (match(1) = '0') then
      if (col_1_int < 19999) then
         col_1_int <= col_1_int + 1;
      else
         col_1_int <= 0;
      end if;
   end if;
   if (match(2) = '0') then
      if (col_2_int < 19999) then
         col_2_int <= col_2_int + 1;
      else
         col_2_int <= 0;
      end if;
   end if;
   if (match(3) = '0') then
      if (col_3_int < 19999) then
         col_3_int <= col_3_int + 1;
      else
         col_3_int <= 0;
      end if;
   end if;
end if;

result_int <= col_0_int + col_1_int + col_2_int + col_3_int;

end process;

result   <= result_int;
col_0    <= col_0_int;
col_1    <= col_1_int;
col_2    <= col_2_int;
col_3    <= col_3_int;

end analyzer;
