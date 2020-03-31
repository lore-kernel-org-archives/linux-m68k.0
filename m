Return-Path: <SRS0=lrj2=5Q=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E743EC43331
	for <linux-m68k@archiver.kernel.org>; Tue, 31 Mar 2020 07:12:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C41B0206F6
	for <linux-m68k@archiver.kernel.org>; Tue, 31 Mar 2020 07:12:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgCaHM3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 31 Mar 2020 03:12:29 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42529 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgCaHM3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 31 Mar 2020 03:12:29 -0400
Received: by mail-ot1-f68.google.com with SMTP id z5so20756558oth.9
        for <linux-m68k@lists.linux-m68k.org>; Tue, 31 Mar 2020 00:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uk7pDFf4OJ/SfCsEm+dqXVOk4+D6YmmUT6C1znTIzgk=;
        b=gpu+YhdIpDr/+zdft8+k2EBFEfPMBdy0nBXpQYPSUzhXzf4njedxol5x7mvQi9zAcG
         Z4giMS2TwdnoezDlU1VFDlXn7GLcduuE84a0OexaF9iuDCG4JP6nIdWeLH1k7994SnZU
         GKYC+KYiHyMjZe0HBrtF0qVnOLWWO50GMtUlhD5MWlYP/xnp4+G73A0smUGeGR0PDLRN
         D7jeGxHpxndxDx5OMXO1ZsMuoyTQePaIcT7lZzoNOncMcFDywM70cbfmp9OnVMleLheI
         oUBgTtZ5Z9ldATimW/w2GTlionDIVtWvglLM1sTwAoYIRbO1qts1AlgldOhf21tHNewP
         tn2A==
X-Gm-Message-State: ANhLgQ1+yFhbeAQu6j6AjYyEm+BaSNkXf9pcCx4QHInlAPgsUVGzziri
        RgZ3IqskTusu0HRT8mtYvG0SajtMGKFqJfYJQlQ=
X-Google-Smtp-Source: ADFU+vtfpWc7zK/1g/c/0ZjuRXEBRIB9XmSK5Mt6yYXmA8bNZ3M8h4gs6MVFd6ez/g/vormgzgtHZtvhNrXOxTxm3e8=
X-Received: by 2002:a05:6830:15c2:: with SMTP id j2mr11353456otr.107.1585638748720;
 Tue, 31 Mar 2020 00:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <CABq5eXG0=2H7N-BvXftudRb9Jv=8Ybbw9T+=zKMw=nyawTEQWA@mail.gmail.com>
In-Reply-To: <CABq5eXG0=2H7N-BvXftudRb9Jv=8Ybbw9T+=zKMw=nyawTEQWA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 31 Mar 2020 09:12:17 +0200
Message-ID: <CAMuHMdWCr5kBAYfywvSosMDYp-U4TiUtmi+pZLStLzLatRguBg@mail.gmail.com>
Subject: Re: kernel memory corruption in private_data
To:     Stefan Reinauer <stefan.k.reinauer@gmail.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Stefan,

On Tue, Mar 31, 2020 at 8:07 AM Stefan Reinauer
<stefan.k.reinauer@gmail.com> wrote:
> My Linux system is now booting and I am trying to write a driver for
> the MNT ZZ9000 graphics card (and network adapter and USB port).

Happy to hear that!

> One of them is that my block device disk structure's private data gets
> partly overwritten (only the pointer to the structures that have the
> pointers to my ioremapped device memory:
>
> The pointer reads back as 0x13f484b9 (instead of e781c9cc where the
> struct really lives.
> (See code and log below: ZZ9000 log)

Sounds like the obfuscated pointer issue: %p does not print the real
pointer value, %px does.

Cfr. commit ad67b74d2469d9b8 ("printk: hash addresses printed with %p").

> [  329.480000] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [  329.500000] Unable to handle kernel NULL pointer dereference at
> virtual address 13f484b9

This pointer value is obfuscated.

The values below are un-obssucated.

> [  329.500000] Oops: 00000000
> [  329.500000] Modules linked in: 8250(O+) 8250_base(O) zz9000(O) affs
> ext4 crc16 mbcache jbd2 crc32c_generic ide_cd_mod cdrom ide_gd_me
> [  329.500000] PC: [<1088fb92>] io_serial_in+0x22/0x36 [8250_base]

Hence if you look at the code at 1088fb92, you can identify which registers
are used to do the bad access, and look up their values below.

Or remove the hashing from lib/vsprintf.c:__ptr_to_hashval() if you're
debugging all the time.

> [  329.500000] SR: 2714  SP: 15fb5dcc  a2: 0dcb1ac0
> [  329.500000] d0: 00000000    d1: ffffffff    d2: 00000000    d3: 0dca120a
> [  329.500000] d4: 10891ca4    d5: 0e192010    a0: 00000000    a1: 00000000
> [  329.500000] Process insmod (pid: 143, task=c63d20d6)
> [  329.500000] Frame format=4 fault addr=00000000 fslw=01450200
> [  329.500000] Stack from 0f50fd50:
> [  329.500000]         1089120a 10853338 00000001 00000000 0dca120a
> 0dd5ec7e 0e199140 00000013
> [  329.500000]         000007f8 10853338 0dd5ec00 10853178 002e247e
> 1085301c 001d6eb0 001d6ef8
> [  329.500000]         10853338 00000001 00000000 0dca120a 0013ce68
> 00051862 10853397 001d6d94
> [  329.500000]         0f50fe78 0dca1200 0e19aef0 0002f740 0f50fe78
> 0f50fdd8 0f50fe78 001e584c
> [  329.500000]         0dca120a 001e58b0 0dca120a 00000000 00000000
> 0013ce68 0e199140 00051862
> [  329.500000]         0e19aef0 1087935a 10853178 10853338 00000002
> 00000000 10879216 0e19aef0
> [  329.500000] Call Trace: [<1089120a>]
> serial8250_config_port+0x70/0x8d4 [8250_base]
> [  329.500000]  [<002e247e>] mutex_lock+0x0/0x34

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
