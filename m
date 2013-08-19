From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] m68k: handle Atari interrupts in multi-platform kernels
Date: Mon, 19 Aug 2013 20:17:05 +1200
Message-ID: <e4fb41650bb91f3e148195be63834bef@gmail.com>
References: <201308092135.r79LZwL1013105@herc.mirbsd.org> <Pine.BSM.4.64L.1308092147300.28970@herc.mirbsd.org> <f853f42622f9fd3b1f832a3b2b1d04ae@biophys.uni-duesseldorf.de> <Pine.BSM.4.64L.1308130810460.20692@herc.mirbsd.org> <8612ec946622122a048ec3805a30fef5@biophys.uni-duesseldorf.de> <CAMuHMdXZb4RWKxxzLZpnzmYN02EaeqQJ9X0QHH6ty9sL_7P=bg@mail.gmail.com> <Pine.BSM.4.64L.1308131039210.1920@herc.mirbsd.org> <52101C34.8060404@gmail.com> <Pine.BSM.4.64L.1308180059420.18148@herc.mirbsd.org> <52108D28.1010405@gmail.com> <Pine.BSM.4.64L.1308180934140.2593@herc.mirbsd.org>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:61812 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750768Ab3HSIRU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 19 Aug 2013 04:17:20 -0400
Received: by mail-pa0-f54.google.com with SMTP id kx10so4336964pab.27
        for <linux-m68k@vger.kernel.org>; Mon, 19 Aug 2013 01:17:20 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1308180934140.2593@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, debian-68k@lists.debian.org

Hello Thorsten,

> Michael Schmitz dixit:
>
>> Sorry, that one's unparseable on any Linux system I have access to.
>> When did Debian switch to xz as compressor in archives?
>
> Support for it was in squeeze, and first packages begun to
> use it shortly afterwards, so for years. I think I even saw
> it being used before squeeze, for leaf packages such as -dbg
> ones or those with huge data.

I must admit I'm using Ubuntu LTS releases mostly, so 'years' might be 
the right ballpark.

> On the other hand, to actually *boot* a system successfully
> with this kernel you need an initrd, which requires a system
> up to date as of roughly end of 2012, anyway (due to the
> initramfs-tools package and the versions of the packages
> that are actually needed to be put *on* the initrd, and due
> to the initrd being expected to be xz IIRC). So I'm afraid
> you need to boot into at least Linux 3.2 first - images are
> at http://snapshot.debian.org/package/linux/3.2.35-2/ and
> also require xz to unpack already, but that can be done on
> any Unix box (even BSD) using ar and tar; those are mostly
> monolithic and don't require an initrd to boot - then to
> dist-upgrade your system to latest unstable, at which point
> you can apt-get install the 3.10 kernel.

I assumed the initrd was pre-built and included in the package. Silly 
of me.

Much easier to integrate the patch in question into my 3.10 git tree.

Thanks,

	Michael


>
> bye,
> //mirabilos
> -- 
>> Hi, does anyone sell openbsd stickers by themselves and not packaged
>> with other products?
> No, the only way I've seen them sold is for $40 with a free OpenBSD CD.
> 	-- Haroon Khalid and Steve Shockley in gmane.os.openbsd.misc
