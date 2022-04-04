Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D34C433F5
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Apr 2022 13:07:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235838AbiDDNJV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Apr 2022 09:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbiDDNJU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Apr 2022 09:09:20 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55007338BF
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Apr 2022 06:07:24 -0700 (PDT)
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M3UlW-1naoSe2ZV4-000eug for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr
 2022 15:07:22 +0200
Received: by mail-wr1-f51.google.com with SMTP id k23so1858101wrd.8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr 2022 06:07:22 -0700 (PDT)
X-Gm-Message-State: AOAM531KHkvg9q0mTX8b1B8n+PP4DMOXVcY1bKUXg3WfYy8Fm7PWpivj
        6X+6oFh7fvgfUOOz0aLZDOGsYNqrny6nWyiRglU=
X-Google-Smtp-Source: ABdhPJw/K8sYYGcKUcFc4yTdlw9+SOONHXxVgL1yKBMYbeG+8L+jnCtk7Gvh9Q0ehBPBsNK344bb2OH5nTaXtmbK2/w=
X-Received: by 2002:adf:d081:0:b0:1ef:9378:b7cc with SMTP id
 y1-20020adfd081000000b001ef9378b7ccmr17503109wrh.407.1649077642251; Mon, 04
 Apr 2022 06:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org> <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
In-Reply-To: <YkmWh2tss8nXKqc5@infradead.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 4 Apr 2022 15:07:06 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
Message-ID: <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>, Max Filippov <jcmvbkbc@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6dNThVUABu8YsPYaU2QmkZheBmd5F62/swUkID1ViEa8W9JSQUu
 i4RuHD/0/2DmIPNuEowbIyKTnvOteH5YwKR/mxh+0G7En/4XuIAsTBc1X9uIp8OskpocgH4
 lWpqU7K24v1/0HgBdrbhxNXXXzPAXp1SXWbpQSD4y38xTjozoFmyFf5xloZYkoYrcX7a7SS
 iWwQUJYZK1jjx45XlWtaQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bwCWcyDiHxc=:CnwkvFanVHbUV1yPpbaX8X
 YBPfwKbmeBCpPg/JjG9DWwrTTG+IbgFGfbRDpmUKO3aZUi8Bo3SnnoZpVmB6wAZjT/qHOr8jF
 x8gmlgdgaLYwIcYK+nA0Tjn1l/fQugAaml1cpJnlApFBAknmQO4itxJ01MB2y3+tWkGOkW+ZK
 LDlmv5Uctf+8F2BhSJfxciq469/jDVDHfu2xgOXaaN61AWcygtKBmODhJBkbSmc91wSGKvKm3
 112mBk82tx2Gq/HwfYBk1IeLjJikz1EzGoULrcA/yWxBXaayoERDytTqd/uEblUSuTFalagqn
 xbNAvc8T+mssnh9CpIOrxKl8ZhC8NnIwJssF0Sc2hfmnfDnxBiDDhTUcIjVRJVq0pFsWOH+Gp
 1dRg8yAItI6KEI8Y7yNzYLWs+Xgs14IpkaGm7gX7gwYgHrsZNN6rjrccTrNfyBLzcSKsdN/lJ
 PuJ38Tb0jFbxDfttTYJj+ZMWmSP/FIZ3LaJHZhoLcqYWdYnElajQSoiIdsGJRxBPR7jQV60+K
 ysP6nqtYQgTF1m2DHCi0Q26dsV5h47Szg0lfjcJtEPnJGKCVvuzt+byqzDB+6exoKn2OJzZ8d
 niGq8j+HEpN8ydUyhtcYarRcKZp+ilq0DxS5g7Trbg8pM/gRl5ybWtitovYxDC9RP7HGZGoIv
 nEOZdeKkAqFMu35lTycJs0uaWwAguFz/qUYiu1iUfkQo45o/8CvLS+U2kQF0MFq/ltPM=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Apr 3, 2022 at 2:43 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Mar 08, 2022 at 09:19:16AM +0100, Arnd Bergmann wrote:
> > If there are no other objections, I'll just queue this up for 5.18 in
> > the asm-generic
> > tree along with the nds32 removal.
>
> So it is the last day of te merge window and arch/h8300 is till there.
> And checking nw the removal has also not made it to linux-next.  Looks
> like it is so stale that even the removal gets ignored :(

I was really hoping that someone else would at least comment.
I've queued it up now for 5.19.

Should we garbage-collect some of the other nommu platforms where
we're here? Some of them are just as stale:

1. xtensa nommu has does not compile in mainline and as far as I can
tell never did
   (there was https://github.com/jcmvbkbc/linux-xtensa/tree/xtensa-5.6-esp32,
which
   worked at some point, but I don't think there was enough interest
to get in merged)

2. arch/sh Hitachi/Renesas sh2 (non-j2) support appears to be in a similar state
    to h8300, I don't think anyone would miss it

8<----- This may we where we want to draw the line ----

3. arch/sh j2 support was added in 2016 and doesn't see a lot of
changes, but I think
    Rich still cares about it and wants to add J32 support (with MMU)
in the future

4. m68k Dragonball, Coldfire v2 and Coldfire v3 are just as obsolete as SH2 as
   hardware is concerned, but Greg Ungerer keeps maintaining it, along with the
   newer Coldfire v4 (with MMU)

5. K210 was added in 2020. I assume you still want to keep it.

7. Arm32 has several Cortex-M based platforms that are mainly kept for
    legacy users (in particular stm32) or educational value.


       Arnd
