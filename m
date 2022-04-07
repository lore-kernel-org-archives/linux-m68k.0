Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16148C4332F
	for <linux-m68k@archiver.kernel.org>; Thu,  7 Apr 2022 07:17:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241670AbiDGHTi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 7 Apr 2022 03:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241679AbiDGHTe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 7 Apr 2022 03:19:34 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302511B6954
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Apr 2022 00:17:34 -0700 (PDT)
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M89bP-1ngTGg1FWV-005Lsq for <linux-m68k@lists.linux-m68k.org>; Thu, 07 Apr
 2022 09:17:33 +0200
Received: by mail-wr1-f50.google.com with SMTP id j12so6448827wrb.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 07 Apr 2022 00:17:33 -0700 (PDT)
X-Gm-Message-State: AOAM532LlF+WS2psXlGZCn1B/Yy3OlGd+OMETmfc+8khsqnMg9q0DDlX
        R/I4JsDhLzV+0N4TG14HbqJtGpdqbSbqP1hDJsE=
X-Google-Smtp-Source: ABdhPJwmNfPDNFMCTxQF72bGloQ9R7ixTS1WuENFc4sxAk/2DHt8y1oYiTEoK7GHAg/mvQl2A58Tcb9T0D1qJhBrXSI=
X-Received: by 2002:a5d:6505:0:b0:205:9a98:e184 with SMTP id
 x5-20020a5d6505000000b002059a98e184mr8948149wru.317.1649315852910; Thu, 07
 Apr 2022 00:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org> <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org> <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMuHMdWcg+171ggdVC4gwbQ=RUf+cYrX3o9uSpDxo-XXEJ5Qgw@mail.gmail.com> <c3e7ee64-68fc-ed53-4a90-9f9296583d7c@landley.net>
In-Reply-To: <c3e7ee64-68fc-ed53-4a90-9f9296583d7c@landley.net>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 7 Apr 2022 09:17:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a14b6djqPw8Dea5uW2PPEABbe0pNXV5EX0529oDrW1ZAg@mail.gmail.com>
Message-ID: <CAK8P3a14b6djqPw8Dea5uW2PPEABbe0pNXV5EX0529oDrW1ZAg@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To:     Rob Landley <rob@landley.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Christoph Hellwig <hch@infradead.org>,
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
        linux-riscv <linux-riscv@lists.infradead.org>,
        Rich Felker <dalias@libc.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2D++nRaDkTdMLHSAYQCZSvQ9OQ5Q9A1xI9VQNOjHwTAqK8BUqPo
 Do/hQ3tdBQgwxrM118Fg5T29/4sngF60nLDs2BHWIeL/YzvaiKC34ZWAtyXIYNTRok741S7
 Vl4smDm2j0spCaFwab7mY9j0l/hEIUuInlBM7rkQMBd3HF4fa67afWlCkdx+jpuq3/BKZFF
 N9793n2YLtMs8i01c7HIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SmjPkQnFAwM=:bjK/MMIaHXTxhAcVqK3/yv
 grXedsCoKJxL/l/anAzHBWvfnb9XiO5Wwr802F4k3W0ztgHiGutzNQL3kCEzvuR+1ZeZNV33A
 Rfr/2R9h5LNVDIKmcdMQ1FOD6vZWMhxC94FwnMs5f44xtCmAX8278HW0jb8/vWQXN4/Dk6vg3
 cHyUpOL7D4NNfsXU/GWLtWaHkN4EU9rAhueGwXQWECKQSjTeeBL5HlU/HXOt+91HOc9L/v6/a
 SzxMgmwAHb+xecWXkbwXnA8BkQscpHXuSbsrlzf1BbDaaiNxUd4b0cCkHxHnEcqg1zNjHWhhu
 +aQy7vlqU5hdize0LSENjIQDjiTBJMdyVySI1pZQdmpHYtFBDEB2EZjorpWYeJvZT6YLV9Yfs
 ElT1KP5DMkJUyFar2hLz4SQZ6EPquB4iyFEVhXv7QOZZleiftygcxajpcc7zKh6yIV7adNKig
 T+51HQjDeGl/S5+Ja7JvXjCbLuN+Wcre74malQsodC2PaNLGojZ5Nb2jmludPz7SsmXxM/C6V
 I1aXu1rlST9Iu1c6YKLgWpQ9EQcEBNZKDHz0MnLTu3JMApG3Z/SVi3m75+qccg2cu5u14g1bl
 lCFccT14zG4e/76eD1adk4ORzxZRbGh6b9awFhwjWiWA2R2TKjlqH0puub1tQZdREZZy7U6Wf
 pNoscE3aCrzzRFo8ayvWbnAv8EB4/It4vBQ1OvsbJ7HAJAzJ5ccfp49HCFmEdSxZ14O/toZiK
 HGaGu3nVeVhXWiTRSzbDRFISY7aCBOxdEjl8tET6EOXyzv9esWqURjx4GfZDpeh2zPtcBYMIc
 giGBuuhljMlzG+3VLR/v3S+bd9XdsvJMBnB8ga25q0S5XXywBI=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Apr 6, 2022 at 11:25 PM Rob Landley <rob@landley.net> wrote:

> I'm interested in H8300 because it's a tiny architecture (under 6k lines total,
> in 93 files) and thus a good way to see what a minimal Linux port looks like. If
> somebody would like to suggest a different one for that...

Anything that is maintained is usually a better example, and it helps when the
code is not old enough to have accumulated a lot of historic baggage.

The arch/riscv/ code is generally a good example base for others to copy.
It's not nearly as small, but that is mostly because it implements optional
features that could be left out. csky is a smaller example that is also
fairly clean and new, but less featureful.

         Arnd
