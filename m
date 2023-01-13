Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB3FC677F1
	for <linux-m68k@archiver.kernel.org>; Fri, 13 Jan 2023 17:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjAMRnS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 13 Jan 2023 12:43:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjAMRm6 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 13 Jan 2023 12:42:58 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83FE8B779
        for <linux-m68k@vger.kernel.org>; Fri, 13 Jan 2023 09:29:20 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pGNri-002zG2-Hp; Fri, 13 Jan 2023 18:29:18 +0100
Received: from p57ae5361.dip0.t-ipconnect.de ([87.174.83.97] helo=[192.168.178.35])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pGNri-0005IR-B3; Fri, 13 Jan 2023 18:29:18 +0100
Message-ID: <0687610a-0efd-51f5-110d-fad0de113556@physik.fu-berlin.de>
Date:   Fri, 13 Jan 2023 18:29:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v13 0/3] Add kernel seccomp support for m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
References: <20230112035529.13521-1-schmitzmic@gmail.com>
Content-Language: en-US
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <20230112035529.13521-1-schmitzmic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.174.83.97
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

On 1/12/23 04:55, Michael Schmitz wrote:
> Previous version of patch 1 did overwrite a syscall return
> value that was changed by ptrace or seccomp (in regs->d0)
> by -ENOSYS when skipping a syscall. Branch directly to
> ret_from_syscall instead of falling through to badsys (which
> must set -ENOSYS). I'm sure this can be done more elegantly.
> 
> Patch 3 used the wrong struct definition for ARCH_REGS - the
> kernel ptrace code copies 19 registers (from syscall stack
> and switch_stack, pt_regs only contains the 14 from the
> syscall stack). Stack overflow ensues.
> 
> With these changes, 79 of 94 seccomp_bpf tests now succeed.

I have also opened a PR now to add m68k support to libseccomp [1].

Unfortunately, libseccomp fails to build after I updated the syscalls.csv file
after adding m68k support. It seems that the problem are a number of syscalls
that exist on m68k only:

   CC       libseccomp_la-syscalls.perf.lo
syscalls.perf:152:70: error: '__PNR_getpagesize' undeclared here (not in a function)
   152 | getpagesize,119,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,166,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF
       |                                                                      ^~~~~~~~~~~~~~~~~
syscalls.perf:45:69: error: '__PNR_atomic_cmpxchg_32' undeclared here (not in a function)
    45 | atomic_cmpxchg_32,12,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF,335,SCMP_KV_UNDEF,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF,__PNR_atomic_cmpxchg_32,SCMP_KV_UNDEF
       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
syscalls.perf:44:69: error: '__PNR_atomic_barrier' undeclared here (not in a function)
    44 | atomic_barrier,11,__PNR_atomic_barrier,SCMP_KV_UNDEF,__PNR_atomic_barrier,SCMP_KV_UNDEF,__PNR_atomic_barrier,SCMP_KV_UNDEF,__PNR_atomic_barrier,SCMP_KV_UNDEF,__PNR_atomic_barrier,SCMP_KV_UNDEF,336,SCMP_KV_UNDEF,__PNR_atomic_barrier,SCMP_KV_UNDEF,__PNR_atomic_barrier,SCMP_KV_UNDEF,__PNR_atomic_barrier,SCMP_KV_UNDEF,__PNR_atomic_barrier,SCMP_KV_UNDEF,__PNR_atomic_barrier,SCMP_KV_UNDEF,__PNR_atomic_barrier,SCMP_KV_UNDEF,__PNR_atomic_barrier,SCMP_KV_UNDEF,__PNR_atomic_barrier,SCMP_KV_UNDEF,__PNR_atomic_barrier,SCMP_KV_UNDEF,__PNR_atomic_barrier,SCMP_KV_UNDEF,__PNR_atomic_barrier,SCMP_KV_UNDEF
       |                                                                     ^~~~~~~~~~~~~~~~~~~~
make[3]: *** [Makefile:903: libseccomp_la-syscalls.perf.lo] Error 1
make[2]: *** [Makefile:922: all-recursive] Error 1
make[1]: *** [Makefile:524: all-recursive] Error 1
make: *** [Makefile:433: all] Error 2

Adrian

> [1] https://github.com/seccomp/libseccomp/pull/397

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

