From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] m68k: handle Atari interrupts in multi-platform kernels
Date: Thu, 22 Aug 2013 19:07:01 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1308221903570.2722@herc.mirbsd.org>
References: <201308092135.r79LZwL1013105@herc.mirbsd.org>
 <Pine.BSM.4.64L.1308092147300.28970@herc.mirbsd.org>
 <f853f42622f9fd3b1f832a3b2b1d04ae@biophys.uni-duesseldorf.de>
 <CAMuHMdWNHyTUYrcn9M2wn5-1+KYi+momBKHE2t9y4zXAEvygrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from eurynome.mirbsd.org ([81.169.181.30]:37042 "EHLO
	eurynome.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753454Ab3HVTSN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Aug 2013 15:18:13 -0400
Received: from herc.mirbsd.org (root@herc.mirbsd.org [IPv6:2a01:198:25d:0:202:b3ff:feb7:54e8])
	by eurynome.mirbsd.org (8.14.5.Beta0/8.14.3) with ESMTP id r7MJHiD0010738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-m68k@vger.kernel.org>; Thu, 22 Aug 2013 19:18:09 GMT
In-Reply-To: <CAMuHMdWNHyTUYrcn9M2wn5-1+KYi+momBKHE2t9y4zXAEvygrw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Geert Uytterhoeven dixit:

>Anyone who has tried this on real iron? I haven't (on Amiga).

=46WIW, that patch was in Debian linux-image-3.10-2-m68k
so everyone who successfully booted that counts.

Scott Holder booted it on his Macintosh AFAIR.

bye,
//mirabilos
--=20
=C2=ABMyISAM tables -will- get corrupted eventually. This is a fact of =
life. =C2=BB
=E2=80=9Cmysql is about as much database as ms access=E2=80=9D =E2=80=93=
 =E2=80=9CMSSQL at least descends
from a database=E2=80=9D =E2=80=9Cit's a rebranded SyBase=E2=80=9D =E2=80=
=9CMySQL however was born from a
flatfile and went downhill from there=E2=80=9D =E2=80=93 =E2=80=9Cat le=
ast jetDB doesn=E2=80=99t claim to
be a database=E2=80=9D	=E2=80=A3=E2=80=A3=E2=80=A3 Please, http://deb.l=
i/mysql and MariaDB, finally die!
