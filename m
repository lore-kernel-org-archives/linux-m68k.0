Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E29DCA0ECB
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Sep 2023 22:26:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243839AbjIKWYd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238152AbjIKNmx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Sep 2023 09:42:53 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9811CF0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Sep 2023 06:42:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 31C9BCE10B4;
        Mon, 11 Sep 2023 13:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E395C433C8;
        Mon, 11 Sep 2023 13:42:41 +0000 (UTC)
Message-ID: <0424526e-e9fd-7a3f-71ed-c43855ab1290@linux-m68k.org>
Date:   Mon, 11 Sep 2023 23:42:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 06/52] m68k: kernel: Add and use "process.h"
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Finn Thain <fthain@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Philip Blundell <philb@gnu.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        Laurent Vivier <laurent@vivier.eu>,
        linux-kernel@vger.kernel.org
References: <cover.1694093327.git.geert@linux-m68k.org>
 <6894409da1a0d8667bf74b9100067485ce3c37ac.1694093327.git.geert@linux-m68k.org>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <6894409da1a0d8667bf74b9100067485ce3c37ac.1694093327.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Nice cleanups. My plan is to clean up the ColdFire/68000 warnings as well.


On 7/9/23 23:41, Geert Uytterhoeven wrote:
> When building with W=1:
> 
>      arch/m68k/kernel/process.c:115:16: warning: no previous prototype for ‘m68k_clone’ [-Wmissing-prototypes]
>        115 | asmlinkage int m68k_clone(struct pt_regs *regs)
> 	  |                ^~~~~~~~~~
>      arch/m68k/kernel/process.c:136:16: warning: no previous prototype for ‘m68k_clone3’ [-Wmissing-prototypes]
>        136 | asmlinkage int m68k_clone3(struct pt_regs *regs)
> 	  |                ^~~~~~~~~~~
> 
> Fix this by introducing a new header file "process.h" for holding the
> prototypes of functions implemented in arch/m68k/kernel/process.c.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>   arch/m68k/kernel/process.c | 1 +
>   arch/m68k/kernel/process.h | 8 ++++++++
>   2 files changed, 9 insertions(+)
>   create mode 100644 arch/m68k/kernel/process.h
> 
> diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
> index e06ce147c0b7fcf2..d2d6a57356502e5b 100644
> --- a/arch/m68k/kernel/process.c
> +++ b/arch/m68k/kernel/process.c
> @@ -38,6 +38,7 @@
>   #include <asm/machdep.h>
>   #include <asm/setup.h>
>   
> +#include <process.h>

I applied all 52 patches to linux-6.6-rc1 and see this:

     $ ARCH=m68k CROSS_COMPILE=m68k-linux- make amiga_defconfig
     $ ARCH=m68k CROSS_COMPILE=m68k-linux- make W=1
     ...
       CC      arch/m68k/kernel/process.o
     arch/m68k/kernel/process.c:41:10: fatal error: process.h: No such file or directory
      #include <process.h>
               ^~~~~~~~~~~

Of course trivially fixed by doing this:

diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index d2d6a5735650..2584e94e2134 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -38,7 +38,7 @@
  #include <asm/machdep.h>
  #include <asm/setup.h>
  
-#include <process.h>
+#include "process.h"
  
  asmlinkage void ret_from_fork(void);
  asmlinkage void ret_from_kernel_thread(void);


Regards
Greg


>   asmlinkage void ret_from_fork(void);
>   asmlinkage void ret_from_kernel_thread(void);
> diff --git a/arch/m68k/kernel/process.h b/arch/m68k/kernel/process.h
> new file mode 100644
> index 0000000000000000..d31745f2e64bebab
> --- /dev/null
> +++ b/arch/m68k/kernel/process.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <linux/linkage.h>
> +
> +struct pt_regs;
> +
> +asmlinkage int m68k_clone(struct pt_regs *regs);
> +asmlinkage int m68k_clone3(struct pt_regs *regs);
