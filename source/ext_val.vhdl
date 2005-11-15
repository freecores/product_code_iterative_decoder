-- $Id: ext_val.vhdl,v 1.1.1.1 2005-11-15 01:52:30 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       : External Values
-- Project     : 
-------------------------------------------------------------------------------
-- File        : ext_val.vhdl
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2005/11/01
-- Last update : 
-- Simulators  :
-- Synthesizers: 
-- Target      : 
-------------------------------------------------------------------------------
-- Description : External Values calculations
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

library IEEE;
use IEEE.std_logic_1164.all;

entity ext_val is
   port (
   ext_a_i     : in  bit_vector (07 downto 00);
   ext_b_i     : in  bit_vector (07 downto 00);
   ext_r_o     : out bit_vector (07 downto 00)
   );
end ext_val;

architecture structural of ext_val is

   component twos_c_8bit
      port (
        twos_c_i : in  bit_vector (07 downto 00);
        twos_c_o : out bit_vector (07 downto 00)
        );
   end component;

   component comparator_7bit
      port (
         a_7bit_i   : in  bit_vector (06 downto 00);
         b_7bit_i   : in  bit_vector (06 downto 00);
         a_eq_b     : out bit;
         a_gt_b     : out bit;
         a_lt_b     : out bit
         );
   end component;

signal twos_c_a_i     : bit_vector (07 downto 00);
signal twos_c_a_o     : bit_vector (07 downto 00);
signal twos_c_b_i     : bit_vector (07 downto 00);
signal twos_c_b_o     : bit_vector (07 downto 00);
signal twos_c_r_i     : bit_vector (07 downto 00);
signal twos_c_r_o     : bit_vector (07 downto 00);
signal a_8bit_i   : bit_vector (07 downto 00);
signal b_8bit_i   : bit_vector (07 downto 00);
signal ext_r      : bit_vector (07 downto 00);
signal a_eq_b     : bit;
signal a_gt_b     : bit;
signal a_lt_b     : bit;
signal sgn_a_b    : bit;

begin

twos_c_a_i   <= ext_a_i;
twos_c_b_i   <= ext_b_i;
twos_c_r_i   <= ext_r;

sgn_a_b  <= ext_a_i (07) xor ext_b_i (07);

a_8bit_i <= ext_a_i     (07 downto 00) when ( ext_a_i (07) = '0' ) else
            twos_c_a_o  (07 downto 00) when ( ext_a_i (07) = '1' ) else
            B"0000_0000";

b_8bit_i <= ext_b_i     (07 downto 00) when ( ext_b_i (07) = '0' ) else
            twos_c_b_o  (07 downto 00) when ( ext_b_i (07) = '1' ) else
            B"0000_0000";

ext_r    <= a_8bit_i when ( a_lt_b = '1' ) else
            b_8bit_i when ( a_lt_b = '0' ) else
            B"0000_0000";

ext_r_o  <= ext_r       when ( sgn_a_b = '0' ) else
            twos_c_r_o  when ( sgn_a_b = '1' ) else
            B"0000_0000";

compare : comparator_7bit
   port map (
      a_7bit_i => a_8bit_i (06 downto 00),
      b_7bit_i => b_8bit_i (06 downto 00),
      a_eq_b   => a_eq_b,
      a_gt_b   => a_gt_b,
      a_lt_b   => a_lt_b
      );

complement_a : twos_c_8bit
   port map (
      twos_c_i => twos_c_a_i,
      twos_c_o => twos_c_a_o
      );

complement_b : twos_c_8bit
   port map (
      twos_c_i => twos_c_b_i,
      twos_c_o => twos_c_b_o
      );

complement_r : twos_c_8bit
   port map (
      twos_c_i => twos_c_r_i,
      twos_c_o => twos_c_r_o
      );

end structural;
