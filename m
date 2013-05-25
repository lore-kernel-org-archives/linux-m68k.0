From: =?iso-8859-1?Q?Ingo_J=FCrgensmann?= <ij@2013.bluespice.org>
Subject: Re: [RFC] m68k: Update defconfigs for v3.9
Date: Sat, 25 May 2013 21:47:44 +0200
Message-ID: <4BE4134A-EB58-454A-97B3-94960777DF3F@2013.bluespice.org>
References: <CAMuHMdVSqN6Bjn1Ph-8xzZ64HzAcj7oBA8B3GNE8PTessUzBkQ@mail.gmail.com> <20130525193301.GB10275@cynthia.pants.nu>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vserv.windfluechter.net ([31.172.31.194]:51951 "EHLO
	vserv.windfluechter.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757763Ab3EYTrw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 25 May 2013 15:47:52 -0400
In-Reply-To: <20130525193301.GB10275@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitzmic@gmail.com>

Am 25.05.2013 um 21:33 schrieb Brad Boyer <flar@allandria.com>:

>> arch/m68k/configs/mac_defconfig ------------------+
>> CONFIG_MAC_PARTITION                  : y y y y y . y y y y y .
> Shouldn't MAC_PARTITION be enabled for the mac configuration?


Yeah, I wondered about that for Amiga as well, but then I noticed that the corresponding partition is not selected for none of the specific subarch. 
I assumed therefor that this isn't necessary and the partition is selected/included automatically when the subarch is chosen. 
But I guess Geert can explain it in more depth. :-)

-- 
Ciao...            //      Fon: 0381-2744150
      Ingo       \X/       http://blog.windfluechter.net


gpg pubkey:  http://www.juergensmann.de/ij_public_key.asc
