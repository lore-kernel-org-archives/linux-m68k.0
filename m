From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH RESEND 4/4] m68k/atari: fix SCC initialization for debug
 console
Date: Sun, 25 May 2014 20:37:53 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1405252030460.18784@nippy.intranet>
References: <20140411052757.888960081@telegraphics.com.au> <20140411052759.169790206@telegraphics.com.au> <CAMuHMdUnoZVpq79LPPFN1dop8r0fMJYi7knT9a+pUHFqBAxEfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:39536 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751342AbaEYKjI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 May 2014 06:39:08 -0400
In-Reply-To: <CAMuHMdUnoZVpq79LPPFN1dop8r0fMJYi7knT9a+pUHFqBAxEfQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Sun, 25 May 2014, Geert Uytterhoeven wrote:

> Has anyone tested this on Atari?

The patch doesn't change behaviour. If someone wanted to test it, they'd 
also need to make changes like this:

diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
index 3ab329b..b210a29 100644
--- a/arch/m68k/kernel/head.S
+++ b/arch/m68k/kernel/head.S
@@ -2752,7 +2752,7 @@ L(scc_initable_mac):
 #ifdef CONFIG_ATARI
 /* #define USE_PRINTER */
 /* #define USE_SCC_B */
-/* #define USE_SCC_A */
+#define USE_SCC_A
 #define USE_MFP
 
 #if defined(USE_SCC_A) || defined(USE_SCC_B)

That difficulty is one reason why this patch series replaces some other 
buried macros with Kconfig symbols...

-- 
