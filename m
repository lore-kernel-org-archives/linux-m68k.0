Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C281C4338F
	for <linux-m68k@archiver.kernel.org>; Sun, 25 Jul 2021 10:05:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4241160EB4
	for <linux-m68k@archiver.kernel.org>; Sun, 25 Jul 2021 10:05:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhGYJZI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 25 Jul 2021 05:25:08 -0400
Received: from mail-vk1-f175.google.com ([209.85.221.175]:44554 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbhGYJZI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 25 Jul 2021 05:25:08 -0400
Received: by mail-vk1-f175.google.com with SMTP id r2so1368372vkl.11
        for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Jul 2021 03:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XHyqWT5T8EnnHCYAwXfDHN6CTdT91ozwfA6Z/DQ/7N8=;
        b=CVCf0yQHqimdRieFX72QFcW7bt6PMI7hjjyE4aCRY4iJqeFIOQOM9mm9Nbz/5+ey17
         rKB4OT4Gs+2AKE9I7SjoN4IVHTFVxo/AYjnUkC+o6Lnc9wCGYja8cYdxHZVH+PwvS78A
         K2iycnfl4C7hfbkGwV0N8LFZhajGV2PLNCL6F6gYYAhKkdoduyRWoeTPg0KcVUIU2Up4
         zFvLxInfW7cChkXQKLeKPSDywMgJ1VPV/6eLyZnyhXiX4+r3k+MB7d/1NMsv4A0Kljvu
         FM2G3xG6yzPH+Ygr8NLohkTiT6QsLnNOOIm9AkcQbQI3h+DMhX8iwzbkegXB39axu8Um
         pZKQ==
X-Gm-Message-State: AOAM5329Cb86W5UW1haXhWQR1AWb//bWdJTZ8rUFJ5LE/DIcPWw+16YF
        kaB/cNmYAUUMaF2yOAuTIfAot2LtvpgR2s/dXwI=
X-Google-Smtp-Source: ABdhPJzQKq4M8f7Z5qDbOveUgVw3PiuXDpF00/PNMEaRAbyNIAhtUEl8Hf0fNN11BiGeW9PYKobK+69rnZDtrCXfnl8=
X-Received: by 2002:ac5:cd9b:: with SMTP id i27mr7805690vka.1.1627207537068;
 Sun, 25 Jul 2021 03:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <1624407696-20180-1-git-send-email-schmitzmic@gmail.com> <1624407696-20180-4-git-send-email-schmitzmic@gmail.com>
In-Reply-To: <1624407696-20180-4-git-send-email-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 25 Jul 2021 12:05:26 +0200
Message-ID: <CAMuHMdVA5d7z6awGrpJ+Tb3PRxz7Nczd_SLXZ=cAwsS8tFU_vg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] m68k: track syscalls being traced with shallow
 user context stack
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Linux-Arch <linux-arch@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Wed, Jun 23, 2021 at 2:21 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Add 'status' field to thread_info struct to hold syscall trace
> status info.
>
> Set flag bit in thread_info->status at syscall trace entry, clear
> flag bit on trace exit.
>
> Set another flag bit on entering syscall where the full stack
> frame has been saved. These flags can be checked whenever a
> syscall calls ptrace_stop().
>
> Check flag bits in get_reg()/put_reg() and prevent access to
> registers that are saved on the switch stack, in case the
> syscall did not actually save these registers on the switch
> stack.
>
> Tested on ARAnyM only - boots and survives running strace on a
> binary, nothing fancy.
>
> CC: Eric W. Biederman <ebiederm@xmission.com>
> CC: Linus Torvalds <torvalds@linux-foundation.org>
> CC: Andreas Schwab <schwab@linux-m68k.org>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Thanks for your patch!

> --- a/arch/m68k/kernel/entry.S
> +++ b/arch/m68k/kernel/entry.S
> @@ -51,75 +51,115 @@
>
>  .text
>  ENTRY(__sys_fork)
> +       movel   %curptr@(TASK_STACK),%a1
> +       orb     #TIS_SWITCH_STACK, %a1@(TINFO_STATUS+3)

This doesn't work on Coldfire:

arch/m68k/kernel/entry.S:55: Error: invalid instruction for this
architecture; needs 68000 or higher (68000 [68ec000, 68hc000, 68hc001,
68008, 68302, 68306, 68307, 68322, 68356], 68010, 68020 [68k,
68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32
[68330, 68331, 68332,
 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) --
statement `orb #(1<<1),%a1@(16+3)' ignored

>         SAVE_SWITCH_STACK
>         jbsr    sys_fork
>         lea     %sp@(24),%sp
> +       movel   %curptr@(TASK_STACK),%a1
> +       andb    #TIS_NO_SWITCH_STACK, %a1@(TINFO_STATUS+3)

arch/m68k/kernel/entry.S:60: Error: invalid instruction for this
architecture; needs 68000 or higher (68000 [68ec000, 68hc000, 68hc001,
68008, 68302, 68306, 68307, 68322, 68356], 68010, 68020 [68k,
68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32
[68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349,
68360], fidoa [fido]) -- statement `andb #(~((1<<1))),%a1@(16+3)'
ignored

>         rts

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
