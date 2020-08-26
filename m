Return-Path: <SRS0=i6Xs=CE=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0ECC433DF
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 11:26:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F17442083B
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 11:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgHZLYR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Aug 2020 07:24:17 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44030 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728802AbgHZLXw (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 26 Aug 2020 07:23:52 -0400
Received: by mail-ot1-f67.google.com with SMTP id l13so1174192otp.10
        for <linux-m68k@vger.kernel.org>; Wed, 26 Aug 2020 04:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=09BGJRpZ2MEQrqNfJL3Y2xod6Eolz3t+8Hh99Kr2xIY=;
        b=P4SZN9WC7sPrKGI4GSkvv/rZyptxmcZ3S+0XtilUK28yuFIgmnO5wha8sZjl8QPymX
         ZnHqhv/cj/QIgXyzyMGlBNw2wi2GMFQtgOrTzDt/Q9J+eK24q++NXpfD0ZH3wq9SGth+
         Zk6Py6IuyWSniR2sqpic0+/3fIObIKaJhUtH6SO50C4mH6K64gzxNBQTuBuCY6wdpz3U
         I4opocC2XS6vkp0DnEcZ1wzjg26gaK24YC1szDVgDKOh8Fauq/y/Zz0Q226aKD3rNtuY
         oVt4FapyBAx/lkESMjYw11ySHMxypZpmredvuUD4LDowO0zvVTY6xQfDaXbdeuJYQyF4
         k2cA==
X-Gm-Message-State: AOAM533nAGqgBDYu7CmJZdnmhGXHjMzuY0quzWY0gyZVNPpeiAS0FI4r
        15EFRruZhlho9pgddWfbt29trRR1giqeJttuvyA=
X-Google-Smtp-Source: ABdhPJztF/O3k1IVw5bqIJdskX3oHSMpr5aRQ5JeI9N4r5RtKaiJGXpdrpzNNjYpejMzQW2wlVSx/j6V/6S7d8/bj2w=
X-Received: by 2002:a9d:32e5:: with SMTP id u92mr8928333otb.107.1598441031897;
 Wed, 26 Aug 2020 04:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de> <1595823555-11103-1-git-send-email-schmitzmic@gmail.com>
In-Reply-To: <1595823555-11103-1-git-send-email-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Aug 2020 13:23:40 +0200
Message-ID: <CAMuHMdVNqgG_6LSSuzMZekE1q7i_V4YisDJQUsjptLDejNGaRw@mail.gmail.com>
Subject: Re: [PATCH] m68k/kernel - wire up syscall_trace_enter/leave for m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Mon, Jul 27, 2020 at 6:19 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> m68k (other than Coldfire) uses syscall_trace for both trace entry
> and trace exit. Seccomp support requires separate entry points for
> trace entry and exit which are already provided for Coldfire.
>
> Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
> in preparation for seccomp support. Check return code of
> syscall_trace_enter(), and skip syscall if nonzero. Return code
> will be left at what had been set by by ptrace or seccomp.
>
> No regression seen in testing with strace on ARAnyM.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Thanks for your patch!

> Changes from RFC v1:
>
> - add return code check in do_trace_entry branch to enable syscall
>   filtering (will return -EPERM)
> - change to use testl for return code check (suggested by Andreas Schwab)
>
> Changes from RFC v2:
>
> - don't set return code of filtered syscall - seccomp may want to set
>   that for use by calling process.

As your email subject didn't contain "v3", b4[*] insists on picking up
RFC v2, and refuses to pick up the latest version, even when forced
(msgid not present)...

The patch itself looks good to me. Does it make sense to apply it before
we have real seccomp support?

[*] https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
