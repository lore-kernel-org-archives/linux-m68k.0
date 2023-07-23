Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04800C001DC
	for <linux-m68k@archiver.kernel.org>; Sun, 23 Jul 2023 09:59:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjGWJ7C (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 23 Jul 2023 05:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjGWJ7B (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 23 Jul 2023 05:59:01 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B89C10FD
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Jul 2023 02:59:00 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id E9BEC3200392;
        Sun, 23 Jul 2023 05:58:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 23 Jul 2023 05:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1690106337; x=1690192737; bh=EjUDryH15Q7R5
        Eq3qJDKOspGC9ZPqENSgfeiB0KOTkI=; b=yNJ2UV3m+gdydmkJmZjiCuNpggUlt
        Hcex3LA9k8gNsZZ3rMMx+fYz0ubj8S/45z0wLfwWyuHc9a/3rEROGEy1ESDLDW+n
        b9swgZMhCK4viuWfctEppJA1tI8MMK9v+GmPQIfazz5GL1hHBGb/8Hfm7adItN0j
        hL9oWa2RZFd7/tRmYYnS2R2CtVHHlIXISka+qDlmamvJE+ZYJ0JIqfk8KcrmkOjR
        rLi9QuxwWceqjIC2pE+Ty+Fnx46jApYZ3N94dK7D6E7BNJNs31Nt9IFfo2fYDo8A
        Ni3gDROkmNS/wDI4rfXT7RfpocT0ounCvbv41rt4CV4hHXYa9+DwX65zw==
X-ME-Sender: <xms:4Pm8ZH4qnU-RvrD37sAlqMkhEoxFkFVnHGFl-gHRFjBkcX-FQJlN-w>
    <xme:4Pm8ZM5nNtKdrlbmF2Ydegv20kFda6GSY2iUhNstpQa1fRnSapuyIVC_ZkWgK_mFG
    afWzW-cPGY6vUQ5HHA>
X-ME-Received: <xmr:4Pm8ZOeeta8jOBzBfJCnrhlI-MKncIW9xxKdhcq_szZGgW0bChYQ0ZMVobJEqWl8K779otKxvZR_VQcErutDlVVmxG7PcZx8Pyc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrheeigddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepfeeiheejvdetgfeitddutefhkeeilefhveehgfdvtdekkedvkeehffdtkeev
    vdeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehk
    rdhorhhg
X-ME-Proxy: <xmx:4Pm8ZIKe7xDD7l-rd5Si0nJY4UDAhQFWcqU35QvfmPvW6PSF-L9sFw>
    <xmx:4Pm8ZLINi5YZtiwgJAiczQpv9qHkQ2c7Ha2XyyM05O7WQ5Ud4L0FYA>
    <xmx:4Pm8ZBxdgYSLvYfaRvB_TDDIz9_dwTLbl1bxAKmnmfs1LmYNsAAWmQ>
    <xmx:4fm8ZNwRywztdxoPL_gPF7mxdn38KdGZS2RZDU1eZ71aa-rIltkk1w>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Jul 2023 05:58:54 -0400 (EDT)
Date:   Sun, 23 Jul 2023 19:59:01 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
cc:     William R Sowerbutts <will@sowerbutts.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot
 time
In-Reply-To: <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
Message-ID: <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com> <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 23 Jul 2023, Geert Uytterhoeven wrote:

> >
> > First the correct ISA port address (0x3f6) is translated to the 
> > correct MMIO address (0xff400000 + 4 * 0x3f6 = 0xff400fd8).  This is 
> > done when the platform device is declared in arch/m68k/q40/config.c 
> > around line 288.
> >
> > Then this address is passed to pata_falcon which computes the correct 
> > MMIO addresses for the ATA task file registers in 
> > drivers/ata/pata_falcon.c around line 168 (ap->ioaddr.altstatus_addr = 
> > 0xff400fd8 + 1 = 0xff400fd9)
> >
> > The access to the hardware registers is performed in 
> > drivers/ata/libata-sff.c which uses ioread8/iowrite8. These functions 
> > are defined in lib/iomap.c. These functions look at the address passed 
> > it, determine that it is an MMIO address, and pass it to readb/writeb. 
> > This is the first error, we actually want to do an ISA I/O cycle, not 
> > memory cycle, but being passed a pre-translated address confuses these 
> > two functions.
> >
> > arch/m68k/include/asm/io_mm.h defines inb/outb/readb/writeb etc. They 
> > translate the provided address into the MMIO address in the Q40s 
> > physical address space and then perform the MMIO access.  This is 
> > where the second, unnecessary, translation takes place, and the 
> > resulting address is wrong: (0xff800000 + 1 + 4 * 0xff400fd9) & 
> > 0xffffffff = 0xfc803f65 -- and this is the address accessed when we 
> > get the oops.
> 

Could be related to the bug that Michael tackled here?
https://lore.kernel.org/linux-m68k/1623290683-17859-1-git-send-email-schmitzmic@gmail.com/

> Looks like something was missed in commit 44b1fbc0f5f30e66 ("m68k/q40: 
> Replace q40ide driver with pata_falcon and falconide") in v5.14. Before, 
> Q40 used its own IDE driver (q40ide, CONFIG_BLK_DEV_Q40IDE). 

Could be that too.

> It might be a good idea to verify that IDE works in v5.13

Yes, please do.
