From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: 68000 patches (Atari ST platform)
Date: Thu, 15 Sep 2011 11:45:13 +0000 (UTC)
Message-ID: <loom.20110915T134159-512@post.gmane.org>
References: <20110911230920.GA1541@matze-K8NF4G-SATA2> <CAOmrzk+sqAzh48zXOKQ06iRhceJMTZvPJiDDTASgmT1Qv1B-7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:58632 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933075Ab1IOLp1 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 15 Sep 2011 07:45:27 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1R4ANh-0000a9-0f
	for linux-m68k@vger.kernel.org; Thu, 15 Sep 2011 13:45:25 +0200
Received: from fb-n15-11.unbelievable-machine.net ([94.198.62.204])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Thu, 15 Sep 2011 13:45:25 +0200
Received: from tg by fb-n15-11.unbelievable-machine.net with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Thu, 15 Sep 2011 13:45:25 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Michael Schmitz <schmitzmic <at> googlemail.com> writes:

> ataboot used to be part of the m68k CVS on kullervo.debian.net but we
> have had to take kullervo offline half a year ago. Christian has
> rebuilt the system but we're still having trouble with the ethernet
> driver in 3.1 (sort of working on this). I'm sure we can clone the
> m68k CVS off kullervo and set it up somewhere else.

Ah, there they are ;) I=E2=80=99ve NMU=E2=80=99d the m68k bootstraps (A=
tari, Amiga, VMS,
Mac except where shared with macppc) in Debian to get their source uplo=
aded
to unreleased (since they were removed from unstable), and wondered abo=
ut
them. (And the packaging is positively ancient, understandably.)

I could host them (I love CVS, after all, *and* I maintain CVS in Debia=
n,
and use it a lot in BSD=E2=80=A6) if you want, and can arrange for comm=
it access
for selected people (tell me whom, and I need a PGP trust path) includi=
ng
mails (with or (default) without diffs sent inline). I can put it on my
box at home (P-233MMX with an actual Hercules Graphics Card, behind ADS=
L)
or put a separate repo on another box, whatever is your preference.

bye,
//mirabilos
