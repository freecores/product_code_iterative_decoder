-- $Id: comparator_7bit.vhdl,v 1.1.1.1 2005-11-15 01:52:30 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       : 7 bit comparator
-- Project     : 
-------------------------------------------------------------------------------
-- File        : comparator_7bit.vhdl
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2005/11/01
-- Last update : 
-- Simulators  :
-- Synthesizers: 
-- Target      : 
-------------------------------------------------------------------------------
-- Description : Compare two input ( 7 bit signal )
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

entity comparator_7bit is
   port (
   a_7bit_i   : in  bit_vector (06 downto 00);
   b_7bit_i   : in  bit_vector (06 downto 00);
   a_eq_b     : out bit;
   a_gt_b     : out bit;
   a_lt_b     : out bit
   );
end comparator_7bit;

architecture structural of comparator_7bit is

   component bit_comparator
       port (
          a_i   : in  bit;
          b_i   : in  bit;
          eq_i  : in  bit;
          gt_i  : in  bit;
          lt_i  : in  bit;
          eq_o  : out bit;
          gt_o  : out bit;
          lt_o  : out bit
          );
   end component;

signal eq_i_0 : bit;
signal gt_i_0 : bit;
signal lt_i_0 : bit;

signal eq_o_0 : bit;
signal gt_o_0 : bit;
signal lt_o_0 : bit;

signal eq_o_1 : bit;
signal gt_o_1 : bit;
signal lt_o_1 : bit;

signal eq_o_2 : bit;
signal gt_o_2 : bit;
signal lt_o_2 : bit;

signal eq_o_3 : bit;
signal gt_o_3 : bit;
signal lt_o_3 : bit;

signal eq_o_4 : bit;
signal gt_o_4 : bit;
signal lt_o_4 : bit;

signal eq_o_5 : bit;
signal gt_o_5 : bit;
signal lt_o_5 : bit;

signal eq_o_6 : bit;
signal gt_o_6 : bit;
signal lt_o_6 : bit;

      
begin

eq_i_0 <= '1'; -- 20051015 Fixed
gt_i_0 <= '0';
lt_i_0 <= '0';

a_eq_b <= eq_o_6;
a_gt_b <= gt_o_6;
a_lt_b <= lt_o_6;

cmp6 : bit_comparator
   port map (
     a_i   =>  a_7bit_i (06),
     b_i   =>  b_7bit_i (06),
     eq_i  =>  eq_o_5,
     gt_i  =>  gt_o_5,
     lt_i  =>  lt_o_5,
     eq_o  =>  eq_o_6,
     gt_o  =>  gt_o_6,
     lt_o  =>  lt_o_6
     );

cmp5 : bit_comparator
   port map (
     a_i   =>  a_7bit_i (05),
     b_i   =>  b_7bit_i (05),
     eq_i  =>  eq_o_4,
     gt_i  =>  gt_o_4,
     lt_i  =>  lt_o_4,
     eq_o  =>  eq_o_5,
     gt_o  =>  gt_o_5,
     lt_o  =>  lt_o_5
     );

cmp4 : bit_comparator
   port map (
     a_i   =>  a_7bit_i (04),
     b_i   =>  b_7bit_i (04),
     eq_i  =>  eq_o_3,
     gt_i  =>  gt_o_3,
     lt_i  =>  lt_o_3,
     eq_o  =>  eq_o_4,
     gt_o  =>  gt_o_4,
     lt_o  =>  lt_o_4
     );

cmp3 : bit_comparator
   port map (
     a_i   =>  a_7bit_i (03),
     b_i   =>  b_7bit_i (03),
     eq_i  =>  eq_o_2,
     gt_i  =>  gt_o_2,
     lt_i  =>  lt_o_2,
     eq_o  =>  eq_o_3,
     gt_o  =>  gt_o_3,
     lt_o  =>  lt_o_3
     );

cmp2 : bit_comparator
   port map (
     a_i   =>  a_7bit_i (02),
     b_i   =>  b_7bit_i (02),
     eq_i  =>  eq_o_1,
     gt_i  =>  gt_o_1,
     lt_i  =>  lt_o_1,
     eq_o  =>  eq_o_2,
     gt_o  =>  gt_o_2,
     lt_o  =>  lt_o_2
     );

cmp1 : bit_comparator
   port map (
     a_i   =>  a_7bit_i (01),
     b_i   =>  b_7bit_i (01),
     eq_i  =>  eq_o_0,
     gt_i  =>  gt_o_0,
     lt_i  =>  lt_o_0,
     eq_o  =>  eq_o_1,
     gt_o  =>  gt_o_1,
     lt_o  =>  lt_o_1
     );

cmp0 : bit_comparator
   port map (
     a_i   =>  a_7bit_i (00),
     b_i   =>  b_7bit_i (00),
     eq_i  =>  eq_i_0,
     gt_i  =>  gt_i_0,
     lt_i  =>  lt_i_0,
     eq_o  =>  eq_o_0,
     gt_o  =>  gt_o_0,
     lt_o  =>  lt_o_0
     );

end structural;
