Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6862AEB64DD
	for <linux-m68k@archiver.kernel.org>; Wed,  5 Jul 2023 15:15:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233151AbjGEPP4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 5 Jul 2023 11:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbjGEPPz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 5 Jul 2023 11:15:55 -0400
X-Greylist: delayed 574 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 05 Jul 2023 08:15:54 PDT
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67675173B
        for <linux-m68k@lists.linux-m68k.org>; Wed,  5 Jul 2023 08:15:54 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9321458028A;
        Wed,  5 Jul 2023 11:06:19 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 05 Jul 2023 11:06:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1688569579; x=1688576779; bh=xA
        WlrtmWIGFsGqKku/ln8wTfTlYDAGy8buXk/3wv9RE=; b=IS6y2R6p2qQA1WUjwO
        76Im3Z3R7eN8bOoWiz/JN2f/7X/R0jhpbe2hZiFnh5b/sp+rpu4ypAHN1gCaKoGa
        II8Fx5hIjquuBBy+3QOebB7Ye4d5+aySypDyqsyYxjJAe13jUErXEGuvlvy2EYQs
        HbmtERFcH9FiAKVygoYK5jUNUy2W5LD6YtpLur3bxG9mQ22m/uNgDN414Y05jY3c
        CKR3Sv0MA1HFvecxQ1oGDFZNlYsK36NJlrCZzWyP40CWcNp9JCsndy045JiZN0Lr
        CXJjZd6+FGwB14KY48Jjs+AsPm9zHaMuCu2Io7YNEmEKeFXFGLvrOV+ANX1fPe73
        GSgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1688569579; x=1688576779; bh=xAWlrtmWIGFsG
        qKku/ln8wTfTlYDAGy8buXk/3wv9RE=; b=MXXXdsFZr7yUqg9HA0rn4o3POXutz
        iu/4zVQFtb9DKqOGWcEzK0OzXo8/PwrFq27ooOkZhNH8ZqWE+E2iXSVFOJ4K8TfH
        VHxdnHzhCBdOEt/wwI7l4kXNBLps5fbRCHxD5QmOgPaILriK+3b5gGXB+sz1489d
        FRF2l727lJH9oW6HWfJwB3AgvPgpTCg/K+0Gklwz+PKqXWqktyVGhn8X5ailyYNQ
        BaAo6h59BOpzzjI8xM4iWWN0akQwKEp2olELoT0+d6SQ4cfWTkiZw+xQr5skOJr8
        xskjf2zCDnxkyoADB2lPQGCunyGC//JiUL6AYaYZunYCW7HXx7zBHfaew==
X-ME-Sender: <xms:5YalZIBjYSN5aZAKN2whQAVC3vetLZ4esGlaodY88k6-OelYaor1nA>
    <xme:5YalZKh50pG53xm0dGdUzI22_u0RvUZGLyAqBfBQwk_yPVvbhNPMysmO5GA04ohEq
    8p3m-yltSvs8tuqBNo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudejgdeflecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:5YalZLkUK_5CUSCZwRdCH73mKaS4VoMcysQ3vPIetJMJqRrG9bEDJg>
    <xmx:5YalZOx0ZbrcI6SQ_YUq4ntuesRRWfatwLAgdzkjWEsRosak7--h-Q>
    <xmx:5YalZNSUEjKee0mdsN0j1WrSDlbIevCDvtsPe96Pmr9OFDBCmOPReA>
    <xmx:64alZO55Jc9ZZIDu4H1Rhc1Sx3IqD-nxqQTYmHbTogwzLLj6kpvLdQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id BFA19B6008D; Wed,  5 Jul 2023 11:06:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <09f70de6-9409-4fa4-b9ea-831078d914e7@app.fastmail.com>
In-Reply-To: <20230705142004.3605799-4-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
 <20230705142004.3605799-4-eric.devolder@oracle.com>
Date:   Wed, 05 Jul 2023 17:05:53 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Eric DeVolder" <eric.devolder@oracle.com>,
        "Russell King" <linux@armlinux.org.uk>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>,
        "Huacai Chen" <chenhuacai@kernel.org>,
        "Geert Uytterhoeven" <geert@linux-m68k.org>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Helge Deller" <deller@gmx.de>,
        "Yoshinori Sato" <ysato@users.sourceforge.jp>,
        "Rich Felker" <dalias@libc.org>,
        "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
        "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Cc:     "WANG Xuerui" <kernel@xen0n.name>,
        "Michael Ellerman" <mpe@ellerman.id.au>,
        "Nicholas Piggin" <npiggin@gmail.com>,
        "Christophe Leroy" <christophe.leroy@csgroup.eu>,
        "Paul Walmsley" <paul.walmsley@sifive.com>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>,
        "Heiko Carstens" <hca@linux.ibm.com>, gor@linux.ibm.com,
        "Alexander Gordeev" <agordeev@linux.ibm.com>,
        borntraeger@linux.ibm.com, "Sven Schnelle" <svens@linux.ibm.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Kees Cook" <keescook@chromium.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        "Peter Zijlstra" <peterz@infradead.org>,
        "Frederic Weisbecker" <frederic@kernel.org>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        "Ard Biesheuvel" <ardb@kernel.org>,
        "Sami Tolvanen" <samitolvanen@google.com>,
        "Juerg Haefliger" <juerg.haefliger@canonical.com>,
        "Russell King" <rmk+kernel@armlinux.org.uk>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Sebastian Reichel" <sebastian.reichel@collabora.com>,
        "Mike Rapoport" <rppt@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        "Anshuman Khandual" <anshuman.khandual@arm.com>,
        "Zi Yan" <ziy@nvidia.com>,
        "Masahiro Yamada" <masahiroy@kernel.org>,
        "Nick Desaulniers" <ndesaulniers@google.com>,
        "Masami Hiramatsu" <mhiramat@kernel.org>,
        "Miguel Ojeda" <ojeda@kernel.org>,
        "Zhen Lei" <thunder.leizhen@huawei.com>,
        "Xin Li" <xin3.li@intel.com>, "Tejun Heo" <tj@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, tsi@tuyoix.net,
        "Baoquan He" <bhe@redhat.com>, hbathini@linux.ibm.com,
        sourabhjain@linux.ibm.com,
        "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
        "Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>
Subject: Re: [PATCH v4 03/13] arm/kexec: refactor for kernel/Kconfig.kexec
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jul 5, 2023, at 16:19, Eric DeVolder wrote:
> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
> equivalent set of KEXEC and CRASH options.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

> +config ARCH_SUPPORTS_KEXEC
> +	def_bool (!SMP || PM_SLEEP_SMP) && MMU
> 
>  config ATAGS_PROC
>  	bool "Export atags in procfs"
> @@ -1668,17 +1656,8 @@ config ATAGS_PROC
>  	  Should the atags used to boot the kernel be exported in an "atags"
>  	  file in procfs. Useful with kexec.
> 
> -config CRASH_DUMP
> -	bool "Build kdump crash kernel (EXPERIMENTAL)"
> -	help
> -	  Generate crash dump after being started by kexec. This should
> -	  be normally only set in special crash dump kernels which are
> -	  loaded in the main kernel with kexec-tools into a specially
> -	  reserved region and then later executed after a crash by
> -	  kdump/kexec. The crash dump kernel must be compiled to a
> -	  memory address not used by the main kernel
> -
> -	  For more details see Documentation/admin-guide/kdump/kdump.rst
> +config ARCH_SUPPORTS_CRASH_DUMP
> +	def_bool y
> 

I see this is now in linux-next, and it caused a few randconfig
build issues, these never happened in the past:

* The #ifdef CONFIG_KEXEC check in arch/arm/include/asm/kexec.h
  needs to be changed to CONFIG_KEXEC_CORE:

include/linux/kexec.h:41:2: error: #error KEXEC_SOURCE_MEMORY_LIMIT not defined

  same thing on m68k

* ARCH_SUPPORTS_CRASH_DUMP needs the same dependency as ARCH_SUPPORTS_KEXEC,
  otherwise we seem to run into an obscure assembler error building the kdump
  core on architectures that do not support kdump:

  /tmp/ccpYl6w9.s:1546: Error: selected processor does not support requested special purpose register -- `mrs r2,cpsr'

* Most architectures build machine_kexec.o only when KEXEC is enabled,
  this also needs to be changed to KEXEC_CORE:

--- a/arch/arm/kernel/Makefile
+++ b/arch/arm/kernel/Makefile
@@ -59,7 +59,7 @@ obj-$(CONFIG_FUNCTION_TRACER) += entry-ftrace.o
 obj-$(CONFIG_DYNAMIC_FTRACE)   += ftrace.o insn.o patch.o
 obj-$(CONFIG_FUNCTION_GRAPH_TRACER)    += ftrace.o insn.o patch.o
 obj-$(CONFIG_JUMP_LABEL)       += jump_label.o insn.o patch.o
-obj-$(CONFIG_KEXEC)            += machine_kexec.o relocate_kernel.o
+obj-$(CONFIG_KEXEC_CORE)       += machine_kexec.o relocate_kernel.o
 # Main staffs in KPROBES are in arch/arm/probes/ .
 obj-$(CONFIG_KPROBES)          += patch.o insn.o
 obj-$(CONFIG_OABI_COMPAT)      += sys_oabi-compat.o


   Arnd
