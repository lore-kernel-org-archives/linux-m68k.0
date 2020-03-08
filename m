Return-Path: <SRS0=b3SA=4Z=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FEFC10DCE
	for <linux-m68k@archiver.kernel.org>; Sun,  8 Mar 2020 10:36:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 988962072A
	for <linux-m68k@archiver.kernel.org>; Sun,  8 Mar 2020 10:36:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgCHKgb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 8 Mar 2020 06:36:31 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40726 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgCHKga (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 8 Mar 2020 06:36:30 -0400
Received: by mail-oi1-f194.google.com with SMTP id y71so1902937oia.7
        for <linux-m68k@lists.linux-m68k.org>; Sun, 08 Mar 2020 03:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ALocsRugLESrfqaeY7o9fk9Y9WY+G+T4XXSyz17qGNc=;
        b=KhDo809PbtTrbVheJiPGmEP2K1CrfbeGMA18nJOK9Vk/YMLqvvEO2NzgOrIl1UTEHt
         aBsZRx3iEvOBpoCdbXYH0zeXIXbSCEvrXkGzlPJLg74i41EAoLOvahvZMFGRauCPX6gI
         7egFwUdJBsEQAxG6DMSa5ThVf7SOIymolmuwT5rwEIMPqMaMu1KZjO/ygQoGT8uEkQH/
         yKY1ql6qKrbR82SeiPu/1L+bAKFSAa0sD6xa8PIFcRx2NNqUSthIWUhxhiFvcqL56d6R
         VjZtQoQkhF0tt1KU5Thw+veea34qlsGyCeYNm/HPaUifiFkqEM304Qc4o8yyqeu9okxZ
         LgaQ==
X-Gm-Message-State: ANhLgQ00fpFa3XlQR6Ff4TPolHV6YiB2GF+RE9HbU1+UCplhA/8NFnQH
        mj66L/ohPzO24hPCrp5vRkYETYnQ0Dk7fNF7J/M=
X-Google-Smtp-Source: ADFU+vuxA+3UlakFkepcHa8KeTe6SwkUdLC8QlU1h4aLR+ZxzZEGyJqNvkWXED0LRNgJbQXeaPb6jlludWZpK7nb+ss=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr7822346oig.153.1583663788706;
 Sun, 08 Mar 2020 03:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <2bde25bc-ce82-8442-92ae-629aaac91935@physik.fu-berlin.de>
In-Reply-To: <2bde25bc-ce82-8442-92ae-629aaac91935@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 8 Mar 2020 11:36:16 +0100
Message-ID: <CAMuHMdVN_v4bp7w2LhqXcnEE05BiswfimK=pVdep5=j31o-jbA@mail.gmail.com>
Subject: Re: BigRAMPlus seems to be detected now
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Sat, Mar 7, 2020 at 10:01 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> There is one user in the #debian-68k IRC channel who has tried installing Debian
> on his A4000 with a A3660 and a BigRAMPlus installed and while the user is currently
> running into problems with the kernel being stuck, to my surprise, the kernel seems
> to be able to use and detect the extra memory from the BigRAMPlus (see below).

Good!

> The kernel is reporting an address conflict though:
>
> [    6.140000] Zorro: Probing AutoConfig expansion devices: 3 devices
> [    6.150000]  zorro: Address space collision on device Zorro device 12128600 (Individual Computers) [??? 0x50000000-]

That is expected: the address space reported by the BRP Zorro device
is already in use, as it is part of system RAM. The message is harmless
in this case.

We could skip registering the resource if z->rom.er_Type & ERTF_MEMLIST,
which is a hint for AmigaOS to link the board's RAM into the free memory
list, but that may cause issues with Zorro II RAM excluded in a memfile.
So perhaps it's best to just skip printing that message if ERTF_MEMLIST
is set?

> The question whether the lock up is caused by the BRP. But since this Amiga has only
> 16 MB FAST RAM, the user hasn't tested to boot without the BRP yet.

Just booting the kernel with the BRP disabled (through a memfile, or
through mem=16M), would give very valuable information.
As well as trying to boot it with the BRP as primary memory (BRP first
in memfile) or sole memory (motherboard RAM disabled in memfile).

> I will dig out my BRP tomorrow and see if it's actually detected in my A4000
> as well with current kernel versions.

Looking forward to these results!
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
