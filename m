From: Matthias Reis <matthias.reis@hu-berlin.de>
Subject: Re: Crash in entry.S:resume on Atari ST
Date: Fri, 16 Sep 2016 16:47:46 +0200
Message-ID: <20160916144746.GB6030@hu-berlin.de>
References: <8132f924080d98f2bbe149d35352507d@hu-berlin.de>
 <87y42rx6t2.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87y42rx6t2.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org

Hi Andreas,

On Fri, Sep 16, 2016 at 04:23:05PM +0200, Andreas Schwab wrote:
> > ===  hatari emulator output:
> > CPU=$48f2, VBL=6379, FrameCycles=86856, HBL=387, LineCycles=168, DSP=N/A
> > $000048f2 : 4e75                               rts
> > r
> >   D0 00000008   D1 00002200   D2 00005401   D3 00961EC8
> >   D4 00000000   D5 00940020   D6 602E0206   D7 00E00030
> >   A0 00865B68   A1 00961EEC   A2 0080E000   A3 000026E4
> >   A4 000045C0   A5 000045E4   A6 00004794   A7 00000000
> > USP  00000000 ISP  00000018
> > T=00 S=0 M=0 X=0 N=0 Z=0 V=0 C=0 IMASK=2 STP=0
> 
> Given the value of SSP and the values loaded into D6/D7 (which match the
> ROM shadow at address 0), it is clear that SP was 0 at $48ea.  So it
> looks like A1 is just pointing at a block of zeros, not at a valid task
> struct.

Maybe the allocation for the task struct failed? I will check that. Thanks for
your analysis!

Matthias
