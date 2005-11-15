-- $Id: ser2par8bit.vhdl,v 1.1.1.1 2005-11-15 01:52:31 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       : Serial to paralel 8bit
-- Project     : 
-------------------------------------------------------------------------------
-- File        : ser2par8bit.vhdl
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2005/11/01
-- Last update : 
-- Simulators  :
-- Synthesizers: 
-- Target      : 
-------------------------------------------------------------------------------
-- Description : Conversion from serial input to paralel output
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
use IEEE.std_logic_1164.ALL;

entity ser2par8bit is
   port (
     clock : in  bit;
     clear : in  bit;
     start : in  bit;
     rxin  : in  bit_vector (07 downto 00);
     y0    : out bit_vector (07 downto 00);
     y1    : out bit_vector (07 downto 00);
     y2    : out bit_vector (07 downto 00);
     y3    : out bit_vector (07 downto 00);
     r0    : out bit_vector (07 downto 00);
     r1    : out bit_vector (07 downto 00);
     c0    : out bit_vector (07 downto 00);
     c1    : out bit_vector (07 downto 00)
     );
end ser2par8bit;

architecture data_flow of ser2par8bit is

subtype type_word is bit_vector (07 downto 00);
type type_fifo is array (09 downto 00) of type_word;
signal fifo8bx7 : type_fifo;

begin

process (clock, clear)
begin
    if (clear = '1') then
        fifo8bx7 (00) <= (others => '0');
        fifo8bx7 (01) <= (others => '0');
        fifo8bx7 (02) <= (others => '0');
        fifo8bx7 (03) <= (others => '0');
        fifo8bx7 (04) <= (others => '0');
        fifo8bx7 (05) <= (others => '0');
        fifo8bx7 (06) <= (others => '0');
        fifo8bx7 (07) <= (others => '0');
        fifo8bx7 (08) <= (others => '0');
        fifo8bx7 (09) <= (others => '0');
    elsif ((clock = '0') and clock'event) then
	fifo8bx7 (00) <= rxin (07 downto 00);
	fifo8bx7 (09 downto 01) <= fifo8bx7 (08 downto 00);
    end if;
end process;

process (start)
begin
    if (start = '0' and start'event) then
        y0 <= fifo8bx7 (08);
        y1 <= fifo8bx7 (07);
        y2 <= fifo8bx7 (06);
        y3 <= fifo8bx7 (05);
        r0 <= fifo8bx7 (04);
        r1 <= fifo8bx7 (03);
        c0 <= fifo8bx7 (02);
        c1 <= fifo8bx7 (01);
   end if;
end process;

end data_flow;
