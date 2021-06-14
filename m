Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BEFC49360
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Jun 2021 02:06:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D34A76138C
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Jun 2021 02:06:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232287AbhFNCIF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Jun 2021 22:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232324AbhFNCIE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 13 Jun 2021 22:08:04 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789E6C061574
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Jun 2021 19:05:49 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id fy24-20020a17090b0218b029016c5a59021fso9153400pjb.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Jun 2021 19:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+U4GoEm12Mv2KWeNTFflh3iSMJxQvnIQYGnEBokeD3E=;
        b=bAhH8lpYP7l8LZwdKg5n4tzz+dADfCxOx1lDGRVuMMRc9dYcyt25Ixyes2Xr6G7IC9
         mfqt9HfSdeD3+s0RfqxaiJtfYK6DS4SM83//4OdzNK1JLLOmJfCycZrx0BNJB6dnKIQ3
         rU1NeM/syVD/5Y4VlJvwx4tJEJfBt93odbs4wxu6S9cXIP3nnpX4FO/0sUySL7C6vkJ1
         OoJQcYG8axVj/JnaG/QzNKmFDKgJKtVwzz1IuijO/PepMZ6JFiyuG3blM3h+vUlvDOHm
         7w7lLerUmE+wtEKzgHNOFs23F41k0r6Z2JKa3OG6nyoZPU6r41Xd5AZBkllpsWQFwfXD
         Ivzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+U4GoEm12Mv2KWeNTFflh3iSMJxQvnIQYGnEBokeD3E=;
        b=s6M470m7pGMXb6sE+XzOPue9yQBeYLq8s7iu/k21OzbZxtGoDoh++lyAPsbEUW0CAn
         QjffDT+UVxyloiFLhoVCnH2XxoqBD13e/nqVZiyku5Q5DtmAS2C5ilSqTL40FYACmzAL
         17x60eNmEHBLED/wwPpA9rjBmBN37FOoxRh5j4GBxfSQCTAG6CtCNTejeBCBOEMpDzzq
         ZEAGrAS720t2lNZgGKwhAvSY4cn4uGQ53zxk4+kPGdT2Z0VBu09g3JCRH0BKUhXdwqWl
         BfdM2/ZMd0+QhEOHYmgrIXVO0hN1HVvkGvwAxqj2f1jNbGekQmwLZNbzKLO6GuJXSv3w
         xQUA==
X-Gm-Message-State: AOAM533Fi070nmaX+2twQQAh0C7uPtU5HlDzzQ/LVO4BG1eW8KuiH8fs
        rwXNA4tPZ133JgZlCZ3MErU=
X-Google-Smtp-Source: ABdhPJzwdNr+8U0wqnwHYMkv0x+AhvzhZ3EaBdlAYetKQkdr5ik4N9gkI3C2OMLZ17iJ171cdE2x7g==
X-Received: by 2002:a17:902:bcc3:b029:11c:5ffb:61fb with SMTP id o3-20020a170902bcc3b029011c5ffb61fbmr215350pls.18.1623636348845;
        Sun, 13 Jun 2021 19:05:48 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:9034:3fbe:cf28:988a? ([2001:df0:0:200c:9034:3fbe:cf28:988a])
        by smtp.gmail.com with ESMTPSA id mr23sm10703299pjb.12.2021.06.13.19.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jun 2021 19:05:48 -0700 (PDT)
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     linux-arch <linux-arch@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Tejun Heo <tj@kernel.org>,
        Daniel Jacobowitz <drow@nevyn.them.org>,
        Kees Cook <keescook@chromium.org>
References: <87sg1p30a1.fsf@disp2133>
 <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133>
 <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133>
 <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
Date:   Mon, 14 Jun 2021 14:05:38 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

On 14/06/21 10:18 am, Linus Torvalds wrote:
> On Sun, Jun 13, 2021 at 2:55 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>> The alpha_switch_to will remove the extra registers from the stack and
>> then call ret which if I understand alpha assembly correctly is
>> equivalent to jumping to where $26 points.  Which is
>> ret_from_kernel_thread (as setup by copy_thread).
>>
>> Which leaves ret_from_kernel_thread and everything it calls without
>> the extra context saved on the stack.
> Uhhuh. Right you are, I think. It's been ages since I worked on that
> code and my alpha handbook is somewhere else, but yes, when
> alpha_switch_to() has context-switched to the new PCB state, it will
> then pop those registers in the new context and return.
>
> So we do set up the right stack frame for the worker thread, but as
> you point out, it then gets used up immediately when running. So by
> the time the IO worker thread calls get_signal(), it's no longer
> useful.
>
> How very annoying.
>
> The (obviously UNTESTED) patch might be something like the attached.
>
> I wouldn't be surprised if m68k has the exact same thing for the exact
> same reason, but I didn't check..

m68k is indeed similar, it has:

        if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
                 /* kernel thread */
                 memset(frame, 0, sizeof(struct fork_frame));
                 frame->regs.sr = PS_S;
                 frame->sw.a3 = usp; /* function */
                 frame->sw.d7 = arg;
                 frame->sw.retpc = (unsigned long)ret_from_kernel_thread;
                 p->thread.usp = 0;
                 return 0;
         }

so a similar patch should be possible.

Cheers,

     Michael



>
>                    Linus
