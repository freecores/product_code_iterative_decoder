-- $Id: modelsim_bench.vhdl,v 1.1.1.1 2005-11-15 01:51:28 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       : Test bench top modules.
-- Project     : 
-------------------------------------------------------------------------------
-- File        : modelsim_bench.vhdl
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2005/11/01
-- Last update : 
-- Simulators  :
-- Synthesizers: 
-- Target      : 
-------------------------------------------------------------------------------
-- Description : Top modules for test bench.
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

entity modelsim_bench is
   port (
      y0d : out bit;
      y1d : out bit;
      y2d : out bit;
      y3d : out bit
      );
end modelsim_bench;

architecture structural of modelsim_bench is

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
         clock : out bit;
	 start : out bit;
	 rxin  : out bit_vector (07 downto 00)
	 );
   end component;

   component output
      port (
         start : in bit;
	 y0    : in bit;
	 y1    : in bit;
	 y2    : in bit;
	 y3    : in bit
	 );
   end component;

   signal clock : bit;
   signal start : bit;
   signal y0    : bit;
   signal y1    : bit;
   signal y2    : bit;
   signal y3    : bit;
   signal rxin  : bit_vector (07 downto 00);

   begin

   y0d <= y0;
   y1d <= y1;
   y2d <= y2;
   y3d <= y3;

   my_product_code : product_code
      port map (
         clock  => clock,
	 start  => start,
	 rxin   => rxin,
	 y0d    => y0,
	 y1d    => y1,
	 y2d    => y2,
	 y3d    => y3
	 );

   my_input : input
      port map (
         clock => clock,
	 start => start,
	 rxin  => rxin
	 );

   my_output : output
      port map (
         start => start,
	 y0    => y0,
	 y1    => y1,
	 y2    => y2,
	 y3    => y3
	 );

end structural;
