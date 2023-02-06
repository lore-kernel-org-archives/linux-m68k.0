Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDCAC05027
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Feb 2023 07:54:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjBFHya (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Feb 2023 02:54:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjBFHy3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Feb 2023 02:54:29 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6510918ABE
        for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Feb 2023 23:53:57 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id g8so11871953qtq.13
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Feb 2023 23:53:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhhucKV89Sl3cil8ZRCY6KFBlgYRP5EUrSkJocDKRgo=;
        b=DuJpvAeUk9RjBFX6O/ulqRFhhEgud099J/3qDiZpYDjzXjJ7mUKuzjCdDxZe6op/nS
         6cjUkT5AbMgxosfWWP0kTmD4ZOYd9y7qayj7h2P+LIt4jekZ6h+mjniYTzgFWrHUjiDE
         6So0J1s9yBvbtZFOHO+/cZKEEyPEBkamY1hRNPSiZXc2buUIO02a2We/zZHg2N0Njbxh
         l6bh46x+GuiD9BkI0WHr29u9rN8X2jSj1+kD1bpJInTEYQVMKkNukHtOrmIuSs2xCyuQ
         uwhe+SnkqawOwwxN9zyiVpkK1jNhjlIfsSJDlsor3OwY56ZhE2lHlCOxsgp0lZVGrGNq
         Iiog==
X-Gm-Message-State: AO0yUKUyAuvxsalSYksmwAhbkM2imyLDiJq7VnuOA08kcUMW3zIafYXp
        BuAgqrig7RdyR0T716eZzGJjeooYxk59pw==
X-Google-Smtp-Source: AK7set/XulPNUi1KOedJB+RmQJDZQUfwvxMd/dQ0ZXMadTUn0npFhxTk8FaAQGO5yVCGRURwbqqr7A==
X-Received: by 2002:a05:622a:108:b0:3b1:8ad7:b9fb with SMTP id u8-20020a05622a010800b003b18ad7b9fbmr19943935qtw.49.1675669957119;
        Sun, 05 Feb 2023 23:52:37 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id d23-20020ac800d7000000b003b8238114d9sm6778558qtg.12.2023.02.05.23.52.36
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 23:52:36 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id q4so8601300ybu.7
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Feb 2023 23:52:36 -0800 (PST)
X-Received: by 2002:a25:780e:0:b0:86e:9acc:1635 with SMTP id
 t14-20020a25780e000000b0086e9acc1635mr899546ybc.202.1675669956143; Sun, 05
 Feb 2023 23:52:36 -0800 (PST)
MIME-Version: 1.0
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <4a9c1d0d-07aa-792e-921f-237d5a30fc44@yahoo.com> <e7574759-4870-d554-dd63-17da220270f1@gmail.com>
 <af524ac9-f5af-e9fb-e33f-0884a0ebfcb6@yahoo.com> <667fa6a9-a760-2116-5f76-a01e078c8079@linux-m68k.org>
 <86badf6e-2cc8-1937-1a2f-45334bb338f4@yahoo.com> <fdb9fe86-4646-06fe-6d83-fde649922789@linux-m68k.org>
 <2bccc83c2417374fadeb65076a6dbe29a072a91d.camel@physik.fu-berlin.de> <8107e04f-fd60-c6e3-2bad-cc0d99877967@yahoo.com>
In-Reply-To: <8107e04f-fd60-c6e3-2bad-cc0d99877967@yahoo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Feb 2023 08:52:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtkr2zvZiJfLXvs9d_inJbktSNqQQfO1oxnJHZeoYcHg@mail.gmail.com>
Message-ID: <CAMuHMdUtkr2zvZiJfLXvs9d_inJbktSNqQQfO1oxnJHZeoYcHg@mail.gmail.com>
Subject: Re: Debian initramfs/initrd, was Re: stack smashing detected
To:     Stan Johnson <userm57@yahoo.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Finn Thain <fthain@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        debian-68k@lists.debian.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Stan,

On Mon, Feb 6, 2023 at 4:42 AM Stan Johnson <userm57@yahoo.com> wrote:
> On an SE/30 with 128 MiB memory, the latest Debian SID kernel
> (vmlinux-6.1.0-2-m68k), using Debian SID modules, and with
> initrd-6.1.0-2-m68k built on the SE/30, hangs after the initial
> "ABCFGHIJK" (I tried it twice).

If you get to "K", you're almost at the end of arch/m68k/kernel/head.S,
and it is very likely the kernel C-code actually started.
Do you get any output using "debug earlyprintk" on the kernel command
line?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
