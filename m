From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Fwd: [PATCH 37/91] arch/m68k/mac/via.c Update broken web addresses in
 the arch directory.
Date: Fri, 3 Sep 2010 09:53:32 +0200
Message-ID: <AANLkTinX+FWhH_gmVR1pT_k=DgkxXKnqDUQ5g3rxHd7Z@mail.gmail.com>
References: <1283461746-7905-1-git-send-email-justinmattock@gmail.com>
	<1283461746-7905-7-git-send-email-justinmattock@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:37860 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753426Ab0ICHxc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Sep 2010 03:53:32 -0400
Received: by yxp4 with SMTP id 4so544185yxp.19
        for <linux-m68k@vger.kernel.org>; Fri, 03 Sep 2010 00:53:32 -0700 (PDT)
In-Reply-To: <1283461746-7905-7-git-send-email-justinmattock@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>
Cc: "Justin P. Mattock" <justinmattock@gmail.com>

---------- Forwarded message ----------
=46rom: Justin P. Mattock <justinmattock@gmail.com>
Date: Thu, Sep 2, 2010 at 23:08
Subject: [PATCH 37/91] arch/m68k/mac/via.c Update broken web addresses
in the arch directory.
To: trivial@kernel.org
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
jkosina@suse.cz, "Justin P. Mattock" <justinmattock@gmail.com>


The below patch updates a broken web address that is no longer
working due to company buyout, and/or change of location.
(Please have a look through, and let me know if any of them
need to be changed, and I'll resend an updated patch).

Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>

---
=C2=A0arch/m68k/mac/via.c | =C2=A0 =C2=A07 ++-----
=C2=A01 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
index e71166d..0cfa2cf 100644
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -6,11 +6,8 @@
=C2=A0*
=C2=A0* CSA: Motorola seems to have removed documentation on the 6522 f=
rom
=C2=A0* their web site; try
- * =C2=A0 =C2=A0 http://nerini.drf.com/vectrex/other/text/chips/6522/
- * =C2=A0 =C2=A0 http://www.zymurgy.net/classic/vic20/vicdet1.htm
- * and
- * =C2=A0 =C2=A0 http://193.23.168.87/mikro_laborversuche/via_iobauste=
in/via6522_1.html
- * for info. =C2=A0A full-text web search on 6522 AND VIA will probabl=
y also
+ * =C2=A0 =C2=A0 http://web.archive.org/web/*/http://www.zymurgy.net/c=
lassic/vic20/vicdet1.htm
+ * A full-text web search on 6522 AND VIA will probably also
=C2=A0* net some usefulness. <cananian@alumni.princeton.edu> 20apr1999
=C2=A0*
=C2=A0* Additional data is here (the SY6522 was used in the Mac II etc)=
:
--
1.7.2.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.html
Please read the FAQ at =C2=A0http://www.tux.org/lkml/



--=20
Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
