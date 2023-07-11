Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2157EB64DD
	for <linux-m68k@archiver.kernel.org>; Tue, 11 Jul 2023 11:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjGKLcM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 11 Jul 2023 07:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjGKLcK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 11 Jul 2023 07:32:10 -0400
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8987EE0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jul 2023 04:32:09 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9A8CA580178;
        Tue, 11 Jul 2023 07:32:08 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Tue, 11 Jul 2023 07:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1689075128; x=1689082328; bh=/C
        vj5KuDdmHIGd859qaJsBs/f1fpWATGo78ystxolZ8=; b=HzF5Lj64iIpTlqtt/U
        sveabShinBsVWN7ZS+DWgyJMPU2GSeQFuSUCaVEID6zbvpBcUok2BlUF+h0n+Jsi
        B+RLu5FWxwKLB8yYD47pAPBs2bab9DlxHcB6VwJMrbK3p9CDt7lAEtwhLFrqHyEX
        7fV6jp/WUlNvYhzIeZmZ8ELheVWsz4lvwJI2VXV5H/zoLAgGGMs1cuBZ6wy6//Wo
        lTcLFfuSlHypwPx3xDRLR/oHSmnqF/XLXxzMPsVIUzb0SlCzCAuF5XqLetfBfak0
        atTp6UW4suxvLr2dJBHShODfomx0zMwaugwqmwH78MNM1MRfNA0cez5yZNpOlgRv
        //UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1689075128; x=1689082328; bh=/Cvj5KuDdmHIG
        d859qaJsBs/f1fpWATGo78ystxolZ8=; b=W1/NvmTRCGX/QlW5oKWHfVETVTfbK
        iiaOMfD5xZsr1wjerC+3qL19Z8aSprXPBEYBfWKdxhdG7CPF8CfT1WR3AD/U//Un
        zxx8P3k3a+CRFx0FyzD8zVDjk8KMv1IFossSMGyzZMiE+N5ykkDG7SGHyOk1LSbz
        Bz6m9f+D31N5JQ3EkKQlKNOB/I6NsYPUx+f0YLoOGoGzq72rYerylgYc3CtBcy/n
        AZoZV8e4voliHZSlImIxGtDEa1Ir51MPftiA+USesbUwJs5AoAISF5B7ko8jQ9TV
        ypO52hjhNBQOPxHsSQTj42667JQZjYerNOkA0APolagyhbQRUAfakKLNg==
X-ME-Sender: <xms:tT2tZA4hH3o4izne3FbRuXG2qMPlVHT74IrMecBxjvaUy8gh3b_w0A>
    <xme:tT2tZB7D0dtivUf9jNL7_gVkezoswV2Kx6PyxJ02Dc5k8dQp62kPCknJo5opBw8es
    xJHdRKFCVHHYX0BEkU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfedtgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:tT2tZPdfpeh0H17Fj0xsMjjhRasXPz9RbEKCmDysDhuciVYRZAKqCQ>
    <xmx:tT2tZFIyOZGu1rzltUq4P8BJSV6SxBs1g2wKFNcnL702pktE2075YA>
    <xmx:tT2tZELda_T17jFWEHVJ_J6NJ6sYUjYLJpVzAfstvwJMmjZg5aOreQ>
    <xmx:uD2tZKRIbzNeXyzIyAKNVN2Y2wBmljLCQoSWEDw5YnJyybhC98VOWQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id ECECE1700090; Tue, 11 Jul 2023 07:32:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <55fee4b7-41f0-4f24-ad0e-a4527486bad1@app.fastmail.com>
In-Reply-To: <e48c4d4046de97205fd52a73f77e9b203c3b871e.1689074739.git.legion@kernel.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <e48c4d4046de97205fd52a73f77e9b203c3b871e.1689074739.git.legion@kernel.org>
Date:   Tue, 11 Jul 2023 13:31:44 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Alexey Gladkov" <legion@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-api@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        "Alexander Viro" <viro@zeniv.linux.org.uk>
Cc:     "Palmer Dabbelt" <palmer@sifive.com>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Arnaldo Carvalho de Melo" <acme@kernel.org>,
        "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
        "Jens Axboe" <axboe@kernel.dk>,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        "Christian Borntraeger" <borntraeger@de.ibm.com>,
        "Borislav Petkov" <bp@alien8.de>,
        "Catalin Marinas" <catalin.marinas@arm.com>, christian@brauner.io,
        "Rich Felker" <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        "Deepa Dinamani" <deepa.kernel@gmail.com>,
        "Helge Deller" <deller@gmx.de>,
        "David Howells" <dhowells@redhat.com>, fenghua.yu@intel.com,
        firoz.khan@linaro.org, "Florian Weimer" <fweimer@redhat.com>,
        "Geert Uytterhoeven" <geert@linux-m68k.org>, glebfm@altlinux.org,
        gor@linux.ibm.com, hare@suse.com, heiko.carstens@de.ibm.com,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>, jhogan@kernel.org,
        "Kim Phillips" <kim.phillips@arm.com>, ldv@altlinux.org,
        linux-alpha@vger.kernel.org,
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
        linuxppc-dev@lists.ozlabs.org, "Andy Lutomirski" <luto@kernel.org>,
        "Matt Turner" <mattst88@gmail.com>,
        "Ingo Molnar" <mingo@redhat.com>,
        "Michal Simek" <monstr@monstr.eu>,
        "Michael Ellerman" <mpe@ellerman.id.au>,
        "Namhyung Kim" <namhyung@kernel.org>, paul.burton@mips.com,
        "Paul Mackerras" <paulus@samba.org>,
        "Peter Zijlstra" <peterz@infradead.org>, ralf@linux-mips.org,
        rth@twiddle.net, schwidefsky@de.ibm.com,
        sparclinux@vger.kernel.org, stefan@agner.ch,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Tony Luck" <tony.luck@intel.com>, tycho@tycho.ws,
        "Will Deacon" <will@kernel.org>, x86@kernel.org,
        "Yoshinori Sato" <ysato@users.sourceforge.jp>
Subject: Re: [PATCH v3 3/5] arch: Register fchmodat4, usually as syscall 451
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jul 11, 2023, at 13:25, Alexey Gladkov wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>
> This registers the new fchmodat4 syscall in most places as nuber 451,
> with alpha being the exception where it's 561.  I found all these sites
> by grepping for fspick, which I assume has found me everything.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

In linux-6.5-rc1, number 451 is used for __NR_cachestat, the
next free one at the moment is 452.

>  arch/arm/tools/syscall.tbl                  | 1 +
>  arch/arm64/include/asm/unistd32.h           | 2 ++

Unfortunately, you still also need to change __NR_compat_syscalls
in arch/arm64/include/asm/unistd.h. Aside from these two issues,
your patch is the correct way to hook up a new syscall.

   Arnd
