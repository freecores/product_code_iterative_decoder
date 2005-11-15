-- $Id: twos_c_8bit.vhdl,v 1.1.1.1 2005-11-15 01:52:31 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       : Two's complement
-- Project     : 
-------------------------------------------------------------------------------
-- File        : twos_c_8bit
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2005/11/01
-- Last update : 
-- Simulators  :
-- Synthesizers: 
-- Target      : 
-------------------------------------------------------------------------------
-- Description : Calculate two's complement of 8 bit signed signal
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

entity twos_c_8bit is
   port (
   twos_c_i : in  bit_vector (07 downto 00);
   twos_c_o : out bit_vector (07 downto 00)
   );
end twos_c_8bit;

architecture data_flow of twos_c_8bit is

begin

twos_c_o(00) <= (twos_c_i(00));
twos_c_o(01) <= (not(twos_c_i(01)) xor (not(twos_c_i(00))));
twos_c_o(02) <= (not(twos_c_i(02)) xor (not(twos_c_i(00)) and not(twos_c_i(01))));
twos_c_o(03) <= (not(twos_c_i(03)) xor ((not(twos_c_i(00)) and not(twos_c_i(01))) and not(twos_c_i(02))));
twos_c_o(04) <= (not(twos_c_i(04)) xor ((not(twos_c_i(00)) and not(twos_c_i(01))) and (not(twos_c_i(02)) and not(twos_c_i(03)))));
twos_c_o(05) <= (not(twos_c_i(05)) xor (((not(twos_c_i(00)) and not(twos_c_i(01))) and (not(twos_c_i(02)) and not(twos_c_i(03)))) and not(twos_c_i(04))));
twos_c_o(06) <= (not(twos_c_i(06)) xor (((not(twos_c_i(00)) and not(twos_c_i(01))) and (not(twos_c_i(02)) and not(twos_c_i(03)))) and (not(twos_c_i(04)) and not(twos_c_i(05)))));
twos_c_o(07) <= (not(twos_c_i(07)) xor (((not(twos_c_i(00)) and not(twos_c_i(01))) and (not(twos_c_i(02)) and not(twos_c_i(03)))) and ((not(twos_c_i(04)) and not(twos_c_i(05))) and not(twos_c_i(06)))));

end data_flow;
