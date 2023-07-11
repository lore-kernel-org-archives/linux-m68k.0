Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A03C0015E
	for <linux-m68k@archiver.kernel.org>; Tue, 11 Jul 2023 11:42:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbjGKLmo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 11 Jul 2023 07:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbjGKLmm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 11 Jul 2023 07:42:42 -0400
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C98C1A3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jul 2023 04:42:41 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id 62331580233;
        Tue, 11 Jul 2023 07:42:40 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Tue, 11 Jul 2023 07:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1689075760; x=1689082960; bh=ky
        TmtQ94Bg/o37lAnBcJXDTnDF6sa4YBDC0JstTG714=; b=cCXa+nxMGpyNXEY2Hl
        iIY0GaQ43JSV/7Brik2QU47h/O0ZGLZmBA1fh2THtqGsZmVh1PfFp5JgGnQ99QYI
        HrnoMrGDJyobAtWFUHHRwshNaTbLw+QYTPibyEm3UtKtQHdEczFD/GX+wFTCR7PY
        HdkYFiCWZ8BRRCJEsd18s8XJtQb51J85MCJk1Hp/jMsfnqxG1wMrs5IYJcrx9Ojh
        QSLJ5qAqOwC2nvcU9CHMlcoGykzaAs44QtfyB4p6q4kE0bCSo+B2qg4AtZ52Jq5M
        97dKJHlgmnM5uxgSMvmvRNuRulgf0CvpmSSn1qka9gsizGyWAWoLQ+Ra4ONnwqzS
        LCVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1689075760; x=1689082960; bh=kyTmtQ94Bg/o3
        7lAnBcJXDTnDF6sa4YBDC0JstTG714=; b=Nc7Rjk/7PPAkaeKyL39OpIc/i58KX
        oQYRCp7e+QjDXcoMcU3wowrAjI/QFwUgLhpDrydps1157zxrnjzpMrxOBhEetTdx
        rjDnBmiWa5Y1J53R2WWzkP4jjvdoV64C5Aq8mpI+igvw1Ua1JfbDhuqN78pZg/Z4
        nPLI2nz/XDzVaccl4hhk4vACPJV1zgYNiW9jQj4JEDXdjnFXJh6bacHzMqR0n6Bi
        fjIwPkszBsEtseU6+gVYwVatcu4zNWhinzneCSr+ZXsCa7nZAaW4LzHYtCKJTFZx
        JbIpq+r9AlQrC8eJcXSxMRUzqKyLAYG3AJzWtl0Mqgcs0vzVCloj8oT5Q==
X-ME-Sender: <xms:L0CtZKOoya8owNRVrouMWlWqx5g41SsODtwBsBogterKj4mpJ9POEQ>
    <xme:L0CtZI9bmR7eEArcOZstvH4a0BXfYzTe2CNojJnJaA60YmYS5mgJrMmO60YeplRNH
    JgsDB1Ntx3ZuRfaH14>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfedtgdegfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpefffeefudevhfehgfejudffudfhjeeftdfhfedtffehieelgfekveeifedujeej
    ueenucffohhmrghinhepshhouhhrtggvfigrrhgvrdhorhhgpdhmuhhslhdqlhhisggtrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    rghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:L0CtZBTOwjCetvK7M28ENpQccizEUAlDbDctrq45rRHg4U9K0lf_Bg>
    <xmx:L0CtZKsia18sXovi4Mc4UDO-bKU1NFfXnWGVUaoxQ-q9cf_d8Y0nZA>
    <xmx:L0CtZCcpq10abI-ror0OvQO423Pp0-EnBcXccNV1Ds6Uz5PJBUSuzw>
    <xmx:MECtZPXg2HGCUL9I2Q0CpLUAP7VMCdzXv-GbCpQ6U0XmAQfkt0NYFQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 3F8831700089; Tue, 11 Jul 2023 07:42:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <83363cbb-2431-4520-81a9-0d71f420cb36@app.fastmail.com>
In-Reply-To: <d11b93ad8e3b669afaff942e25c3fca65c6a983c.1689074739.git.legion@kernel.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <d11b93ad8e3b669afaff942e25c3fca65c6a983c.1689074739.git.legion@kernel.org>
Date:   Tue, 11 Jul 2023 13:42:19 +0200
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
Subject: Re: [PATCH v3 2/5] fs: Add fchmodat4()
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jul 11, 2023, at 13:25, Alexey Gladkov wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>
> On the userspace side fchmodat(3) is implemented as a wrapper
> function which implements the POSIX-specified interface. This
> interface differs from the underlying kernel system call, which does not
> have a flags argument. Most implementations require procfs [1][2].
>
> There doesn't appear to be a good userspace workaround for this issue
> but the implementation in the kernel is pretty straight-forward.
>
> The new fchmodat4() syscall allows to pass the AT_SYMLINK_NOFOLLOW flag,
> unlike existing fchmodat.
>
> [1] 
> https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/fchmodat.c;h=17eca54051ee28ba1ec3f9aed170a62630959143;hb=a492b1e5ef7ab50c6fdd4e4e9879ea5569ab0a6c#l35
> [2] 
> https://git.musl-libc.org/cgit/musl/tree/src/stat/fchmodat.c?id=718f363bc2067b6487900eddc9180c84e7739f80#n28
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

I don't know the history of why we ended up with the different
interface, or whether this was done intentionally in the kernel
or if we want this syscall.

Assuming this is in fact needed, I double-checked that the
implementation looks correct to me and is portable to all the
architectures, without the need for a compat wrapper.

Acked-by: Arnd Bergmann <arnd@arndb.de>
