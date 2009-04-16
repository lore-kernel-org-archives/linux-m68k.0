From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Thu, 16 Apr 2009 09:45:39 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904160934480.19859@zirkon.biophys.uni-duesseldorf.de>
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
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <1239862075.12777.14.camel@petr>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org

Hi,

> Atari GEMDOS and Atari partition programs always use 2 sectors per
> cluster. Since FAT16 can hold max 32k entries you can compute the rest
> of information from this (example: 63 MB partition needs 2 kB clusters
> to fit into 32k cluster limit so the logical sector size for 32-63 MB
> partition needs to be 1 kB).

There's something wrong with the Atari FAT option code then - this is what I get 
with atari=yes on the first of your partitions (128MB?):

FAT (before atari): FAT bits 0 clusters 32622 sectors 65280 
FAT (option atari): FAT bits 12 clusters 32622 sectors 65280 
FAT (after atari): FAT bits 12 clusters 32622 sectors 65280 

The GEMDOS option code picks a 12 bit FAT even though it should clearly fit into 
a 16 bit FAT. 

With atari=no:

FAT (before atari): FAT bits 0 clusters 32622 sectors 65280 
FAT (after atari): FAT bits 16 clusters 32622 sectors 65280 

The larger two partitions exceed the logial sector size of 4k. 
 
> > Yup - did AHDI use particular values for logical sector size and sectors per 
> > cluster that we'd need to make sure will still work? 
> 
> See above - 2 logical sectors in a cluster. That is actually the only
> difference from MS-DOS where they stick with fixed logical sector size
> and are adding more sectors to a cluster, IIRC.

Thanks, that'll help me to find a fix for this patch. 

	Michael
