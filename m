From: Mikael Pettersson <mikpe@it.uu.se>
Subject: Re: nfhd performance
Date: Mon, 19 Aug 2013 16:29:29 +0200
Message-ID: <21010.11209.818043.191186@pilspetsen.it.uu.se>
References: <CAMuHMdUwzzx5Ae7sdvbRBtgY4UoXpo5-ig4PfdqFH4beWv_AHQ@mail.gmail.com>
	<03094f45e85bca24df9306f73df2c84c@biophys.uni-duesseldorf.de>
	<CAMuHMdUkMEorK34WnV9==thRPCVRXV0ySWq=fFTNFO1fe3Qc6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp1.uu.se ([130.238.7.54]:52622 "EHLO smtp1.uu.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750931Ab3HSOne (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 19 Aug 2013 10:43:34 -0400
In-Reply-To: <CAMuHMdUkMEorK34WnV9==thRPCVRXV0ySWq=fFTNFO1fe3Qc6g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux/m68k <linux-m68k@vger.kernel.org>, aranym@lists.bobek.cz

Geert Uytterhoeven writes:
 > On Sat, Aug 17, 2013 at 4:01 AM, Michael Schmitz
 > <schmitz@biophys.uni-duesseldorf.de> wrote:
 > >> In a kernel that has both IDE and nfhd support, once everything is in the
 > >> buffer cache, I get:
 > >>
 > >> atari:~# dd if=/dev/hda2 bs=1M of=/dev/null
 > >> 134+1 records in
 > >> 134+1 records out
 > >> 141114880 bytes (141 MB) copied, 5.91 seconds, 23.9 MB/s
 > >> atari:~# dd if=/dev/nfhd8p2 bs=1M of=/dev/null
 > >> 134+1 records in
 > >> 134+1 records out
 > >> 141114880 bytes (141 MB) copied, 17.09 seconds, 8.3 MB/s
 > >>
 > >> So nfhd is slower than emulated IDE?
 > >
 > >
 > > That seems odd indeed ... is the disk attached as IDE or via USB adapter?
 > > (Checking to see whether I should get similar results)
 > 
 > It's not a physical disk:
 > 
 > [IDE0]
 > Present = Yes
 > IsCDROM = No
 > ByteSwap = No
 > ReadOnly = No
 > Path = /scratch/geert/aranym/etch-m68k.img
 > Cylinders = 2102
 > Heads = 16
 > SectorsPerTrack = 63
 > ModelName = Sarge m68k

Part of the problem is that ByteSwap = No setting.  Contrary to what one might
think, "No" there actually means "yes, byteswap every sector read or written".

Grep for byteswap in aranym's src/natfeat/xhdi.cpp if you don't believe me...

As far as I can tell, this setting is only meaningful if you have an image which
must be shared with actual HW, and you don't want to byteswap it when migrating
it between these two roles (HW or aranym).  I don't have that requirement, so I
run my aranym VMs with ByteSwap = Yes, which eliminates that overhead.

There are also other things in xhdi.cpp I don't really like, such as going through
stdio when raw Unix file-descriptors would do, and the small I/O unit size.
