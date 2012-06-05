From: Thorsten Glaser <tg@mirbsd.org>
Subject: Re: [PATCH] [m68k] Atari: support for NetUSBee register access to isp116x.h
Date: Tue, 5 Jun 2012 15:51:39 +0000 (UTC)
Message-ID: <loom.20120605T174709-209@post.gmane.org>
References: <CAOmrzkL4BNWr6aLijfpg91m8VKU4A0DRsx1mjOa22qWPrysqtQ@mail.gmail.com> <CAMuHMdWpW5aPKasazs2yJX8BZv2F_KXreSAY3+_kXGUqGZVJEw@mail.gmail.com> <CAOmrzk+2bYgDNtcW6DVy4WYT2i+07n8xR4bbNbwFJ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:41665 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753746Ab2FEQFG (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 5 Jun 2012 12:05:06 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1SbwFk-00014X-Dn
	for linux-m68k@vger.kernel.org; Tue, 05 Jun 2012 18:05:04 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Tue, 05 Jun 2012 18:05:04 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Tue, 05 Jun 2012 18:05:04 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Michael Schmitz <schmitzmic <at> googlemail.com> writes:

> Which ones were affected? (Some were piped straight to sendmail while
> others used an e-mail client so I'd like to know what does actually
> work)

I found out that the following works reliably:

=E2=91=A0 scp/rsync files to a box I can mail from
=E2=91=A1 $EDITOR 00*
=E2=91=A2 Add a To: line, and possibly a In-Reply-To: line referencing
  the Message-ID from the introductory mail (to get them threaded),
  to each file; save and exit https://www.mirbsd.org/jupp.htm ^Wthe edi=
tor
=E2=91=A3 for a in 00*; do sendmail -oem -oi -t -f sender@mydomain.com =
<"$a"; done

!BUT!

This does only work if the patchfile does NOT contain any non-7bit
characters. (This has affected me in the past when writing commit
messages with =E2=80=9Ctypogra=E2=80=99phic=E2=80=9D marks, as I=E2=80=99=
m used to, nowadays.) There
is *no* reliable way to transport inline patches through SMTP when
either the commit message or the patches/the patch context contain
such characters, as the SMTP transport path is probably not 8-bit
transparent (may convert to QP or Base64, or strip bit7).

So, in case I ever need to send such mails because the n=C5=8Dn-7bit
part is in the patch (as opposed to the commit message), please
bear with me when I need to attach them to a regular eMail.

bye,
//mirabilos =E2=80=93 via GMane
