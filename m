Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E986C49361
	for <linux-m68k@archiver.kernel.org>; Sat, 19 Jun 2021 02:17:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DF7361184
	for <linux-m68k@archiver.kernel.org>; Sat, 19 Jun 2021 02:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235543AbhFSCTl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 18 Jun 2021 22:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235500AbhFSCTi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 18 Jun 2021 22:19:38 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B14C06175F
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Jun 2021 19:17:25 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id z26so9115643pfj.5
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Jun 2021 19:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=e4DB3o74a84xyzv+F58mWak5ZIBVKPGvUjIOnua/xDM=;
        b=f5bW50XIwU5uYdtY7CnuL5lJohpg8emnxifiv5R8ftJjzkNKrebUaTM/TLYo/cQ3Hs
         0zr2h+95U4z6wQbIlwH67wmkOxBTFB7QZ27v6H0tyxynKrV7/UsF0pTSF+2aRwGrELTb
         y7m/u1pTnTY8EXCO2/e6bzgJHQNx5PacZTHRBEgrQKEvRRBpQPAyzMpSwz/BbYEGoQtE
         uxV2N+gn13WqCrf96IMSxVEIblyjJ1hdQ2fxKop0UATn0D1WwUVx2TcwrZqU/zEY0Szc
         7KQOV282sxPvJAJxf8YRDogIZBVCH/n81YtsIwQtSqAPV7OIqyD/pCPhGEiy5g333cyj
         /B4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=e4DB3o74a84xyzv+F58mWak5ZIBVKPGvUjIOnua/xDM=;
        b=kuha1Yb0o0m5MRCHgvTGd4vHfA0QQfBQPCGodKEvISlCo4XVdrEeNYmis/wKbTnANG
         BIy5CztCA7e+P2zZHSfybGWt4S90rP4+8xxa9SbUmh5YdP6xoRPJeFngUp2qDAT/h/zD
         s0cFb/OiYY/l3fxqEnNqwENaL2laayUGf4eZyES9gn3lhcES3ne/KN/KzBkXf42ITtR1
         O4kMWqaocGNkicElHYcgFWLJLvHJxE5opT/5BjAwhRfj42auHZ/jNFgdwrhmDE/cAEnA
         InsjQjydHW62FardMfivtoeFCDvSWTP35O8omd4eBa2P01sREx7HCXMMaq//f8JS3VLv
         +w5w==
X-Gm-Message-State: AOAM532mBufguC+4KLc3sgjtAySWSxD3dgvBl+ngI5WXTIeFdlA4pCDK
        Ys23PghvbYcqnssmmyRS8KU=
X-Google-Smtp-Source: ABdhPJwYqzbmiGJc+M716hkkRLPt2L8WcKqr1/1Q6sZYAlVY/qu1RICs65uzLK8KtJa2KLCuJIa7vw==
X-Received: by 2002:aa7:8090:0:b029:300:18db:4e11 with SMTP id v16-20020aa780900000b029030018db4e11mr5998599pff.22.1624069044869;
        Fri, 18 Jun 2021 19:17:24 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id x2sm9275150pfp.155.2021.06.18.19.17.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jun 2021 19:17:24 -0700 (PDT)
Subject: Re: [PATCH v2] m68k: save extra registers on more syscall entry
 points
To:     Linus Torvalds <torvalds@linux-foundation.org>
References: <1623979642-14983-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=whTKf6UFr6YneXsPU4=8dTs+eEX_861ugESTE3CmZtFUg@mail.gmail.com>
 <91865b90-c597-6119-5e14-dfe521a33489@gmail.com>
 <CAHk-=whjJappNkdsrmsRoA4QUiu0_NNqa9Y_ct0A21m2XT5+YA@mail.gmail.com>
 <2b2ba866-104c-afea-9c29-145e9d80c2d5@gmail.com>
 <CAHk-=wjFG7zfO7RXu8RUOkuRPE59-OuqzBFsH-Zk1ieSKYbrYA@mail.gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andreas Schwab <schwab@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <596b6fa5-a533-7c80-0138-5d0de756e707@gmail.com>
Date:   Sat, 19 Jun 2021 14:17:18 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjFG7zfO7RXu8RUOkuRPE59-OuqzBFsH-Zk1ieSKYbrYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

Am 19.06.2021 um 13:54 schrieb Linus Torvalds:
> On Fri, Jun 18, 2021 at 6:32 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>
>> *** FORMAT ERROR ***   FORMAT=0
>> Current process id is 1
>> BAD KERNEL TRAP: 00000000
>> Modules linked in:
>> PC: [<00002af0>] resume_userspace+0x14/0x16
>> SR: 2204  SP: (ptrval)  a2: 00000000
>> d0: 00000000    d1: 00000000    d2: 00000000    d3: 00000000
>> d4: 00000000    d5: 00000000    a0: 00000000    a1: 00000000
>
> Yeah, so that's presumably the rte that causes an exception due to
> garbage on the stack.
>
> The registers being zero at that point is actually expected, so that's
> not much of a hint. But yeah, clearly I got some stack initialization
> offset or something wrong there, and I don't know modern m68k nearly
> well enough to even guess where I screwed up.

It might have been me screwing up - I hand applied the patch on top of 
my last one and fat fingered one bit (forgot to remove the addql #4,sp@ 
I had added before the switch stack save).

With the patch correctly applied, I get this dump:

Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
CPU: 0 PID: 1 Comm: init Not tainted 5.13.0-rc1-atari-fpuemu-exitfix+ #1126
Stack from 0081be08:
         0081be08 003363d8 003363d8 002aebaa 000000ff 00000001 0002fa64 
00818a90
         0081a000 0000000b 0081be70 00028610 0032df62 0000000b 0000000b 
0002e0d2
         0002fa64 00000001 001a978c 0000000b 0081bf30 0081daf8 0081bf44 
00000000
         00000000 00000000 0081ec40 00029458 0000000b 0081a007 00030504 
0000000b
         00000000 00000000 00000000 00000000 00818550 00000000 0081bf90 
0081bf30
         00000000 0081bf68 00030066 0081da30 000042c4 0081bf30 00000000 
00000000
Call Trace: [<002aebaa>] panic+0xc0/0x282
  [<0002fa64>] do_signal_stop+0x0/0x14a
  [<00028610>] do_exit+0x152/0x6f4
  [<0002e0d2>] recalc_sigpending+0x0/0x1e
  [<0002fa64>] do_signal_stop+0x0/0x14a
  [<001a978c>] memcpy+0x0/0x88
  [<00029458>] do_group_exit+0x40/0x7e
  [<00030504>] get_signal+0x22c/0x510
  [<00030066>] force_sig_info_to_task+0x7e/0x8a
  [<000042c4>] do_notify_resume+0x3c/0x484
  [<000302b2>] force_sig_fault_to_task+0x30/0x3c
  [<000302d2>] force_sig_fault+0x14/0x1a
  [<00005eb8>] send_fault_sig+0x24/0x86
  [<00002b14>] do_signal_return+0x10/0x1a
  [<00007008>] atari_reset+0x90/0xbc
  [<0000c000>] clr_mant+0x8/0x14

No registers dumped at all - no idea how that happened.

I'll try your latest patch next ... bear with me, got a 9-year old 
chewing my ear off to entertain in between tests.

Cheers,

	Michael


>
>              Linus
>
