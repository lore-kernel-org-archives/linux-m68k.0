From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: 68000 patches (Atari ST platform)
Date: Fri, 16 Sep 2011 13:06:26 +1200
Message-ID: <CAOmrzkKX7SjVfT4f4yg+t1JmcumNCTNS5m87-b-92gaQsNRKnA@mail.gmail.com>
References: <20110911230920.GA1541@matze-K8NF4G-SATA2>
	<CAOmrzk+sqAzh48zXOKQ06iRhceJMTZvPJiDDTASgmT1Qv1B-7Q@mail.gmail.com>
	<loom.20110915T134159-512@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:33585 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750868Ab1IPBG1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 15 Sep 2011 21:06:27 -0400
Received: by ywb5 with SMTP id 5so2605906ywb.19
        for <linux-m68k@vger.kernel.org>; Thu, 15 Sep 2011 18:06:26 -0700 (PDT)
In-Reply-To: <loom.20110915T134159-512@post.gmane.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

Hi Thorsten,

>
> Ah, there they are ;) I=92ve NMU=92d the m68k bootstraps (Atari, Amig=
a, VMS,

I don't think VMS was m68k based :-) VME is what we have.

> Mac except where shared with macppc) in Debian to get their source up=
loaded
> to unreleased (since they were removed from unstable), and wondered a=
bout
> them. (And the packaging is positively ancient, understandably.)

The code doesn't change very fast if at all so the packaging doesn't
need to. Actually there was one thing I wanted to try with ataboot:
make it report the FastRAM chunk before the ST-RAM one if we were to
place the kernel in FastRAM. Never got the cross compiler setup sorted
out.

> I could host them (I love CVS, after all, *and* I maintain CVS in Deb=
ian,
> and use it a lot in BSD=85) if you want, and can arrange for commit a=
ccess
> for selected people (tell me whom, and I need a PGP trust path) inclu=
ding
> mails (with or (default) without diffs sent inline). I can put it on =
my
> box at home (P-233MMX with an actual Hercules Graphics Card, behind A=
DSL)
> or put a separate repo on another box, whatever is your preference.

Geert has a git clone of the repo so it could be either CVS or git. I
don't mind either way - a home box would be OK, we just need to make
sure cvs.linux-m68k points that way.

Cheers,

  Michael
