-- $Id: xilinx.vhdl,v 1.1 2006-01-16 03:40:22 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       :
-- Project     : 
-------------------------------------------------------------------------------
-- File        :
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2005/12/18
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

entity xilinx is
   port (
      clock     : in  bit;
      clear     : in  bit;
      start     : out bit;
      rom_pos   : out integer;
      y0d       : out bit;
      y1d       : out bit;
      y2d       : out bit;
      y3d       : out bit;
      senddata  : out bit_vector (3 downto 0);
      match     : out bit_vector (3 downto 0);
      bit_error : out integer
      );
end xilinx;

architecture structural of xilinx is

   component product_code
      port (
         clock : in  bit;
	 start : in  bit;
	 rxin  : in  bit_vector (07 downto 00);
	 y0d   : out bit;
	 y1d   : out bit;
	 y2d   : out bit;
	 y3d   : out bit
	 );
   end component;

   component input
      port (
         clock   : in  bit;
	 clear   : in  bit;
	 start   : out bit;
	 rom_pos : out integer;
	 rxin    : out bit_vector (07 downto 00)
	 );
   end component;

   component reference
      port (
         clear    : in  bit;
	 start    : in  bit;
	 y0       : in  bit;
	 y1       : in  bit;
	 y2       : in  bit;
	 y3       : in  bit;
	 senddata : out bit_vector (3 downto 0);
	 match    : out bit_vector (3 downto 0)
	 );
   end component;

   component analyze 
      port (
	 clear    : in  bit;
         start    : in  bit;
	 match    : in  bit_vector (3 downto 0);
	 col_0    : out integer;
	 col_1    : out integer;
	 col_2    : out integer;
	 col_3    : out integer;
	 result   : out integer
	 );
   end component;

   signal str   : bit;
   signal y0    : bit;
   signal y1    : bit;
   signal y2    : bit;
   signal y3    : bit;
   signal rxin  : bit_vector (07 downto 00);
   signal mtch  : bit_vector (03 downto 00);
   signal col_0 : integer;
   signal col_1 : integer;
   signal col_2 : integer;
   signal col_3 : integer;

begin

   start <= str;
   match <= mtch;
   y0d   <= y0;
   y1d   <= y1;
   y2d   <= y2;
   y3d   <= y3;

   my_product_code : product_code
      port map (
         clock  => clock,
	 start  => str,
	 rxin   => rxin,
	 y0d    => y0,
	 y1d    => y1,
	 y2d    => y2,
	 y3d    => y3
	 );

   my_input : input
      port map (
         clock   => clock,
	 clear   => clear,
	 start   => str,
	 rom_pos => rom_pos,
	 rxin    => rxin
	 );

   my_senddata: reference
      port map (
         clear   => clear,
	 start   => str,
	 y0      => y0,
	 y1      => y1,
	 y2      => y2,
	 y3      => y3,
	 senddata=> senddata,
	 match   => mtch
	 );
   my_analyzer: analyze
      port map (
	 clear   => clear,
         start   => str,
	 match   => mtch,
	 col_0   => col_0,
	 col_1   => col_1,
	 col_2   => col_2,
	 col_3   => col_3,
	 result  => bit_error
	 );

end structural;
