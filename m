From: =?UTF-8?Q?Ingo_J=C3=BCrgensmann?= <ij@2012.bluespice.org>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Sat, 30 Mar 2013 10:34:07 +0100
Message-ID: <5354e4d34bab72af91060adf3b629a27@muaddib.hro.localnet>
References: <5152996E.50800@gmail.com>
 <20130328211747.GA10917@chumley.earth.sol> <5154C5E0.3040608@gmail.com>
 <20130328231039.GA14587@chumley.earth.sol>
 <CAMuHMdWxCW0Gp8jYYk7R3WDJ8u-LJBZJ5d9jjaPAf27vXv3jDA@mail.gmail.com>
 <20130329080629.GB14587@chumley.earth.sol>
 <CAMuHMdXcy8Apvm58m4XudxfRTRa9aiTojRVanPtY3M=mTUUxqg@mail.gmail.com>
 <5155E1A3.7060307@gmail.com> <20130329193323.GD14587@chumley.earth.sol>
 <Pine.BSM.4.64L.1303292135220.3992@herc.mirbsd.org>
 <20130329224731.GA22830@chumley.earth.sol> <5156229B.7030606@gmail.com>
 <670fbbcf44fecccc2e7c66ebfcdb4d19@muaddib.hro.localnet>
 <515641D9.5090503@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vserv.windfluechter.net ([178.63.83.104]:40094 "EHLO
	vserv.windfluechter.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754394Ab3C3JeX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 30 Mar 2013 05:34:23 -0400
In-Reply-To: <515641D9.5090503@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Wouter Verhelst <w@uter.be>, linux-m68k@vger.kernel.org

On 2013-03-30 02:37, Michael Schmitz wrote:

> So we have cyberstorm, cyberstormII and blz2060 drivers to port? What
> is the difference between the cyberstorm ones?

There are some good sites for Amiga related hardware, sometimes even 
with high quality photos of the hardware, driver & software download, 
etc:

http://amiga.resource.cx/
http://www.bigbookofamigahardware.com/Default.aspx

Cyberstorm Mk1: CSI ID 7 Clk 40MHz CCF=8 TOut 167 NCR53C9XF(espfast)
http://amiga.resource.cx/photos/photos/cyberstorm-scsi.jpg

Cyberstorm Mk2:
http://amiga.resource.cx/exp/cyberstorm2
http://amiga.resource.cx/photos/photos/cyberstorm2-scsi.jpg

And there's even a Cyberstorm Mk3: Ultra Wide SCSI controller, NCR 
53C770
http://amiga.resource.cx/exp/cyberstorm3

... and some more.

I think the main difference between CS Mk1 and Mk2 is evolution in 
design and a higher integration. You'll see that the Mk2 is much smaller 
in size than the Mk1.

> DMA setup looks fairly similar to me (blz2060 is a bit different
> there). Looks to me as though we should be able to get
> away with a single ESP front end driver, perhaps set the DMA
> functions different based on the model?

Yes, I think there was just only one ESP driver in the past as well. So 
the best would be to look at the old implementation of DMA, I think...

-- 
Ciao...          //    Fon: 0381-2744150
.     Ingo     \X/     http://blog.windfluechter.net

gpg pubkey: http://www.juergensmann.de/ij_public_key.
