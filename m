Return-Path: <SRS0=aPjp=D6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21E1C388F9
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 07:14:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F32E20878
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 07:14:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="fIw2nnxw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S375616AbgJWHO2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Oct 2020 03:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S375612AbgJWHO1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Oct 2020 03:14:27 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE878C0613D2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 00:14:25 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id t25so907887ejd.13
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 00:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tV2JdgeetWkMo3b0CNfPI5PIf7h/qWNZxkMeAZIAXgY=;
        b=fIw2nnxwmkbu7DraOrhc1cAb6DP8f6lxZtkBYUHubh5it1qNClYsZpnGZ3YLDsL/zb
         Za90R2NRP5hBvIBd5J3NkV9nsLXUVzQSxDVKiLjnTELEbQSjkvAuDYIOFGxjsOYXTjpo
         KbgJvqauR7ASZGWckCkRxGOSU/6znYiPGiN7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tV2JdgeetWkMo3b0CNfPI5PIf7h/qWNZxkMeAZIAXgY=;
        b=AHDAl4Grud8ncS+/VEjHqdjZJeRuM20a+SD+xrc7wLL15iPdlahZZ7UteB/YKb0JGa
         oKeberMXJS5ZNTqbgyln+JSjWpI4hCxYngpgcCCZLDDkTqbKdhOEy1pazsP+7croBj56
         jd3MMmcVofVxNUBXlH+GIzbDevUe46qxL6W++YuDTf1GH1QCEfMBiI6lBcVvs4kO1nOr
         fRAlWox65TBnTQ+rrcuJyiF3oPRQPgyNlcXhMvWrvwFYqwvMEMsjfOhhMR0BaypuEqIF
         PxaX/9nvSfgXS2Yvih2wQVUJh93pLT02iA6P1xkCq9B2r8OG5Opw/OY/lvDM4bj9zpXh
         37IQ==
X-Gm-Message-State: AOAM533o7zOSj/nlLC6ouQ2hhFSzwc4WxhD+DPHKGstkmJwgtQrO2999
        sRXVdhatMIgtjas2yMJ7PhzOaA==
X-Google-Smtp-Source: ABdhPJy047+CmhTalOZN6C5t0TMaQd7AP4ay6FCicu99E7Q9zHQUqdZgSji/CmQEuleg6vEhWhL9+Q==
X-Received: by 2002:a17:906:a1d4:: with SMTP id bx20mr664255ejb.262.1603437264294;
        Fri, 23 Oct 2020 00:14:24 -0700 (PDT)
Received: from [172.16.11.132] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id h17sm287717ejf.98.2020.10.23.00.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2020 00:14:23 -0700 (PDT)
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in
 libc-2.27.so[7f3d77058000+1aa000]
To:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     =?UTF-8?Q?Daniel_D=c3=adaz?= <daniel.diaz@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        zenglg.jy@cn.fujitsu.com,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        X86 ML <x86@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mm <linux-mm@kvack.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Ingo Molnar <mingo@redhat.com>, LTP List <ltp@lists.linux.it>,
        Al Viro <viro@zeniv.linux.org.uk>
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
 <20201023050214.GG23681@linux.intel.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <356811ab-cb08-7685-ca01-fe58b5654953@rasmusvillemoes.dk>
Date:   Fri, 23 Oct 2020 09:14:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201023050214.GG23681@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 23/10/2020 07.02, Sean Christopherson wrote:
> On Thu, Oct 22, 2020 at 08:05:05PM -0700, Linus Torvalds wrote:
>> On Thu, Oct 22, 2020 at 6:36 PM Daniel Díaz <daniel.diaz@linaro.org> wrote:
>>>
>>> The kernel Naresh originally referred to is here:
>>>   https://builds.tuxbuild.com/SCI7Xyjb7V2NbfQ2lbKBZw/
>>
>> Thanks.
>>
>> And when I started looking at it, I realized that my original idea
>> ("just look for __put_user_nocheck_X calls, there aren't so many of
>> those") was garbage, and that I was just being stupid.
>>
>> Yes, the commit that broke was about __put_user(), but in order to not
>> duplicate all the code, it re-used the regular put_user()
>> infrastructure, and so all the normal put_user() calls are potential
>> problem spots too if this is about the compiler interaction with KASAN
>> and the asm changes.
>>
>> So it's not just a couple of special cases to look at, it's all the
>> normal cases too.
>>
>> Ok, back to the drawing board, but I think reverting it is probably
>> the right thing to do if I can't think of something smart.
>>
>> That said, since you see this on x86-64, where the whole ugly trick with that
>>
>>    register asm("%"_ASM_AX)
>>
>> is unnecessary (because the 8-byte case is still just a single
>> register, no %eax:%edx games needed), it would be interesting to hear
>> if the attached patch fixes it. That would confirm that the problem
>> really is due to some register allocation issue interaction (or,
>> alternatively, it would tell me that there's something else going on).
> 
> I haven't reproduced the crash, but I did find a smoking gun that confirms the
> "register shenanigans are evil shenanigans" theory.  I ran into a similar thing
> recently where a seemingly innocuous line of code after loading a value into a
> register variable wreaked havoc because it clobbered the input register.
> 
> This put_user() in schedule_tail():
> 
>    if (current->set_child_tid)
>            put_user(task_pid_vnr(current), current->set_child_tid);
> 
> generates the following assembly with KASAN out-of-line:
> 
>    0xffffffff810dccc9 <+73>: xor    %edx,%edx
>    0xffffffff810dcccb <+75>: xor    %esi,%esi
>    0xffffffff810dcccd <+77>: mov    %rbp,%rdi
>    0xffffffff810dccd0 <+80>: callq  0xffffffff810bf5e0 <__task_pid_nr_ns>
>    0xffffffff810dccd5 <+85>: mov    %r12,%rdi
>    0xffffffff810dccd8 <+88>: callq  0xffffffff81388c60 <__asan_load8>
>    0xffffffff810dccdd <+93>: mov    0x590(%rbp),%rcx
>    0xffffffff810dcce4 <+100>: callq  0xffffffff817708a0 <__put_user_4>
>    0xffffffff810dcce9 <+105>: pop    %rbx
>    0xffffffff810dccea <+106>: pop    %rbp
>    0xffffffff810dcceb <+107>: pop    %r12
> 
> __task_pid_nr_ns() returns the pid in %rax, which gets clobbered by
> __asan_load8()'s check on current for the current->set_child_tid dereference.
> 

Yup, and you don't need KASAN to implicitly generate function calls for
you. With x86_64 defconfig, I get

extern u64 __user *get_destination(int x, int y);

void pu_test(void)
{
	u64 big = 0x1234abcd5678;

	if (put_user(big, get_destination(4, 5)))
		pr_warn("uh");
}

to generate

0000000000004d60 <pu_test>:
    4d60:       53                      push   %rbx
    4d61:       be 05 00 00 00          mov    $0x5,%esi
    4d66:       bf 04 00 00 00          mov    $0x4,%edi
    4d6b:       e8 00 00 00 00          callq  4d70 <pu_test+0x10>
                        4d6c: R_X86_64_PC32     get_destination-0x4
    4d70:       48 89 c1                mov    %rax,%rcx
    4d73:       e8 00 00 00 00          callq  4d78 <pu_test+0x18>
                        4d74: R_X86_64_PC32     __put_user_8-0x4
    4d78:       85 c9                   test   %ecx,%ecx
    4d7a:       75 02                   jne    4d7e <pu_test+0x1e>
    4d7c:       5b                      pop    %rbx
    4d7d:       c3                      retq
    4d7e:       5b                      pop    %rbx
    4d7f:       48 c7 c7 00 00 00 00    mov    $0x0,%rdi
                        4d82: R_X86_64_32S      .rodata.str1.1+0xfa
    4d86:       e9 00 00 00 00          jmpq   4d8b <pu_test+0x2b>
                        4d87: R_X86_64_PC32     printk-0x4


That's certainly garbage. Now, I don't know if it's a sufficient fix (or
could break something else), but the obvious first step of rearranging
so that the ptr argument is evaluated before the assignment to __val_pu

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 477c503f2753..b5d3290fcd09 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -235,13 +235,13 @@ extern void __put_user_nocheck_8(void);
 #define do_put_user_call(fn,x,ptr)                                     \
 ({                                                                     \
        int __ret_pu;                                                   \
-       register __typeof__(*(ptr)) __val_pu asm("%"_ASM_AX);           \
+       __typeof__(ptr) __ptr = (ptr);                                  \
+       register __typeof__(*(ptr)) __val_pu asm("%"_ASM_AX) = (x);     \
        __chk_user_ptr(ptr);                                            \
-       __val_pu = (x);                                                 \
        asm volatile("call __" #fn "_%P[size]"                          \
                     : "=c" (__ret_pu),                                 \
                        ASM_CALL_CONSTRAINT                             \
-                    : "0" (ptr),                                       \
+                    : "0" (__ptr),                                     \
                       "r" (__val_pu),                                  \
                       [size] "i" (sizeof(*(ptr)))                      \
                     :"ebx");                                           \


at least gets us

0000000000004d60 <pu_test>:
    4d60:       53                      push   %rbx
    4d61:       be 05 00 00 00          mov    $0x5,%esi
    4d66:       bf 04 00 00 00          mov    $0x4,%edi
    4d6b:       e8 00 00 00 00          callq  4d70 <pu_test+0x10>
                        4d6c: R_X86_64_PC32     get_destination-0x4
    4d70:       48 89 c1                mov    %rax,%rcx
    4d73:       48 b8 78 56 cd ab 34    movabs $0x1234abcd5678,%rax
    4d7a:       12 00 00
    4d7d:       e8 00 00 00 00          callq  4d82 <pu_test+0x22>
                        4d7e: R_X86_64_PC32     __put_user_8-0x4


FWIW, https://gcc.gnu.org/onlinedocs/gcc/Local-Register-Variables.html
does warn about function calls and other things that might clobber the
register variables between the assignment and the use as an input
(though the case of evaluating other input operands is not explicitly
mentioned).

Rasmus
