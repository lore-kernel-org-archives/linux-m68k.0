Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC9DC77B76
	for <linux-m68k@archiver.kernel.org>; Sun, 23 Apr 2023 11:15:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjDWLPJ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 23 Apr 2023 07:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjDWLPJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 23 Apr 2023 07:15:09 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A283410EC
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Apr 2023 04:15:07 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pqXgP-000w9B-4E; Sun, 23 Apr 2023 13:15:05 +0200
Received: from p5b13a35e.dip0.t-ipconnect.de ([91.19.163.94] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pqXgO-003rOl-QE; Sun, 23 Apr 2023 13:15:05 +0200
Message-ID: <efb01ccc8cbabd7fc939d3aa1869f68e01157b3a.camel@physik.fu-berlin.de>
Subject: Question on the m68k Calling Convention (RTD)
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     debian-68k <debian-68k@lists.debian.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>,
        Min-Yih Hsu <minyihh@uci.edu>, Sheng <ox59616e@gmail.com>
Date:   Sun, 23 Apr 2023 13:15:04 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.0 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.163.94
X-ZEDAT-Hint: PO
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hello!

I'm currently trying to fix a bug [1] in the M68k backend in LLVM.

The problem is that the backend tries to emit RTD when the baseline
is raised to at least 68020 using the -m68020 command line flag and
then crashes.

Looking at the code [2], this happens because the backend runs into

	llvm_unreachable("RTD is not implemented");

since RTD is indeed not implemented yet.

Now, the interesting part is the question why the compiler is even trying
to take this codepath since RTD should normally be turned off in the M68k
backend by default as it's the case for GCC.

Quote from [3]:

> Use a different function-calling convention, in which functions that take a
> fixed number of arguments return with the rtd instruction, which pops their
> arguments while returning. This saves one instruction in the caller since
> there is no need to pop the arguments there.
> 
> This calling convention is incompatible with the one normally used on Unix,
> so you cannot use it if you need to call libraries compiled with the Unix compiler.
> 
> Also, you must provide function prototypes for all functions that take variable
> numbers of arguments (including printf); otherwise incorrect code is generated
> for calls to those functions.
> 
> In addition, seriously incorrect code results if you call a function with too many
> arguments. (Normally, extra arguments are harmlessly ignored.)
> 
> The rtd instruction is supported by the 68010, 68020, 68030, 68040, 68060 and CPU32
> processors, but not by the 68000 or 5200.
> 
> The default is -mno-rtd.

LLVM/Clang actually suppors the -mno-rtd switch as well.

Quoute from [4]:

> -mrtd, -mno-rtd
> 
> Make StdCall calling convention the default

Looking at the code in [2] again, it the RTD codepath is taken when the stack
adjustment is non-zero which raises the question what the proper stack adjustment
on m68k is when using GCC with -mno-rtd (the default).

Does the m68k calling convention actually require the callee to clean up the stack
similar to the stdcall calling convention on x86 or should the stack adjustment
be zero here unless -mrtd is set?

Thanks,
Adrian

> [1] https://github.com/llvm/llvm-project/issues/60554
> [2] https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/M68k/M68kExpandPseudo.cpp#L245
> [3] https://gcc.gnu.org/onlinedocs/gcc/M680x0-Options.html
> [4] https://clang.llvm.org/docs/ClangCommandLineReference.html

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
