From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Thu, 16 Apr 2009 01:38:29 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904160107540.4339@zirkon.biophys.uni-duesseldorf.de>
References: <20090326123822.GD8081@marenka.net>
 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
 <alpine.DEB.1.00.0904140556250.22987@zirkon.biophys.uni-duesseldorf.de>
 <1239696787.2049.8.camel@petr>
 <alpine.DEB.1.00.0904141017160.30084@zirkon.biophys.uni-duesseldorf.de>
 <1239698381.2049.25.camel@petr>
 <alpine.DEB.1.00.0904150319350.29525@zirkon.biophys.uni-duesseldorf.de>
 <1239774966.20245.4.camel@petr>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <1239774966.20245.4.camel@petr>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org

Hi,

> > Small partitions I can mount as regular MSDOS FAT (-o atari=no) only, unless 
> > they are <32 MB (in which case it's a 16 bit FAT with few enough clusters to be 
> > treated as 16 bit FAT by the Atari FAT patch).
> 
> I don't think I understand it.

It is a bit weird, yes. I may have to get the vfat module to dump more 
information about the volume format to see what goes wrong. 

> What if I created a disk image with 15, 31, 63, 127, 255 and 511 MB
> partitions and sent it to you? Would you please list what partition
> sizes are mountable with _and_ without the Atari FAT patch that we are
> discussing here? That could finally clear it up (for me at least).

I'm happy to do that. Can you please specify what parameters (logical sector 
size, number of sectors per cluster) the partitions were generated with? I'd 
like to compare that with what the vfat module figures out from the disk image.
 
> > What disk driver did you create these partitions with?
> 
> HDDRIVER, so it should be fully AHDI compatible.

Yup - did AHDI use particular values for logical sector size and sectors per 
cluster that we'd need to make sure will still work? 

	Michael

