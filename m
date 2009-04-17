From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Fri, 17 Apr 2009 03:22:24 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904170314220.18855@zirkon.biophys.uni-duesseldorf.de>
References: <20090326123822.GD8081@marenka.net>
 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
 <alpine.DEB.1.00.0904140556250.22987@zirkon.biophys.uni-duesseldorf.de>
 <1239696787.2049.8.camel@petr>
 <alpine.DEB.1.00.0904141017160.30084@zirkon.biophys.uni-duesseldorf.de>
 <1239698381.2049.25.camel@petr>
 <alpine.DEB.1.00.0904150319350.29525@zirkon.biophys.uni-duesseldorf.de>
 <1239774966.20245.4.camel@petr>
 <alpine.DEB.1.00.0904160107540.4339@zirkon.biophys.uni-duesseldorf.de>
 <1239862075.12777.14.camel@petr>
 <alpine.DEB.1.00.0904160934480.19859@zirkon.biophys.uni-duesseldorf.de>
 <1239868903.12777.25.camel@petr>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <1239868903.12777.25.camel@petr>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org

Hi Petr,

> > There's something wrong with the Atari FAT option code then - this is what I get 
> > with atari=yes on the first of your partitions (128MB?):
> 
> 255 MB, IIRC (same sector/cluster size as 128 MB)

Right - 
 
> > FAT (before atari): FAT bits 0 clusters 32622 sectors 65280 
> > FAT (option atari): FAT bits 12 clusters 32622 sectors 65280 
> > FAT (after atari): FAT bits 12 clusters 32622 sectors 65280 
> > 
> > The GEMDOS option code picks a 12 bit FAT even though it should clearly fit into 
> > a 16 bit FAT. 
> 
> I don't know what you mean by "before/after atari" but it's clearly all

'before' is right before the FAT bit size is set in inode.c - without the GEMDOS
option, the FAT is assumed to be 16 bit if it's not set to 32 bit. 

'after' is the final result once the GEMDOS option has been processed. If the 
total number of clusters is found to be larger than the maximum for 16 bit FAT, 
the FAT size is assumed to be 12 bit (with no further adjustment of logical 
sector size or sectors per cluster).

That test clearly goes wrong here.

> wrong. FAT12 is on floppies only... Besides that how could 32622 value
> fit into 12 bit number?

That's the beauty of it, apparently. Just kidding. 

I'll go back to the pre-2.6 code to see if it made sense there. 

	Michael
