From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Tue, 1 Apr 2014 10:24:10 +1300
Message-ID: <CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
	<8761mvl3jb.fsf@igel.home>
	<CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com>
	<87a9c63x1c.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:53146 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751043AbaCaVYL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Mar 2014 17:24:11 -0400
Received: by mail-ob0-f181.google.com with SMTP id wp4so9698350obc.26
        for <linux-m68k@vger.kernel.org>; Mon, 31 Mar 2014 14:24:11 -0700 (PDT)
In-Reply-To: <87a9c63x1c.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, debian m68k <debian-68k@lists.debian.org>

Andreas,

do we know the size of the first memory chunk early enough in head.S?
Maybe it's time to increase INIT_MAPPED_SIZE at least in cases where
we know that there's more than 4 MB in the first memchunk ...

Cheers,

  Michael

On Tue, Apr 1, 2014 at 9:58 AM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> Michael Schmitz <schmitzmic@gmail.com> writes:
>
>> see attached. I may have disabled nfcon entirely - usually I use
>> parallel debug with ARAnyM.
>
> Thanks, with debug=par early printk is working.  So the problem is that
> kernel-in-FastRAM does not solve the kernel-too-big/FastRAM-too-big
> problem, since the page tables for the first node (== FastRAM) memory
> must still fit in INIT_MAPPED_SIZE (== 4Mb) - kernel-size.
>
> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
> "And now for something completely different."
