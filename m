From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] m68k: handle Atari interrupts in multi-platform kernels
Date: Tue, 13 Aug 2013 10:42:09 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1308131039210.1920@herc.mirbsd.org>
References: <201308092135.r79LZwL1013105@herc.mirbsd.org>
 <Pine.BSM.4.64L.1308092147300.28970@herc.mirbsd.org>
 <f853f42622f9fd3b1f832a3b2b1d04ae@biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1308130810460.20692@herc.mirbsd.org>
 <8612ec946622122a048ec3805a30fef5@biophys.uni-duesseldorf.de>
 <CAMuHMdXZb4RWKxxzLZpnzmYN02EaeqQJ9X0QHH6ty9sL_7P=bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from eurynome.mirbsd.org ([81.169.181.30]:10070 "EHLO
	eurynome.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757147Ab3HMKxM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 13 Aug 2013 06:53:12 -0400
Received: from herc.mirbsd.org (root@herc.mirbsd.org [IPv6:2a01:198:25d:0:202:b3ff:feb7:54e8])
	by eurynome.mirbsd.org (8.14.5.Beta0/8.14.3) with ESMTP id r7DAr5np001932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-m68k@vger.kernel.org>; Tue, 13 Aug 2013 10:53:10 GMT
In-Reply-To: <CAMuHMdXZb4RWKxxzLZpnzmYN02EaeqQJ9X0QHH6ty9sL_7P=bg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven dixit:

>On Tue, Aug 13, 2013 at 10:31 AM, Michael Schmitz
><schmitz@biophys.uni-duesseldorf.de> wrote:

>>(Can you please use UTF-8 for eMails, not Windows-1252?)
>
>I'll try - no idea why Mac Mail would have used that. This one ought t=
o be UTF-8.

Yes, that one was better.

>He's just returned from holidays, working through the still-growing ma=
il backlog
>while entertaining the kids and the household environment ;-)

Ah, I see. Have fun, then =E2=98=BA

>BTW, the interrupt patch only kills some messages at boot, right?
>Or does (the lack of) it cause real errors later?

I=E2=80=99m not entirely sure, but the =E2=80=9Cscary-looking=E2=80=9D =
boot messages
are gone. Performance was mentioned in the thread IIRC, but
I haven=E2=80=99t noticed anything more than subtle.

bye,
//mirabilos, no holidays here =E2=98=B9
--=20
Sometimes they [people] care too much: pretty printers [and syntax high=
ligh-
ting, d.A.] mechanically produce pretty output that accentuates irrelev=
ant
detail in the program, which is as sensible as putting all the preposit=
ions
in English text in bold font.	-- Rob Pike in "Notes on Programming in C=
"
