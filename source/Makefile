# $Id: Makefile,v 1.1.1.1 2005-11-15 01:52:30 arif_endro Exp $
# -----------------------------------------------------------------------------
#  Title       : Alliance Makefile 
#  Project     :  
# -----------------------------------------------------------------------------
#  File        :  Makefile
#  Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
#  Created     : 2005/11/01
#  Last update : 
#  Simulators  :
#  Synthesizers: 
#  Target      : 
# -----------------------------------------------------------------------------
#  Description : Alliance Makefile from preliminary synthesis
# -----------------------------------------------------------------------------
#  Copyright (C) 2005 Arif E. Nugroho
###############################################################################
## 
## 	THIS SOURCE FILE MAY BE USED AND DISTRIBUTED WITHOUT RESTRICTION
## PROVIDED THAT THIS COPYRIGHT STATEMENT IS NOT REMOVED FROM THE FILE AND THAT
## ANY DERIVATIVE WORK CONTAINS THE ORIGINAL COPYRIGHT NOTICE AND THE
## ASSOCIATED DISCLAIMER.
## 
###############################################################################
## 
## 	THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
## IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
## MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
## EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
## SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
## PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
## OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
## WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
## OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
## ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
## 
###############################################################################

VASY    = vasy -V -H -s -o
SOURCES = product_code.vhdl

all: $(SOURCES)
	for SOURCE in $(SOURCES); do\
	$(VASY) $${SOURCE};\
	done

%.vhd : %.vhdl
	$(VASY) $<

clean:
	-rm -v *.vhd
