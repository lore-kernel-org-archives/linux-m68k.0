Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2093C001B0
	for <linux-m68k@archiver.kernel.org>; Tue, 11 Jul 2023 11:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbjGKLcq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 11 Jul 2023 07:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjGKLcn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 11 Jul 2023 07:32:43 -0400
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F206F127
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jul 2023 04:32:42 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6110358017D;
        Tue, 11 Jul 2023 07:32:42 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Tue, 11 Jul 2023 07:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1689075162; x=1689082362; bh=3i
        BxzwnTyVw6BqHPrJ35gyKi0bdZzNDDY557YK2M5BM=; b=H7uwXwbtdwfCUWjYfS
        zgTdjbt8fxtM5Pb28mR/huI06k1IvvPqw4hdyam/o9wLh6jdLvizXH5ZQxklDpSV
        FBR2nNAQdmcHSZmXLilQ9dcc6MuP3QWa8oB2IhW2o0P/DWdab3W70i6347xG0h8N
        L7iXKiaN5/ayKK7HkXD90lrisKPfb46y0IIKdN4pkE/IkTRyrHAgHFf0UgPbG+No
        enZExOWKk8KjvsmumQVRnQv7eggmyBcDymYqVw4PDAzDnxiOTbSSyLG9uRtsufBG
        wLG3GytQY6cvibjCwWOGIAOYCMwXlgvdo+o+i9J/TpuZALMMrixBgXGq9xKpWA/v
        4CGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1689075162; x=1689082362; bh=3iBxzwnTyVw6B
        qHPrJ35gyKi0bdZzNDDY557YK2M5BM=; b=Rgq5drIfuHuuZkUneRD+VI6DElB7d
        5n/AuoZd0ePjCCw2n2Gnd/geE/5jAyST+jy/QxZJVAF9bfxcCVfUo4x6eZ8VDRjw
        WQ2RD1Ad9q+d19mlEaDWr1aV2szbzILkOvodcUv/xlBn8EQn96wWT6oebDSpAjUM
        czKfx7Y/MyPCanFFnz5sOS+du/U+vwEV9QFVhiowRVvy2pjfdMITy8sh8EeXj0ce
        tcWEVfbHpLavonVLK50zLhuA3pmQx2/pce1QGcB3y6wyrO3DZI5vLaIcy5Oj+7Vr
        oruNupTS5F21XAIYtWr9RnHP+bOqXM2IvqLTXBNtTRTiduCYohpTsuXYA==
X-ME-Sender: <xms:2T2tZKYOMygNw6Aj89mQQ1ghTQ6-yQsd8o7r85aG-9-rzIQIlJQIlQ>
    <xme:2T2tZNZ85LnFoVTTu3wLlUCJ6rMAYupG_5XgADucFfawjtPnfjdALr66wheaO1Jox
    ytE7iH3Dvkl3hyUDLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfedtgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:2T2tZE_DGQ-Q7oe2w7tNuApK4x90Riy4y-owH55cM_dj9YQ402zfnQ>
    <xmx:2T2tZMqOKGeFvcDOqawVN_0M-9RzE1Ikidfr910Z6V2KN8I8DYa34g>
    <xmx:2T2tZFoMCmfr4xdPRGYd1uVu9ZIfzyoNqiT7ixVXkk0SOqXtXPK0mg>
    <xmx:2j2tZFzb8-OhR9fhPlZym1UMLqdjr9HKK5MmjOcHUjEyzVOjoVGZJA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7023E1700090; Tue, 11 Jul 2023 07:32:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <0c59140d-e58d-4fb6-a94c-f829bb802db3@app.fastmail.com>
In-Reply-To: <3098381cf93a5010e878319c6218d2c5851746c0.1689074739.git.legion@kernel.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <3098381cf93a5010e878319c6218d2c5851746c0.1689074739.git.legion@kernel.org>
Date:   Tue, 11 Jul 2023 13:32:20 +0200
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
Subject: Re: [PATCH v3 1/5] Non-functional cleanup of a "__user * filename"
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jul 11, 2023, at 13:25, Alexey Gladkov wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>
> The next patch defines a very similar interface, which I copied from
> this definition.  Since I'm touching it anyway I don't see any reason
> not to just go fix this one up.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
