Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA2EC001B0
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 17:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235897AbjHPR4L (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 13:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345355AbjHPR4K (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Aug 2023 13:56:10 -0400
Received: from mail.sowerbutts.com (mail.sowerbutts.com [IPv6:2001:8b0:3b1:dead::100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F618270D
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 10:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sowerbutts.com; s=igor; h=In-Reply-To:Content-Type:MIME-Version:References:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=O+U8CV+MoOSDj9EsqyBydKpsXRHfknLX8VVs1AOdBZM=; b=mAykwkN4EO8S0w5zdATt9qr2qo
        w++trd2+Yx9t/CnWyTOsMzQ0Qcc3gjtCnIIDXDgLzpVdO65lVjorwNiFu5ZtjeWi6V4R/SSfd1Wio
        ES9nUlQLMxSK9xo7atN0UZpOoK96T0PkT8zSxuAd1CmXklfENup3OwlWKWu/NWlcHObK6toKGX1io
        6Wq3lWFoaSGS84djou+4UqLiLSzhwW9plocN2qmdoqvEfid1zUl9mSpW3+65Fqn2B/igyw3ztWqvm
        fNrrau0KxLGvBMb/CxUi8+l5bzhKTUGvXwebE30P1r7WRrbekggPSQBHqBtNHRRUEvh1P1gMwSGUk
        shb8xdZQ==;
Received: from badhorse.sowerbutts.com ([2001:8b0:3b1:beef::bad] helo=sowerbutts.com)
        by mail.sowerbutts.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <will@sowerbutts.com>)
        id 1qWKkW-000Ym0-1E;
        Wed, 16 Aug 2023 18:56:04 +0100
Date:   Wed, 16 Aug 2023 18:56:04 +0100
From:   William R Sowerbutts <will@sowerbutts.com>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Message-ID: <ZN0NtE0PA6bXVUGc@sowerbutts.com>
References: <ZL5jwoXAU5t8S+E6@sowerbutts.com>
 <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
 <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org>
 <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
 <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org>
 <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
 <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org>
 <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com>
 <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org>
 <ZNlYFCVubNgzmUfc@sowerbutts.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="uE0DkXesoZE2LxsF"
Content-Disposition: inline
In-Reply-To: <ZNlYFCVubNgzmUfc@sowerbutts.com>
X-URL:  http://sowerbutts.com/
X-Hatstand: Voltron
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


--uE0DkXesoZE2LxsF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 13, 2023 at 11:24:20PM +0100, William R Sowerbutts wrote:
>I am going to look at the pata_legacy driver and see if it might be usable 
>on the Q40 instead of pata_falcon.
>
>As a long term fix I think I need to read up on CONFIG_HAS_IOPORT_MAP to try 
>and understand how I might enable this.  I expect enabling it will have
>implications for all M68K machines, so maybe someone with more experience 
>should be making that decision.

Enabling CONFIG_HAS_IOPORT_MAP for the Q40 turned out to be simple.  Attached 
is the patch I am using -- it just sets NO_IOPORT_MAP=n when Q40 is enabled.

Enabling CONFIG_HAS_IOPORT_MAP allows pata_legacy to work on the Q40 with no 
further changes!

pata_legacy drives the IDE interface perfectly.  The data is byte swapped, so 
I think pata_falcon still has a place for Q40 users who want to use legacy 
reverse-byte-order disks.

I tested bulk transfer performance (exactly the same way as I tested 
pata_falcon with and without byte swapping); pata_legacy performs much the 
same as pata_falcon with byte swapping enabled (as one might expect).

I suppose the next step is to build a kernel supporting both Q40 and perhaps 
Atari, then test this in ARAnyM.  I'll try this out over the next few days.

Thanks

Will

_________________________________________________________________________
William R Sowerbutts                                  will@sowerbutts.com
"Carpe post meridiem"                               http://sowerbutts.com
         main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
         (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}  


--uE0DkXesoZE2LxsF
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="linux-6.4.10-q40-ioport.patch"

diff -urN linux-6.4.10.orig/arch/m68k/include/asm/kmap.h linux-6.4.10.q40/arch/m68k/include/asm/kmap.h
--- linux-6.4.10.orig/arch/m68k/include/asm/kmap.h	2023-08-11 11:14:29.000000000 +0100
+++ linux-6.4.10.q40/arch/m68k/include/asm/kmap.h	2023-08-16 00:34:12.894812394 +0100
@@ -58,6 +58,7 @@
 
 #endif /* CONFIG_MMU */
 
+#ifndef CONFIG_HAS_IOPORT_MAP
 #define ioport_map ioport_map
 static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
 {
@@ -68,5 +69,6 @@
 static inline void ioport_unmap(void __iomem *p)
 {
 }
+#endif /* CONFIG_HAS_IOPORT_MAP */
 
 #endif /* _KMAP_H */
diff -urN linux-6.4.10.orig/arch/m68k/Kconfig linux-6.4.10.q40/arch/m68k/Kconfig
--- linux-6.4.10.orig/arch/m68k/Kconfig	2023-08-11 11:14:29.000000000 +0100
+++ linux-6.4.10.q40/arch/m68k/Kconfig	2023-08-16 00:27:50.044269922 +0100
@@ -61,7 +61,8 @@
 	default y
 
 config NO_IOPORT_MAP
-	def_bool y
+        bool
+        default !Q40
 
 config HZ
 	int

--uE0DkXesoZE2LxsF--
