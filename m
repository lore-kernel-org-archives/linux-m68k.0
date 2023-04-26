Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB9BC77B73
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Apr 2023 03:24:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbjDZDYI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Apr 2023 23:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239146AbjDZDXk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Apr 2023 23:23:40 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E5349DA
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 20:23:30 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 7BE245C0184;
        Tue, 25 Apr 2023 23:23:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 25 Apr 2023 23:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682479408; x=1682565808; bh=Yi7wJEA+WUQji
        phxSCcNrCoNXyunwqEoqdzO/vTK1Ck=; b=UeV3YwpmL7wSOW4zdBrxl87bQtlw9
        619apI+FJCVrrULExVWoJiWe/Hz2dn8J07iTg/SP6XbKL746oXYfBmB1zwvd8c/l
        NYf9mnAqXfuFUs1aRmIAakDOt+yn8R0iB+j7pG66NtGjIYMF9rHeFXt3EpReciNF
        xG555+NbhrnM+Ri88jju0e3GBNpccdDfEG2Xy3RdI/CsOKTOazwFOGo2F0rzmitU
        t3lE3B/icjvzUCct5AX59ios/bh9iML4qTf8ygjQnhYKIVL2QeP07MnaOCO3wUVf
        jIAWAu8Z4vRNaJmk0YUNLzK6n4YgcLmBwZbIc+Xo8DDMVlrBCp1dpIM+g==
X-ME-Sender: <xms:MJlIZArmGA-3cIMj1kKlBXMz22-ZTIBsF6IAI6BNArppbSRG0LbBwg>
    <xme:MJlIZGoKddFRXflrL4_JwwNirbz1Ox2aUsJMkP2XRUDT_u0yarkYZVBZqcA-ZW3Fk
    -QFsm-RsWVsR43Ed3s>
X-ME-Received: <xmr:MJlIZFMDSdNamZlxg7n2jpZwK64bDNoY0IxpSe5mYtlH0DPfWZDkJ6lDwqc1tqKP02Qu9vu3FgGJB4uHBWcMd6N5fFn6P4-ThTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedufedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:MJlIZH5oet7NMqTwFnrM6K7-jr3NML4nDxMvQ0bc2gVIcLobENQkTA>
    <xmx:MJlIZP51a4jFH7f_E-iux7HctP9X5fRsMA5VGu9i7PxY-sgEmn6WMA>
    <xmx:MJlIZHgN0ixY52Aa5mFGuB0YYVSLVHGxWZbwJR0dYJvGIoD0VYPdvQ>
    <xmx:MJlIZJTFOiwbKfDM2WuI5OYVMDlWyK7w9K8CRHk4ZfchEi86gPQjrw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 23:23:25 -0400 (EDT)
Date:   Wed, 26 Apr 2023 13:27:08 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: signal delivery, was Re: reliable reproducer
In-Reply-To: <6dac9c08-ebc1-03d2-4762-fdff937edf2d@gmail.com>
Message-ID: <5c0ba5e6-8f3d-0712-99db-3b8191cfe684@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <87fs8sz6e9.fsf@igel.home> <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com> <878rekz0md.fsf@igel.home> <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com> <87o7nfyd7e.fsf@igel.home>
 <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com> <87jzy3y79y.fsf@igel.home> <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com> <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com> <13d36a79-5aae-d63c-5014-5503688f07bb@linux-m68k.org> <d97fb295-886d-226a-c8f9-6359562d919f@gmail.com>
 <1d9955d2-6016-a238-142a-887f95465dd8@linux-m68k.org> <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com> <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org> <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com> <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org>
 <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org> <87y1mgryp1.fsf@igel.home> <ff777f08-a8a5-6f16-e197-6f2ee2510e56@gmail.com> <6dac9c08-ebc1-03d2-4762-fdff937edf2d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 26 Apr 2023, Michael Schmitz wrote:

> On 26/04/23 07:46, Michael Schmitz wrote:
> >
> > I had thought the 030 could resume the interrupted instruction using 
> > the information from the exception frame - and that does appear to 
> > work in all other cases except where signal delivery gets in the way, 
> > and it also works if moving the exception frame a little bit further 
> > down the stack. So our treatment of the bus error exception frame 
> > during signal delivery appears to be incorrect. Wouldn't you agree?
> 
> Inspection of the format b frame placed in the signal frame in both rt 
> and non-rt cases (at the time the signal handler runs) shows the 
> expected contents in the data output buffer, data fault address and ssw. 
> At that time, returning to user space with rte would correctly resume 
> the instruction execution.  I had previously confirmed that the register 
> contents saved in the rt signal frame is correct also.
> 
> That is with a kernel patched similar to above patch by Finn (using an 
> offset of 128 or 64 instead of 256).

That means things go awry during sys_sigreturn or sys_rt_sigreturn. I'm 
not sure what happens to the exception frame:

1:
        | stack contents now:
        |   [original pt_regs address] [original switch_stack address]
        |   [unused part of the gap] [moved switch_stack] [moved pt_regs]
        |   [replacement exception frame]
        | return value of do_{rt_,}sigreturn() points to moved switch_stack.

        movel   %d0,%sp                         | discard the leftover junk
        RESTORE_SWITCH_STACK
        | stack contents now is just [syscall return address] [pt_regs] [frame]
        | return pt_regs.d0
        movel   %sp@(PT_OFF_D0+4),%d0
        rts

... but I noticed that the sys_rt_sigreturn entry point does 
SAVE_SWITCH_STACK while the sys_sigreturn entry point does not. Yet both 
jump to label 1 above, so both syscalls do RESTORE_SWITCH_STACK. Hmmm.

.macro SAVE_SWITCH_STACK
        moveml  %a3-%a6/%d6-%d7,%sp@-
.endm

.macro RESTORE_SWITCH_STACK
        moveml  %sp@+,%a3-%a6/%d6-%d7
.endm

Well, that has to corrupt %a3, right?
