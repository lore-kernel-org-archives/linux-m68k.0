Return-Path: <SRS0=aPjp=D6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E10FC388F7
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 00:11:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A91A624654
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 00:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603411889;
	bh=FC93QkvyPmtHB+9fENtpkozml3bMeqM4lIv7OZSkZn4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=FkcLWDHOlUUFAGq+/xvnTf0ABSgZaIhFabGjQmnxSLlbUiAWs6+ou6pVNzdOnT3qh
	 9xouKW4hshk0ScXyRVb+nV+qyzaxrjNc/f+d/g5vOdyOshZ2yEBPhhOZmnNuflm42M
	 z1tJs5Rs35xprZj16I8ujgf+F9x4N4/QL5YS5Kp8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373716AbgJWAL3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 22 Oct 2020 20:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S373714AbgJWAL3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 22 Oct 2020 20:11:29 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAB7C0613CE
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Oct 2020 17:11:28 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a28so3878230ljn.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Oct 2020 17:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XLY21JX5I5QFlC2bkVrjYFHPFnXicdIVDS29HVXeTok=;
        b=ddTlNlNRb6Gcq+pCD2VGDDviUyFdWgS4SI2rZqCTe7qisSD40rk3KGt9veIrursLjL
         d9JYYxPwhKyRBZiDDXgH7+i9ioZ8pfkB5+In9+v4mNHAG0/A90ekmx23hwMClIRCkpK1
         XSJMBceXPy08U1FnD050q7PGqsmjLolxNxCak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XLY21JX5I5QFlC2bkVrjYFHPFnXicdIVDS29HVXeTok=;
        b=bV2KU/gX+Aobmgx1dftDyMMucWCENMl2QmpqTXbdizDt2ET8e9olQnlWFUmXZvsWwn
         CgnLi+wJw7r1yWXHcenaFIMDpnfXffbl4Pkw3D1PMh/NFHFcseuoyiemk2kTd9A455Cn
         KTfo/izfexTznMjUtlJiW0vq8Cuy9EbWikASHupbXqx6mOce/Xp2f068lNZfyzAw2yJM
         esbNwaJFGUgYqnaM/Xxj0nQd8F0R0m/q5ocNxcHZXvGzhdUzJIWx6YcDIk8wGlhlSgvU
         hqtMJBqX1ibC9CxVIoBXuDI0zVWNSKOCw32/sKlK9hEBzdvYvr/gQjVBJ4oE6eNJOiSu
         9Rxg==
X-Gm-Message-State: AOAM533rMXzJGa55bQih6SUrQeOoxtd7ZdDm224QDyMN+bFnq5u2y/ka
        u8hi+3ZlDr5+0+6sV+/Kkz+vL8wdS3gY7Q==
X-Google-Smtp-Source: ABdhPJw1HwGaxonbOlgUQ7AoLXSKWMf9BhXAuqcu2sGS+pKF2Z3c0eFaA+kPxx4C2HId7sbiv9xLjA==
X-Received: by 2002:a2e:88c9:: with SMTP id a9mr1829774ljk.193.1603411886717;
        Thu, 22 Oct 2020 17:11:26 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id q17sm415056lfn.252.2020.10.22.17.11.24
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 17:11:25 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id j30so4458180lfp.4
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Oct 2020 17:11:24 -0700 (PDT)
X-Received: by 2002:a19:c703:: with SMTP id x3mr1503603lff.105.1603411884054;
 Thu, 22 Oct 2020 17:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com> <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
In-Reply-To: <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 22 Oct 2020 17:11:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
Message-ID: <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
Subject: Re: mmstress[1309]: segfault at 7f3d71a36ee8 ip 00007f3d77132bdf sp
 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        X86 ML <x86@kernel.org>, LTP List <ltp@lists.linux.it>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        zenglg.jy@cn.fujitsu.com, Stephen Rothwell <sfr@canb.auug.org.au>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Oct 22, 2020 at 4:43 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Thanks. Very funky, but thanks. I've been running that commit on my
> machine for over half a year, and it still looks "trivially correct"
> to me, but let me go look at it one more time. Can't argue with a
> reliable bisect and revert..

Hmm. The fact that it only happens with KASAN makes me suspect it's
some bad interaction with the inline asm syntax change (and explains
why I've run with this for half a year without issues).

In particular, I wonder if it's that KASAN causes some reload pattern,
and the whole

     register __typeof__(*(ptr)) __val_pu asm("%"_ASM_AX);
..
     asm volatile(.. "r" (__val_pu) ..)

thing causes problems. That's an ugly pattern, but it's written that
way to get gcc to handle the 64-bit case properly (with the value in
%rax:%rdx).

It turns out that the decode of the user-mode SIGSEGV code is a
variation of system calls, ie

   0: b8 18 00 00 00        mov    $0x18,%eax
   5: 0f 05                syscall
   7: 48 3d 01 f0 ff ff    cmp    $0xfffffffffffff001,%rax
   d: 73 01                jae    0x10
   f:* c3                    retq    <-- trapping instruction

or

   0: 41 52                push   %r10
   2: 52                    push   %rdx
   3: 4d 31 d2              xor    %r10,%r10
   6: ba 02 00 00 00        mov    $0x2,%edx
   b: be 80 00 00 00        mov    $0x80,%esi
  10: 39 d0                cmp    %edx,%eax
  12: 75 07                jne    0x1b
  14: b8 ca 00 00 00        mov    $0xca,%eax
  19: 0f 05                syscall
  1b: 89 d0                mov    %edx,%eax
  1d: 87 07                xchg   %eax,(%rdi)
  1f: 85 c0                test   %eax,%eax
  21: 75 f1                jne    0x14
  23:* 5a                    pop    %rdx <-- trapping instruction
  24: 41 5a                pop    %r10
  26: c3                    retq

so in both cases it looks like 'syscall' returned with a bad stack pointer.

Which is certainly a sign of some code generation issue.

Very annoying, because it probably means that it's compiler-specific
too. And that "syscall 018" looks very odd. I think that's
sched_yield() on x86-64, which doesn't have any __put_user() cases at
all..

Would you mind sending me the problematic vmlinux file in private (or,
likely better - a pointer to some place I can download it, it's going
to be huge).

                      Linus
