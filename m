Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9333C48BC2
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Jun 2021 02:13:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F531613AA
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Jun 2021 02:13:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhFXCPn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 23 Jun 2021 22:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbhFXCPm (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Jun 2021 22:15:42 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22F1C061574
        for <linux-m68k@vger.kernel.org>; Wed, 23 Jun 2021 19:13:24 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id e33so3420876pgm.3
        for <linux-m68k@vger.kernel.org>; Wed, 23 Jun 2021 19:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4DDCrHHwM1ncjw5gQeuAKvdhRjsT2eeguJP7e659fqI=;
        b=V4bC/eXEJfVP2/UQEGssXNVW4iL0z+Faa2tWk7hUfbiGd3G7zpc9HjzozfnPw04lyh
         xGPvfsu4/lEiIzoFnmrXHRLCLBhegziXs+VKnUeHVI+1/BRiKcJwRQA3N+KwkKhcpbkj
         ceS2CWlaFoXjG8Uv41GNPRN8rIlrEKvb0/nN9SEKO0IJevZo5iMY1xEMZCxK8NLTlGXi
         5wwSRB9zpNArIUDvhjbrb1l3Osgz/rv89JjbpD52QbDITMKF8IgIMbZx7qm9YKv9MGnM
         jzCVM9Fk/hkV1SzFPHhsEKHbk/XV8lF2rjbJCtSuWcOIi/PslCOq4fPbhqcjOHjZGKp4
         6jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4DDCrHHwM1ncjw5gQeuAKvdhRjsT2eeguJP7e659fqI=;
        b=W89uR0D8r3Mz+CIVSsvFcUSj4Rh6biTHaZB7nihjr1pSug4Hs6YsgHe4rdEV0z4C/I
         yguW6i4q6eXVn0pzJ+M6bsQNVXNkZVxyKOUrDB3E/1dNn5ev0bX7OaSeiDyztabCtmAi
         jtBQx4fa1VdBVtZMR6f816dvJrsiGpJxI3MOsutcFPDgsBd9e3aQYcNvjCryAoPCmPAN
         E6GT/mNCTLPPWlRHOkEfbsfGLytMq6/Rerm7CoUWB3qa2wFpOJro678CKjmUdfTbMbXh
         h7vwMBRF1U1ZonUrUyE1NOOKxLpnFCsgW4iZQkdlycgWmxVR66YuMl4IcWPyUWc1+xue
         1adg==
X-Gm-Message-State: AOAM533YkjKglZKeC/sWIW7QLekCsh/fnAqqNimkFYuH3GWIfYFwUNif
        8WeO0I3qSo2EkhTJyTU5pbd6jWRS/LbSqg==
X-Google-Smtp-Source: ABdhPJziT42aGaXu5SOlWizqaaVnyP7A6pz2oTmzdUtOnmlM2PyHEM1DBUjBh16m1moyOxugH8QY7Q==
X-Received: by 2002:a63:da0a:: with SMTP id c10mr2415159pgh.255.1624500804396;
        Wed, 23 Jun 2021 19:13:24 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:4de2:77c4:143f:6b70? ([2001:df0:0:200c:4de2:77c4:143f:6b70])
        by smtp.gmail.com with ESMTPSA id p9sm969504pfo.106.2021.06.23.19.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 19:13:17 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] m68k: add kernel seccomp support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
References: <1623908361-29837-1-git-send-email-schmitzmic@gmail.com>
 <1623908361-29837-2-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdX-JBTAWDvFQg7nVGwwxu8o6sX1GYVF0ha6JpZxOxuG8g@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <c968ef23-bad9-aaef-ed18-03195f720c09@gmail.com>
Date:   Thu, 24 Jun 2021 14:13:12 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX-JBTAWDvFQg7nVGwwxu8o6sX1GYVF0ha6JpZxOxuG8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

I haven't been able to compile that one using the cross compiler:

m68k-linux-gnu-gcc -Wl,-no-as-needed -Wall  -lpthread seccomp_bpf.c  -o 
/usr/misc/m68k/linux-m68k-git/linux-m68k/tools/testing/selftests/seccomp/seccomp_bpf
seccomp_bpf.c: In function ‘user_notification_addfd’:
seccomp_bpf.c:3968:10: warning: implicit declaration of function 
‘memfd_create’ [-Wimplicit-function-declaration]
   memfd = memfd_create("test", 0);
           ^
/tmp/ccfLGgXj.o: In function `user_notification_addfd':
seccomp_bpf.c:(.text+0x2ab32): undefined reference to `memfd_create'
/tmp/ccfLGgXj.o: In function `user_notification_addfd_rlimit':
seccomp_bpf.c:(.text+0x2c8a2): undefined reference to `memfd_create'
collect2: error: ld returned 1 exit status
../lib.mk:144: recipe for target 
'/usr/misc/m68k/linux-m68k-git/linux-m68k/tools/testing/selftests/seccomp/seccomp_bpf' 
failed

Adding the memfd_create definition found in 
tools/testing/selftests/drivers/dma-buf/udmabuf.c:

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c 
b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 66f5145..231d772 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -266,6 +266,11 @@ struct seccomp_notif_addfd_big {
  #define SECCOMP_FILTER_FLAG_TSYNC_ESRCH (1UL << 4)
  #endif

+static int memfd_create(const char *name, unsigned int flags)
+{
+       return syscall(__NR_memfd_create, name, flags);
+}
+
  #ifndef seccomp
  int seccomp(unsigned int op, unsigned int flags, void *args)
  {

allows the tests to compile.

Running the test cases requires a fairly recent system - seccomp_bpf had 
35 tests pass, 52 fail.

Cheers,

     Michael




On 23/06/21 7:35 pm, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Thu, Jun 17, 2021 at 7:39 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Add secure_computing() call to syscall_trace_enter to actually
>> filter system calls.
>>
>> Add necessary arch Kconfig options, define TIF_SECCOMP trace
>> flag and provide basic seccomp filter support in asm/syscall.h
>>
>> syscall_get_nr currently uses the syscall nr stored in orig_d0
>> because we change d0 to a default return code before starting a
>> syscall trace. This may be inconsistent with syscall_rollback
>> copying orig_d0 to d0 (which we never check upon return from
>> trace). We use d0 for the return code from syscall_trace_enter
>> in entry.S currently, and could perhaps expand that to store
>> a new syscall number returned by the seccomp filter before
>> executing the syscall. This clearly needs some discussion.
>>
>> Compiles (for Atari) and boots on ARAnyM, otherwise untested.
>>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>> ---
>>   arch/m68k/Kconfig                   |  2 ++
>>   arch/m68k/include/asm/seccomp.h     | 11 +++++++++++
>>   arch/m68k/include/asm/syscall.h     | 33 +++++++++++++++++++++++++++++++++
>>   arch/m68k/include/asm/thread_info.h |  2 ++
>>   arch/m68k/kernel/ptrace.c           |  5 +++++
>>   5 files changed, 53 insertions(+)
>>   create mode 100644 arch/m68k/include/asm/seccomp.h
>>
>> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
>> index 372e4e6..deaea88 100644
>> --- a/arch/m68k/Kconfig
>> +++ b/arch/m68k/Kconfig
>> @@ -19,6 +19,8 @@ config M68K
>>          select GENERIC_STRNCPY_FROM_USER if MMU
>>          select GENERIC_STRNLEN_USER if MMU
>>          select HAVE_AOUT if MMU
>> +       select HAVE_ARCH_SECCOMP
>> +       select HAVE_ARCH_SECCOMP_FILTER
> So the status should be changed from "TODO" to "ok" in
> Documentation/features/seccomp/seccomp-filter/arch-support.txt
>
> BTW, there was also "[PATCH] [WIP] selftests/seccomp: Add m68k support"
> https://lore.kernel.org/linux-m68k/alpine.DEB.2.21.2008261315050.25325@ramsan.of.borg/
>
> I kept on up-porting it, but haven't exercised it recently.
> Recent version looks like (gmail-whitespace-damaged):
>
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -135,6 +135,8 @@ struct seccomp_data {
>   #  define __NR_seccomp 337
>   # elif defined(__sh__)
>   #  define __NR_seccomp 372
> +# elif defined(__mc68000__)
> +#  define __NR_seccomp 380
>   # else
>   #  warning "seccomp syscall number unknown for this architecture"
>   #  define __NR_seccomp 0xffff
> @@ -1815,6 +1817,10 @@ TEST_F(TRACE_poke, getpid_runs_normally)
>   # define ARCH_REGS             struct pt_regs
>   # define SYSCALL_NUM(_regs)    (_regs).regs[3]
>   # define SYSCALL_RET(_regs)    (_regs).regs[0]
> +#elif defined(__mc68000__)
> +# define ARCH_REGS             struct pt_regs
> +# define SYSCALL_NUM(_regs)    (_regs).orig_d0
> +# define SYSCALL_RET(_regs)    (_regs).d0
>   #else
>   # error "Do not know how to find your architecture's registers and syscalls"
>   #endif
> @@ -1879,7 +1885,7 @@ const bool ptrace_entry_set_syscall_ret =
>    * Use PTRACE_GETREGS and PTRACE_SETREGS when available. This is useful for
>    * architectures without HAVE_ARCH_TRACEHOOK (e.g. User-mode Linux).
>    */
> -#if defined(__x86_64__) || defined(__i386__) || defined(__mips__)
> +#if defined(__x86_64__) || defined(__i386__) || defined(__mips__) ||
> defined(__mc68000)
>   # define ARCH_GETREGS(_regs)   ptrace(PTRACE_GETREGS, tracee, 0, &(_regs))
>   # define ARCH_SETREGS(_regs)   ptrace(PTRACE_SETREGS, tracee, 0, &(_regs))
>   #else
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
