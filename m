Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99117C4707E
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Apr 2022 21:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387115AbiDDVka (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380676AbiDDU6u (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Apr 2022 16:58:50 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B9E530F77
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Apr 2022 13:56:49 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id r13so22537835ejd.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr 2022 13:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bVlKvULZm2JgZ5AGytzLrLB0CSLrK0ggDRTo65+yxyA=;
        b=ku1Mni2YP6skEb4UzKwM1qgc933zwKLIlMM21YZAd7k4Ios0mzpOc/rIaiQVjhFQSY
         G+txssoqd3A6QKy5AZVACJTlGPSO1le+tQYos/vc/E2PB8bCCueGVPQ5Scvt5bZZ0s2f
         I52BoNzvPo67Aqv6eXqqyFzU1vQDqrs2VWVcVapC6o/pGzwkb1H3txizNNHwVD4d6ScG
         2eIDS0ScxBnD2FZzrF1d1lKbTPDJ8/l3KKd8gewI19+L9UviMfXxa0WaQTj9+PHYcB7I
         7cJb+/UH9X0jvg07Ut3LmEkLNSOS7IFE/S9dHP7d26coaZhJq40PwzaU1UKeGEFNTonV
         YiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bVlKvULZm2JgZ5AGytzLrLB0CSLrK0ggDRTo65+yxyA=;
        b=6XQgYxf8mt+LzfFjYe2XRYjeRmcaST0q2Le73/kLwkM+u79Wo2bPCwrr4QfJagiOBC
         LvcvlbuS8p9hDvebNyHSmDJpji5R8teiTk9kczVDXQfHlEZtR+ws0V23vRHowW2Vcosm
         LW//D+42eW8wcxl+IhWIa12hznXprZyo8nDicdhYxek4RMyV0c86+k3hwdmFYqljnsPg
         iBLtkIc0cUFWwmziRJk93rPk0QFOhHPrXBEa2CGpXC66jmCid7RvKStxYchLVNCw6pH1
         cfOHERf1RiaLytkF6HmLTg+jP+5bwqActNp6FdjkgC5WG+ntjRaXuL4hWZDqyR5Ry3fW
         kX5g==
X-Gm-Message-State: AOAM530slmpb21iDHt4lH+4Au3lMd9ueSxoxbEERcvp735BAS/fW3Sjw
        GS6JtKm6nddQDDdZsR8wtdMq0k/n3q0Ca4TO8fM=
X-Google-Smtp-Source: ABdhPJxR6ykDRFXeBPhlCfq09GQEDxUi37N3Qk4mgFJMv7QLL7sMtSVvzSM8nSllVj9W6nUE0impfg7PMyukPyB4+IQ=
X-Received: by 2002:a17:906:f75a:b0:6e6:e3f1:c946 with SMTP id
 jp26-20020a170906f75a00b006e6e3f1c946mr67964ejb.676.1649105807881; Mon, 04
 Apr 2022 13:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org> <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org> <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMo8BfKgn0T5RtUTb89fPvygNJJYLy7r1=RZTmTTm=jiDfx1hQ@mail.gmail.com>
 <CAK8P3a0J1--WSyWY+TptFa0nn5d-mOxapadCE1csGRkfhSPbVw@mail.gmail.com>
 <CAMo8BfLT8vMw3aGQPs1+9ry7W63SQphmDc4Tt4A3JvADHJhxiQ@mail.gmail.com>
 <CAK8P3a3iFb+ZacZ40d8PC_xcJpLVFXT0Qc-oYEZNkFqXdsfNZw@mail.gmail.com> <CAK8P3a1goN3c772xiFtz13kHZs0XEDSxfXX=ub7OH3S98Mddsw@mail.gmail.com>
In-Reply-To: <CAK8P3a1goN3c772xiFtz13kHZs0XEDSxfXX=ub7OH3S98Mddsw@mail.gmail.com>
From:   Max Filippov <jcmvbkbc@gmail.com>
Date:   Mon, 4 Apr 2022 13:56:36 -0700
Message-ID: <CAMo8BfJ5oqq3DXGf31uy8ab01EXqfzsO8hA2Tia=F1fBGiznKw@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Apr 4, 2022 at 12:44 PM Arnd Bergmann <arnd@arndb.de> wrote:
> Let me know if I need to enable additional options to get a compiler
> that works for all xtensa targets. Usually the --enable-targets=all
> is meant to be sufficient.

This is not possible with the current design of the xtensa toolchain port.
There's an effort to make switching between the core configurations easy
(without the whole toolchain rebuild:
 https://github.com/jcmvbkbc/xtensa-dynconfig
 https://github.com/jcmvbkbc/gcc-xtensa/tree/xtensa-dynconfig
 https://github.com/jcmvbkbc/binutils-gdb-xtensa/tree/xtensa-plugin-env ),
but it still involves building plugins for the parts of the toolchain
for each new xtensa core.

-- 
Thanks.
-- Max
