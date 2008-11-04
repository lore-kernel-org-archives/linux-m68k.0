From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [patch 3/2] m68k: Atari EtherNAT - add writew_be for data push
Date: Tue, 04 Nov 2008 08:14:45 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0811040812120.2519@zirkon.biophys.uni-duesseldorf.de>
References: <20080903073629.GD4104@cs181140183.pp.htv.fi>
 <alpine.DEB.1.00.0810021020150.1527@zirkon.biophys.uni-duesseldorf.de>
 <48E7A5D6.3020903@freenet.de>
 <alpine.DEB.1.00.0810050511390.32397@zirkon.biophys.uni-duesseldorf.de>
 <48EB266E.3070708@freenet.de> <48ECE5DA.2090302@freenet.de>
 <alpine.DEB.1.00.0810090428170.19738@zirkon.biophys.uni-duesseldorf.de>
 <48EF9ECE.40505@freenet.de>
 <alpine.DEB.1.00.0810110330110.10175@zirkon.biophys.uni-duesseldorf.de>
 <48F0ECC9.6050902@freenet.de>
 <alpine.DEB.1.00.0810122141540.26363@zirkon.biophys.uni-duesseldorf.de>
 <48F679D1.60709@freenet.de>
 <alpine.DEB.1.00.0810281959240.8885@zirkon.biophys.uni-duesseldorf.de>
 <49085A7A.3030006@freenet.de>
 <alpine.DEB.1.00.0810292124320.22819@zirkon.biophys.uni-duesseldorf.de>
 <4909C12C.4020009@freenet.de> <Pine.LNX.4.64.0810301800270.30686@anakin>
 <alpine.DEB.1.00.0810302112230.572@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0811032227090.8517@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.rz.uni-duesseldorf.de ([134.99.128.30]:59378 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752532AbYKDHOs (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 4 Nov 2008 02:14:48 -0500
Received: from conversion-daemon by mail.rz.uni-duesseldorf.de
 (Sun Internet Mail Server sims.4.0.2001.07.26.11.50.p9)
 id <0K9S00601S4L3A@mail.rz.uni-duesseldorf.de> for linux-m68k@vger.kernel.org;
 Tue,  4 Nov 2008 08:14:46 +0100 (MET)
In-reply-to: <Pine.LNX.4.64.0811032227090.8517@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Frank P. Szymanski" <frank_peter.szymanski@freenet.de>, Debian GNU/Linux m68k <debian-68k@lists.debian.org>, smarenka@debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

> > > When Michael thinks they're ready, he can submit them to netdev or linux-scsi
> > > ;-)
> > 
> > I'm happy for them to live in linux-m68k :-)
> > 
> > EtherNEC and EtherNAT are 'ready' in the sense they are working reliably. They 
> > are by no means 'ready in the sense that mainline kernel maintainers would be 
> > happy to take my patches. 
> 
> Or should we get them into linux-staging?
> 
> http://kerneltrap.org/Linux/Introducing_the_Linux_Staging_Tree

That would be an option - I'd first like to rewrite EtherNEC to use a platform 
device for init, though. 

SCSI will be a different matter though. Not a new driver :-)

	Michael

