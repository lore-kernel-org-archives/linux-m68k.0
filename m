From: Thorsten Glaser <tg@debian.org>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible patch)
Date: Tue, 7 Feb 2012 22:13:31 +0000 (UTC)
Message-ID: <loom.20120207T231019-351@post.gmane.org>
References: <4F1C577D.3040908@sigon.net>	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>	<4F1EEBEF.4000400@sigon.net> <CAMuHMdWbQau3kS2-svDS705_PS4-0adCCvLvT=Af6VKKZfr+gA@mail.gmail.com> <4F2053C9.3090201@sigon.net> <97e6cf2ca60c81874f6ea82e8b4af158@localhost> <4F3181C6.8080805@sigon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:48840 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756915Ab2BGWNo (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 7 Feb 2012 17:13:44 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1RutIC-00029r-UJ
	for linux-m68k@vger.kernel.org; Tue, 07 Feb 2012 23:13:40 +0100
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Tue, 07 Feb 2012 23:13:40 +0100
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Tue, 07 Feb 2012 23:13:40 +0100
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Patrick Bottelberger <patrick.bottelberger <at> sigon.net> writes:

> Patrick Bottelberger schrieb:
> > Maybe it's the debian patches that get everything out of order, i'l=
l try
> > 3.1.10 vanilla, maybe that'll work.
> >  =20
> I compiled a vanilla 3.2.2 kernel tree without Debian patches and
> without adding -msoft-float and it runs. It seems one of the
> Debian-patches adds some floating-point-operations.

I don=E2=80=99t think so. 3.2.2 from Debian is looking good (3.2.4 buil=
ding),
but you MUST compile with -ffreestanding.

Can you try the 3.2.2 image from debian-ports or my repo
https://www.freewrt.org/~tg/debs68k/dists/sid/main/Upload/unstable/linu=
x-2.6/
and check whether that=E2=80=99s more buggy than vanilla? If so,
you=E2=80=99ve got bugs to report =E2=98=BA

Thanks,
//mirabilos
