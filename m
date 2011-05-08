From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Debian kernel 2.6.38-5
Date: Sun, 8 May 2011 12:58:10 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:34168 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752746Ab1EHNGO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 May 2011 09:06:14 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5.Beta0/8.14.5.Beta0) with ESMTP id p48CwCOg021725
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Sun, 8 May 2011 12:58:16 GMT
In-Reply-To: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>  1. The critical bugfixes will go in via v2.6.38-stable anyway,
>  2. The ARAnyM/NatFeat support will be in v2.6.39, which may be a
>sufficiently convincing argument for the Debian Kernel Team to accept
>it in Debian's v2.6.38,

Good news: one of my ARAnyMs will be compiling kernels for the next
full week or so, I think (CPU power provided by Thomas Goirand this
time, the other VMs run on boxen at tarent GmbH, if someone is in-
terested):

=E2=80=A2 Accepted linux-2.6 2.6.38-5 (source all i386) Ben Hutchings
http://lists.debian.org/debian-devel-changes/2011/05/msg00736.html

>  3. If there's anything left that you really need, please tell us, so
>"we" can get it in a good shape for v2.6.40.

Bad news: Christian T. Steigies has problems on real Amiga hardware:

> However, the current (TLS) kernels have problems with the ariadne2 ne=
twork
> card, which, I think all Amigas here but crest have (ariadne1 in cres=
t).
> I get error messages like this with 2.6.32 and 2.6.38
>
>  eth0: mismatched read page pointers 4f vs 4c.

Does that ring a bell anywhere? That=E2=80=99s running 2.6.38-4 plus
my patches, I think, so I expect 2.6.38-5 won=E2=80=99t change this.

bye,
//mirabilos
--=20
If Harry Potter gets a splitting headache in his scar
when he=E2=80=99s near Tom Riddle (aka Voldemort),
does Tom get pain in the arse when Harry is near him?
	-- me, wondering why it=E2=80=99s not Jerry Potter=E2=80=A6=E2=80=A6=E2=
=80=A6
