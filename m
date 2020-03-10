Return-Path: <SRS0=jzol=43=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0438C10F27
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Mar 2020 08:15:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 802BA2253D
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Mar 2020 08:15:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgCJIPn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 10 Mar 2020 04:15:43 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46561 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgCJIPn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 10 Mar 2020 04:15:43 -0400
Received: by mail-ot1-f68.google.com with SMTP id 111so7967040oth.13
        for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Mar 2020 01:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rh3VwtD9eltK1LL5CCTznsLT5AcFtIFQeD9GoD/RaqQ=;
        b=OS7J2r0HXYgrj9gme7xICZq/moGrWjgp+JwRREt1v7p9EfLOvL+EHT3c1fioJIKPX+
         aP4NbAuiwhy815y6ItLA7HqaACc6k//24XGlsPanZvO6KnTFEswJwtZls706F/fVv87I
         Qf2lFLzBARuSIaNo54mZpic48+SEZjVzpFiffZf0wNO/+zCQi3Cnbf4rHtUtfL10qFvD
         R1V6cDHkVGxLAvfvOJHZqZXistrHtG4XLDnnd0By5AVqO0FqDDJfGGQIBZLqKUIMKOMD
         jsrotiktbegSUAE35QuXgCKOO92dtO39HFV/K6t3uVulEcCa01nnSCy7VEY+EgGdPNH6
         mFBg==
X-Gm-Message-State: ANhLgQ2m0SnNaa8QOERdjWMlMdGp7qQ965TKKYD95ku7Ev6csY5bpFxj
        PZ/3f5TSHBM6HbJW+LSC171sxYsMy3Y78kURQy8=
X-Google-Smtp-Source: ADFU+vsl59Wuvi47cmxdfsblZjyHTY3vpNtBrfRsbkw7I1rG8Cq8JlOTY2beDtXp4g0uiBEUPKjvJH9oLmUQLnGtrXA=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr16002250otk.145.1583828140403;
 Tue, 10 Mar 2020 01:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <2bde25bc-ce82-8442-92ae-629aaac91935@physik.fu-berlin.de>
 <CAMuHMdVN_v4bp7w2LhqXcnEE05BiswfimK=pVdep5=j31o-jbA@mail.gmail.com> <CABq5eXG6VdWxVCX3da3nkwJ_Cha34gK_D+X5MYpYxSh5cZWZAA@mail.gmail.com>
In-Reply-To: <CABq5eXG6VdWxVCX3da3nkwJ_Cha34gK_D+X5MYpYxSh5cZWZAA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Mar 2020 09:15:28 +0100
Message-ID: <CAMuHMdUCh8G3PGBMFoNn=c98kDbBW7501UuTeV+MnW+Jb7pqjw@mail.gmail.com>
Subject: Re: BigRAMPlus seems to be detected now
To:     Stefan Reinauer <stefan.k.reinauer@gmail.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Stefan,

On Tue, Mar 10, 2020 at 4:06 AM Stefan Reinauer
<stefan.k.reinauer@gmail.com> wrote:
> On Sun, Mar 8, 2020 at 3:43 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > As well as trying to boot it with the BRP as primary memory (BRP first
> > in memfile) or sole memory (motherboard RAM disabled in memfile).
>
> With BigramPlus as sole memory the system can't seem to deal with the
> initramfs (see log)

However, according to this log you have both enabled:

> On node 0 totalpages: 4096
>   DMA zone: 40 pages used for memmap
>   DMA zone: 0 pages reserved
>   DMA zone: 4096 pages, LIFO batch:0

16 MiB

> On node 1 totalpages: 65536
>   DMA zone: 640 pages used for memmap
>   DMA zone: 0 pages reserved
>   DMA zone: 65536 pages, LIFO batch:15

256 MiB

> SLUB: Unable to allocate memory from node 0
> SLUB: Allocating a useless per node structure in order to be able to continue
> SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=8

Probably the 16 MiB in the first chunk is too small to allocate
page tables from, especially if it contains the initramfs.

What happens if you put the BRP first in the memfile?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
