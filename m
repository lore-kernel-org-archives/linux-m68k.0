From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Wed, 15 Apr 2009 03:25:01 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904150319350.29525@zirkon.biophys.uni-duesseldorf.de>
References: <20090326123822.GD8081@marenka.net>
 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
 <alpine.DEB.1.00.0904140556250.22987@zirkon.biophys.uni-duesseldorf.de>
 <1239696787.2049.8.camel@petr>
 <alpine.DEB.1.00.0904141017160.30084@zirkon.biophys.uni-duesseldorf.de>
 <1239698381.2049.25.camel@petr>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <1239698381.2049.25.camel@petr>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org

Hi,

> Well, many years ago it used to be suggested to create a smallish boot
> partition and then larger data/application partition(s). I think the
> reason for this was that some of the early Atari disk drivers used to
> loose the first partition's contents occasionally. 
> 
> Anyway, the point is that even these days you can encounter a small
> partitions on Atari.

OK, 
 
> BTW, does it mean that there is a problem with mounting small GEMDOS
> partitions in Linux (<32 MB?)? And at the same time you can't mount
> larger partitions because of the logical sector size limit (>511 MB)?

Small partitions I can mount as regular MSDOS FAT (-o atari=no) only, unless 
they are <32 MB (in which case it's a 16 bit FAT with few enough clusters to be 
treated as 16 bit FAT by the Atari FAT patch).

I'll try your disk image and see what I get. What disk driver did you create 
these partitions with?

	Michael
