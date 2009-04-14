From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Tue, 14 Apr 2009 10:26:04 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904141017160.30084@zirkon.biophys.uni-duesseldorf.de>
References: <20090326123822.GD8081@marenka.net>
 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
 <alpine.DEB.1.00.0904140556250.22987@zirkon.biophys.uni-duesseldorf.de>
 <1239696787.2049.8.camel@petr>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <1239696787.2049.8.camel@petr>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org

Hi,

> > If someone could provide a disk image to test in ARAnyM, I'd be happy to give it a try. 
> 
> I could create a disk image for testing real quick. Say with 255, 511
> and 1023 MB partitions?

Reasonable sizes - as long as these are useable as GEMDOS partitions that should 
be fine. 
 
> > At the very least, the default should be changed to atari=off on modern systems 
> > like the CT60:
> 
> Why? How is the CPU accelerator related to disk filesystem?

Only in so far as no one would want to use 16 or 32 MB partitions these days. 
Not related to the accelerator at all. 

	Michael

