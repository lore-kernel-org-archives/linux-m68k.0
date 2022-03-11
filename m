Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4ECEC433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 11 Mar 2022 08:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239941AbiCKIs1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 11 Mar 2022 03:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238035AbiCKIs1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 11 Mar 2022 03:48:27 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3407A1BA932
        for <linux-m68k@lists.linux-m68k.org>; Fri, 11 Mar 2022 00:47:23 -0800 (PST)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MG9c4-1nN8Lu1sYm-00GXuD for <linux-m68k@lists.linux-m68k.org>; Fri, 11 Mar
 2022 09:47:22 +0100
Received: by mail-wr1-f47.google.com with SMTP id q14so11849437wrc.4
        for <linux-m68k@lists.linux-m68k.org>; Fri, 11 Mar 2022 00:47:22 -0800 (PST)
X-Gm-Message-State: AOAM530ztseBPl8foj/dQz1r1X5bzhcskwMJ3xfZj6NcyP6TiY/L3xJV
        44xkCpHF25WdqP/hDwkAOH03qWPELkXKLuhpiZ8=
X-Google-Smtp-Source: ABdhPJyTWgAieFCZt1WE7SEInVHv7v1JH2rfBR/3E5KZi1Bf2JZ9KsD3KkY+eiRV+p6njpLjmQ0EccxM00+yxiNm90U=
X-Received: by 2002:a5d:6810:0:b0:203:7cbb:20be with SMTP id
 w16-20020a5d6810000000b002037cbb20bemr6468602wru.219.1646988442050; Fri, 11
 Mar 2022 00:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20220113160115.5375-1-bp@alien8.de> <YeBzxuO0wLn/B2Ew@mit.edu>
 <YeCuNapJLK4M5sat@zn.tnic> <CAMuHMdUbTNNr16YY1TFe=-uRLjg6yGzgw_RqtAFpyhnOMM5Pvw@mail.gmail.com>
 <YeHLIDsjGB944GSP@zn.tnic> <CAMuHMdUBr+gpF6Z5nPadjHFYJwgGd+LGoNTV=Sxty+yaY5EWxg@mail.gmail.com>
 <YeHQmbMYyy92AbBp@zn.tnic> <YeKyBP5rac8sVvWw@zn.tnic> <b40d1377-51d5-4ba3-ab3f-b40626c229ad@physik.fu-berlin.de>
 <87ilsmdhb5.fsf_-_@email.froward.int.ebiederm.org> <164686349541.391760.11942525130947458475.b4-ty@chromium.org>
 <87czit4cae.fsf_-_@email.froward.int.ebiederm.org> <CAHk-=wgpToUf0XORoH_t7Wrqv3=VcqCCDV2qnCbqjtCsrd3Cyg@mail.gmail.com>
In-Reply-To: <CAHk-=wgpToUf0XORoH_t7Wrqv3=VcqCCDV2qnCbqjtCsrd3Cyg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 11 Mar 2022 09:47:06 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3N_d_xh=hhg=yHC6tdcruLh5stxGPHVmoWtxQj66O2Eg@mail.gmail.com>
Message-ID: <CAK8P3a3N_d_xh=hhg=yHC6tdcruLh5stxGPHVmoWtxQj66O2Eg@mail.gmail.com>
Subject: Re: [PATCH] x86: Remove a.out support
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "Eric W. Biederman" <ebiederm@xmission.com>,
        Kees Cook <keescook@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>,
        "Theodore Ts'o" <tytso@mit.edu>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Michael Cree <mcree@orcon.net.nz>,
        linux-arch <linux-arch@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Borislav Petkov <bp@alien8.de>, Arnd Bergmann <arnd@arndb.de>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        X86 ML <x86@kernel.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:tOTS02kcEYR5HepSmrNWP2KAXXVXWNlyHQ8oBQOry5wcEZjs+Cc
 MK9f9TT42hrBXFh5UfMXA5e8kD/q8goEBo9sPnr88C72yXKEZfiFpbHtiqoyTkrRbl89zSy
 /004V1hFXvy0KN2u9t+59GBF4LIduvZ9YIJxD/A4aOMktzKnqGTLpJPR5hGZtuBWDF1N8gR
 HnAISKqpN6zF1bx1VIKKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eaR64uAo1RA=:F5qLu51NiqLkJUlNornTdT
 1B6k30cK30/hNVKy/dEW38DCX2O0t6HgqOGXLLr01jeJbc5Syg8yGWJbQCy8IthjjXNM6A0bp
 +Tcmn7vTCan/fd37KGx/KCC26GEnKcyDt9MP9hU5eA7rXK7HyygabQJhdLCr/uvx8t6xUMBba
 FtTvFtsvX2xoMQaOJR87c5AHcEeO+mFmEmGrlab/i02Jx5Tom/fRSFwi8wurmOlUG35eNfGCQ
 a6Oq4amwhmPnH9OAAJVPfXUswEk6j76pFYw2WUv00RzSwnxNtbOe2crwcXubbVi6O2SK7UmDE
 3lkPmgwkjuwfkLU12skeXvTanEWJoSTn4dKlzu/wPvmQIPDytm6Ykx6XVN0CiyKAJCbbVTXTU
 UhL/zPD/7IBf0Pu9koL28QG0AviIF+g4tQTBKx6SmTLD/RHoQcNTg9wueb59qy4gjrrGFyxCO
 4+uODmcEbZZPxUg5ThNmIbIGAlSbfoKgjV7i5ZQ9AigmYt6L2SPSn5eOJUqLxFPyFy4DWvw1n
 QcU3o/Hn/3VwMbgrGKFBV04y3/ISo2h8dc6LX5j8Epqkos2YNqD8HsA9NOH1d4jV63/O3/Y5I
 +xCk0n8K5I5t/3qZ8SmtO6jtl8bbq1wwoJIL9tzg/0Wsx2cYDosZ4FM0mIIAM3Omohsx1/c6k
 VZzVSUAYB4KYEjB/BRjVFIpMbXqCIlRkkYhOcB4v0n3FOxPTaEo1VCaG6tTrC+vfU4L88yG2N
 dis/FjuoPvzGgQmo9PvoDTWysAw4vKCZxqUuGXgul1jLCQZmN+l0jR3blkffnqG+Zrwx+/3aH
 4W+0a+q1nkFwBhn10yRhqjQ/EycM00cj2Mv9+aMfgUst8PNrFY=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Mar 11, 2022 at 12:35 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Mar 10, 2022 at 3:29 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
> >
> > Kees can you pick this one up in for-next/execve as well?
> >
> > It still applies cleanly and the actual patch seems to have gotten lost
> > in the conversation about what more we could do.
>
> Side note: there are similar other turds if a.out goes away, ie on
> alpha it's OSF4_COMPAT, and it enables support for a couple of legacy
> OSF/1 system calls.
>
> I think that was also discussed in the (old) a.out deprecation thread
> back in 2019..

The only thing that actually depends on CONFIG_OSF4_COMPAT seems to be
the custom logic in readv() and writev(). Those are the two that you removed
in your patch back then[1].

For the other system calls, I fear we can only try to guess which of them
are used in Linux applications and which ones are not. These were always
available to normal Linux user space, so the ones that are similar to our
syscalls could have been used in glibc, e.g. mmap, wait4, stat.

         Arnd

[1] https://lore.kernel.org/all/CAHk-=wgt7M6yA5BJCJo0nF22WgPJnN8CvViL9CAJmd+S+Civ6w@mail.gmail.com/

[2] $ git grep sys_osf arch/alpha/kernel/syscalls/syscall.tbl
7 common osf_wait4 sys_osf_wait4
17 common brk sys_osf_brk
21 common osf_mount sys_osf_mount
43 common osf_set_program_attributes sys_osf_set_program_attributes
48 common osf_sigprocmask sys_osf_sigprocmask
71 common mmap sys_osf_mmap
93 common osf_select sys_osf_select
100 common getpriority sys_osf_getpriority
112 common osf_sigstack sys_osf_sigstack
116 common osf_gettimeofday sys_osf_gettimeofday
117 common osf_getrusage sys_osf_getrusage
120 common readv sys_osf_readv
121 common writev sys_osf_writev
122 common osf_settimeofday sys_osf_settimeofday
138 common osf_utimes sys_osf_utimes
156 common sigaction sys_osf_sigaction
159 common osf_getdirentries sys_osf_getdirentries
160 common osf_statfs sys_osf_statfs
161 common osf_fstatfs sys_osf_fstatfs
165 common osf_getdomainname sys_osf_getdomainname
207 common osf_utsname sys_osf_utsname
224 common osf_stat sys_osf_stat
225 common osf_lstat sys_osf_lstat
226 common osf_fstat sys_osf_fstat
227 common osf_statfs64 sys_osf_statfs64
228 common osf_fstatfs64 sys_osf_fstatfs64
241 common osf_sysinfo sys_osf_sysinfo
244 common osf_proplist_syscall sys_osf_proplist_syscall
251 common osf_usleep_thread sys_osf_usleep_thread
256 common osf_getsysinfo sys_osf_getsysinfo
257 common osf_setsysinfo sys_osf_setsysinfo
