-- $Id: adder_08bit.vhdl,v 1.1.1.1 2005-11-15 01:52:30 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       : 8 bit adder
-- Project     : 
-------------------------------------------------------------------------------
-- File        : adder_08bit.vhdl
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2005/11/01
-- Last update : 
-- Simulators  :
-- Synthesizers: 
-- Target      : 
-------------------------------------------------------------------------------
-- Description : 8 bit signed adder
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

entity adder_08bit is
   port (
      addend_08bit  : in  bit_vector (07 downto 0);
      augend_08bit  : in  bit_vector (07 downto 0);
      adder08_output: out bit_vector (08 downto 0)
      );
end adder_08bit;

architecture structural of adder_08bit is

   component fulladder
      port (
      addend        : in   bit;
      augend        : in   bit;
      carry_in      : in   bit;
      sum           : out  bit;
      carry         : out  bit
      );
   end component;

signal c00 : bit;
signal c01 : bit;
signal c02 : bit;
signal c03 : bit;
signal c04 : bit;
signal c05 : bit;
signal c06 : bit;
signal c07 : bit;
signal c08 : bit;
signal over08 : bit;
signal adder08_output_int : bit_vector (08 downto 0);

begin

c00                     <= '0';
over08                  <= (addend_08bit (07) xor augend_08bit (07));
adder08_output_int (08) <= ((adder08_output_int (07) and over08) or 
                           (c08 and (not (over08))));
adder08_output          <= adder08_output_int;

fa07 : fulladder
   port map (
      addend     => addend_08bit(07),
      augend     => augend_08bit(07),
      carry_in   => c07,
      sum        => adder08_output_int(07),
      carry      => c08
      );

fa06 : fulladder
   port map (
      addend     => addend_08bit(06),
      augend     => augend_08bit(06),
      carry_in   => c06,
      sum        => adder08_output_int(06),
      carry      => c07
      );

fa05 : fulladder
   port map (
      addend     => addend_08bit(05),
      augend     => augend_08bit(05),
      carry_in   => c05,
      sum        => adder08_output_int(05),
      carry      => c06
      );

fa04 : fulladder
   port map (
      addend     => addend_08bit(04),
      augend     => augend_08bit(04),
      carry_in   => c04,
      sum        => adder08_output_int(04),
      carry      => c05
      );

fa03 : fulladder
   port map (
      addend     => addend_08bit(03),
      augend     => augend_08bit(03),
      carry_in   => c03,
      sum        => adder08_output_int(03),
      carry      => c04
      );

fa02 : fulladder
   port map (
      addend     => addend_08bit(02),
      augend     => augend_08bit(02),
      carry_in   => c02,
      sum        => adder08_output_int(02),
      carry      => c03
      );

fa01 : fulladder
   port map (
      addend     => addend_08bit(01),
      augend     => augend_08bit(01),
      carry_in   => c01,
      sum        => adder08_output_int(01),
      carry      => c02
      );

fa00 : fulladder
   port map (
      addend     => addend_08bit(00),
      augend     => augend_08bit(00),
      carry_in   => c00,
      sum        => adder08_output_int(00),
      carry      => c01
      );

end structural;
