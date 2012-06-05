From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] [m68k] Atari: support for NetUSBee register access to
 isp116x.h
Date: Tue, 5 Jun 2012 16:26:59 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1206051623360.9588@herc.mirbsd.org>
References: <CAOmrzkL4BNWr6aLijfpg91m8VKU4A0DRsx1mjOa22qWPrysqtQ@mail.gmail.com>
 <CAMuHMdWpW5aPKasazs2yJX8BZv2F_KXreSAY3+_kXGUqGZVJEw@mail.gmail.com>
 <CAOmrzk+2bYgDNtcW6DVy4WYT2i+07n8xR4bbNbwFJ@mail.gmail.com>
 <loom.20120605T174709-209@post.gmane.org>
 <CAMuHMdWC8agVJoPt5uoxkK-Z6hpEwhoVq6hyniqP6XSXSuzwQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:37974 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752490Ab2FEQ1T convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Jun 2012 12:27:19 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5/8.14.5) with ESMTP id q55GR1M8004537
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Tue, 5 Jun 2012 16:27:04 GMT
In-Reply-To: <CAMuHMdWC8agVJoPt5uoxkK-Z6hpEwhoVq6hyniqP6XSXSuzwQg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>On Tue, Jun 5, 2012 at 5:51 PM, Thorsten Glaser <tg@mirbsd.org> wrote:
>> =E2=91=A1 $EDITOR 00*
>> =E2=91=A2 Add a To: line, and possibly a In-Reply-To: line referenci=
ng
>> =C2=A0the Message-ID from the introductory mail (to get them threade=
d),
>> =C2=A0to each file; save and exit https://www.mirbsd.org/jupp.htm ^W=
the editor
>> =E2=91=A3 for a in 00*; do sendmail -oem -oi -t -f sender@mydomain.c=
om <"$a"; done
>
>"git send-email --to user@domain 00*"?

You conveniently cut off Item #1 above, which involves copying
the patches to a machine that can mail out.

>Does git send-email handle that correctly?

There is no way to handle 8bit correctly in SMTP, that does not
involve converting them to QP or Base64.

>It will not use base64, as that's rejected by vger.kernel.org.

Interesting. How are QP encoded patches handled (other than,
what I assume, spit from Linux developers)?

Honestly, the requirement to mail patches inline and not MIME
encoded reminds me of my time trying to contribute to OpenBSD
(before that ended due to personal, not technical, issues),
where the lead developers used non-MIME mailx(1) to read mails=E2=80=A6
I think accepting an encoded mail (not necessarily multipart,
i.e. =E2=80=9Cattachment=E2=80=9D, but to put it through the SMTP path)=
 and
decoding it in the =E2=80=9Cgit am=E2=80=9D part should be possible.

bye,
//mirabilos
--=20
13:37=E2=8E=9C=C2=ABNatureshadow=C2=BB Deep inside, I hate mirabilos. I=
 mean, he's a good
guy. But he's always right! In every fsckin' situation, he's right. Eve=
n
with his deeply perverted taste in software and borked ambition towards
broken OSes - in the end, he's damn right about it :(! [=E2=80=A6] work=
s in mksh
