-- $Id: bit_comparator.vhdl,v 1.1.1.1 2005-11-15 01:52:30 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       : Bit comparator
-- Project     : 
-------------------------------------------------------------------------------
-- File        : bit_comparator.vhdl
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2005/11/01
-- Last update : 
-- Simulators  :
-- Synthesizers: 
-- Target      : 
-------------------------------------------------------------------------------
-- Description : Compare two input
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

entity bit_comparator is
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
end bit_comparator;

architecture data_flow of bit_comparator is
begin
     lt_o <= (((not(a_i) and lt_i) or (b_i and lt_i)) or (not(a_i) and b_i));
     eq_o <= (((a_i and b_i) and eq_i) or ((not(a_i) and not(b_i)) and eq_i));
     gt_o <= (((a_i and gt_i) or (not(b_i) and gt_i)) or (a_i and not(b_i)));
end data_flow;
