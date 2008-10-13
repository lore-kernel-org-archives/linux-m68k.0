From: Andreas Schwab <schwab@suse.de>
Subject: Re: Linux and amiga floppy images
Date: Mon, 13 Oct 2008 12:05:58 +0200
Message-ID: <jeskr0zu61.fsf@sykes.suse.de>
References: <alpine.LNX.2.00.0810130345170.4882@firda.kolla.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ns1.suse.de ([195.135.220.2]:38635 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1765981AbYJMKGM (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 13 Oct 2008 06:06:12 -0400
In-Reply-To: <alpine.LNX.2.00.0810130345170.4882@firda.kolla.no>
 (=?iso-8859-1?Q?=22Kolbj=F8rn?=
	Barmen"'s message of "Mon, 13 Oct 2008 04:20:29 +0200 (CEST)")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?iso-8859-1?Q?Kolbj=F8rn?= Barmen <linux-m68k@kolla.no>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Kolbj=F8rn Barmen <linux-m68k@kolla.no> writes:

> But I didnt give up there, I tried on different systems... much to my
> amusement it worked fine on my linux/m68k systems - amigas, macs and
> aranym alike!  OK, I thought, maybe endianness, so I tried on my ppc =
ibook
> running linux - same failures as on the PCs. So - something is done v=
ery
> correct on m68k in regard to affs, that isnt done correct on other ar=
chs.
> Anyone know what that might be?

If it's not the endianess then the other possible failure mode is
alignment: on m68k all types are at most aligned at a 2 byte boundary.
The structures in <linux/amigaffs.h> don't have any obvious alignment
problems, though.

Andreas.

--=20
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux Products GmbH, Maxfeldstra=DFe 5, 90409 N=FCrnberg, Germany
PGP key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4=
ED5
"And now for something completely different."
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
