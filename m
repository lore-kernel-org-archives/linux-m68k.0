From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] m68k: handle Atari interrupts in multi-platform kernels
Date: Mon, 19 Aug 2013 12:00:31 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1308191159200.29960@herc.mirbsd.org>
References: <201308092135.r79LZwL1013105@herc.mirbsd.org>
 <Pine.BSM.4.64L.1308092147300.28970@herc.mirbsd.org>
 <f853f42622f9fd3b1f832a3b2b1d04ae@biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1308130810460.20692@herc.mirbsd.org>
 <8612ec946622122a048ec3805a30fef5@biophys.uni-duesseldorf.de>
 <CAMuHMdXZb4RWKxxzLZpnzmYN02EaeqQJ9X0QHH6ty9sL_7P=bg@mail.gmail.com>
 <Pine.BSM.4.64L.1308131039210.1920@herc.mirbsd.org> <52101C34.8060404@gmail.com>
 <Pine.BSM.4.64L.1308180059420.18148@herc.mirbsd.org> <52108D28.1010405@gmail.com>
 <Pine.BSM.4.64L.1308180934140.2593@herc.mirbsd.org> <e4fb41650bb91f3e148195be63834bef@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from eurynome.mirbsd.org ([81.169.181.30]:45904 "EHLO
	eurynome.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751376Ab3HSMF0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 19 Aug 2013 08:05:26 -0400
Received: from herc.mirbsd.org (root@herc.mirbsd.org [IPv6:2a01:198:25d:0:202:b3ff:feb7:54e8])
	by eurynome.mirbsd.org (8.14.5.Beta0/8.14.3) with ESMTP id r7JC5IoF009923
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-m68k@vger.kernel.org>; Mon, 19 Aug 2013 12:05:23 GMT
In-Reply-To: <e4fb41650bb91f3e148195be63834bef@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, debian-68k@lists.debian.org

Michael Schmitz dixit:

> I must admit I'm using Ubuntu LTS releases mostly, so 'years' might b=
e the
> right ballpark.

Haha=E2=80=A6

> I assumed the initrd was pre-built and included in the package. Silly=
 of me.

No, that=E2=80=99s not how they work (which is the reason for much anno=
yance
and reluctance on my part to switch to using initrd, and the reason
for me asking around on how to port kexec to m68k).

> Much easier to integrate the patch in question into my 3.10 git tree.

True.

bye,
//mirabilos
--=20
<hecker> cool ein Ada Lovelace Google-Doodle. aber zum 197. Geburtstag?=
 H=C3=A4tten
die nicht noch 3 Jahre warten k=C3=B6nnen? <mirabilos> bis dahin gibts =
google nicht
mehr <hecker> ja, k=C3=B6nnte man meinen. wahrscheinlich ist der angek=C3=
=BCndigte welt-
untergang aus dem maya-kalender die globale abschaltung von google =E2=98=
=BA und darum
m=C3=BCssen die die doodles vorher noch raushauen
