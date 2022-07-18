Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2539EC433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 18 Jul 2022 08:41:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233730AbiGRIlW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 18 Jul 2022 04:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234024AbiGRIlP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 18 Jul 2022 04:41:15 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0C0192AB
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Jul 2022 01:41:05 -0700 (PDT)
Received: from mail-yb1-f180.google.com ([209.85.219.180]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MGR3r-1oIaZe11Y5-00GmE1 for <linux-m68k@lists.linux-m68k.org>; Mon, 18
 Jul 2022 10:41:03 +0200
Received: by mail-yb1-f180.google.com with SMTP id f73so19494482yba.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Jul 2022 01:41:03 -0700 (PDT)
X-Gm-Message-State: AJIora8cBg4MxQkvkiObSvhjoBgxOChjWe+UFrlJCvf5grXL6Nyvg1Do
        AidpsvmIKyp6nWXZOMxgN6FhjfhKbubttf634H0=
X-Google-Smtp-Source: AGRyM1v6P9bRfP0SGacMoyNgstO+0kAXXfpT0DxcKtXM2lnDi5JkTyHnmtvpqCyUYAbfe++I5HITDjFfLLAjFIN9yoU=
X-Received: by 2002:a25:9f87:0:b0:669:4345:a8c0 with SMTP id
 u7-20020a259f87000000b006694345a8c0mr25927260ybq.472.1658133650969; Mon, 18
 Jul 2022 01:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220717033453.2896843-1-shorne@gmail.com> <20220717033453.2896843-2-shorne@gmail.com>
 <YtTif+vNq+gkfqsc@infradead.org>
In-Reply-To: <YtTif+vNq+gkfqsc@infradead.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 18 Jul 2022 10:40:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a02R651U9Md8DHT33FgSp56Baiw4sNCWCFBPcMi0bB1-g@mail.gmail.com>
Message-ID: <CAK8P3a02R651U9Md8DHT33FgSp56Baiw4sNCWCFBPcMi0bB1-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] asm-generic: Remove pci.h copying remaining code
 to x86
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Stafford Horne <shorne@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Nick Child <nick.child@ibm.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Pierre Morel <pmorel@linux.ibm.com>,
        Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:O0yVLcYrmhIFtdi6lNFPK9TV2maf6sednC2RgLKlPyd26OWxEhX
 Xn2KSK6xvmv2ziYrfbIqOCRE0vTX9WDr73w2jthXmEWZCOjpsqAaKkQSRoDTrf0OO8c6EgE
 2m33mb7vt73WfaJ6ENTfThYJ7Ayh6gmMZNPtEtEjQ1p39vWxbTStlqGu1eQmI2XVCNDSHLh
 K2JamX0DEp9avlwZ9TqYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rpSWG80U7s8=:L3SQGUyoMJHL6Z52tszrbj
 0bdHVBGvjGE2GgjVjopsBbs42PwBhNuTclECdG003eyM3ASkqC9LmCVjZhkC2wEks5srBxKi/
 lORQIrnM7w6r22hSDItWcdpm4+zjoVgKy6eiwEbQQFy2LKGVbvD21CfHymt/SjgcD6rKe0NfN
 +VOWAiSZWYkni27TiGckArUY7mM1oF8AACCsnbneeP7LB38KsYd4e9KyCWb2Wu5xAtVKYEpMR
 sdak98pe6vXLLZ0k8ImB9+b0T+GS9z9zF1vqSA7/CJQgpAkMPhYwZLh9THNRBoPm4Lv3BaQYs
 rHh9MCxJRqEtjlrPUUXZduYidq4lu5QfrI32veNb2G7Rkbv40qnH55G7S4I/cnn9Ojp80/hyp
 AlvXUaW7NvK7yo2h2XNbh+S6mUUzCM9+MmcyRTvAYCDkgwi/FBrU87M944GKBwr74qJPBL6ba
 Fmj9ZqjJvK1L0URRUTfkq7WNV92ouaui/YFT90B0aCmzJ2hF1iwXyaN4IvQFQWuaqqATRhZlA
 L3EGepG2XNkZO3YbDZFMEEfyXTnpHc17cR3iKKhf022RLfFzCn98JfjMlLM7evYBcWzljOFLl
 e06cqmDQAnV4kNjwSqtWHlNg1NELW9KKw7gwCXValbCm+1hShIb+9coV/WkuuFa+AVYtleM6X
 lg1qbKuaTPu08/M7QPrJ5We3t3EvwVt7ffS0md6kyv+PAL0llja+CsNLrPh2X84p8COneUgfA
 KT984sxkm1c1RWmPoYsyaQkV5Kr/2PY0jkhyfm2/rPncmW2wHciBPknBQz54+wlxiS6+537BZ
 umrBXrQWMymFGXAqPFW3ywCWypTiVmacVncHrliqGb2SxcV/IOoTzzStNLtYcEA3t8GHZUYMG
 vYACVUXmtk8lSWskXO1Q==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jul 18, 2022 at 6:33 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sun, Jul 17, 2022 at 12:34:52PM +0900, Stafford Horne wrote:
> > The generic pci.h header now only provides a definition of
> > pci_get_legacy_ide_irq which is used by architectures that support PNP.
> > Of the architectures that use asm-generic/pci.h this is only x86.
>
> Please move this into a separate header, ike legacy-ide.h.  It doens't
> have anyting to do with actual PCI support.

It looks like asm/libata-portmap.h is meant to have this information already,
and this is what libata uses, while drivers/ide used the
pci_get_legacy_ide_irq()
function for the same purpose.

Only ia64 and powerpc have interesting definitions of both, and they
return the same thing, so I think this is sufficient to remove the last caller:

diff --git a/drivers/pnp/resource.c b/drivers/pnp/resource.c
index 2fa0f7d55259..d7a6250589d6 100644
--- a/drivers/pnp/resource.c
+++ b/drivers/pnp/resource.c
@@ -16,7 +16,7 @@
 #include <asm/io.h>
 #include <asm/dma.h>
 #include <asm/irq.h>
-#include <linux/pci.h>
+#include <linux/libata.h>
 #include <linux/ioport.h>
 #include <linux/init.h>

@@ -322,8 +322,8 @@ static int pci_dev_uses_irq(struct pnp_dev *pnp,
struct pci_dev *pci,
                 * treat the compatibility IRQs as busy.
                 */
                if ((progif & 0x5) != 0x5)
-                       if (pci_get_legacy_ide_irq(pci, 0) == irq ||
-                           pci_get_legacy_ide_irq(pci, 1) == irq) {
+                       if (ATA_PRIMARY_IRQ(pci) == irq ||
+                           ATA_SECONDARY_IRQ(pci) == irq) {
                                pnp_dbg(&pnp->dev, "  legacy IDE device %s "
                                        "using irq %d\n", pci_name(pci), irq);
                                return 1;

This is fine on the architectures that currently return an error from
pci_get_legacy_ide_irq() but will change to returning 15/14 instead,
because they do not support ISA devices, so pci_dev_uses_irq()
will never be called either.

        Arnd
