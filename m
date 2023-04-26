Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4ECBC7618E
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Apr 2023 04:38:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239347AbjDZEil (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Apr 2023 00:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238411AbjDZEik (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Apr 2023 00:38:40 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7ED726AB
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 21:38:39 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 928BB5C0145;
        Wed, 26 Apr 2023 00:38:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 26 Apr 2023 00:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682483915; x=1682570315; bh=bPtAEMjWwUw9d
        Vd4Nf+yv6sEyKso4p4kEhYD32z6tks=; b=COdJQ7pX1kyK69AZ/fgLl1swZ4HOP
        VyHbpbgslBcmZTPntWJrmaEFa3CcdmBQEDXzCk/+/7Oy5KnvfibHEJG0P5MnZWC8
        omHQ2TVB/82AyB4qSLlGJq0mwRBRQGDwvaRwI09NT/PSin9DOjA75RmhctGqvPxy
        wMwXi0nzoaGpNeIsjVUEwy8RkR8lZsjH71CK2bkjptAL2y1GM3rNEF4/gZCbhROz
        VrzZZLgov3rtfgKsGEzcpenD7XGkIUmi4ValXGTcRyK65/Ls/AA+BXHw4RNkA3uZ
        gl7M1ZkSV+OygX6MPv3sFJCx+P8HC73p5fM8OUQry/A5gk4AoasepIESA==
X-ME-Sender: <xms:y6pIZGJc752Qz1GKY50xRBPogVUywKLpxQkzhNwLgL8dh0fbTTMwBQ>
    <xme:y6pIZOJ9OLp2pQH2n9P7JHgj2DmRm6ljQ8kHfJQZF32AI7lYbmtIQC1AAqvlj2mRa
    LLFUfhjALO7Z4EjAD4>
X-ME-Received: <xmr:y6pIZGv93grq7DAV36h06zuMKskZAisL2XHzrpRipJvlajpYrUsPG05l9zSIV9kTW8WkUSeDiVgOduLJd-sMSuaShoyriBCWEzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedufedgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:y6pIZLZ0J6ZCDAgTMnvJ7Ct01uMzUOpzo4XC-MSD5xCiycxtkDlg5w>
    <xmx:y6pIZNb5s9naU4B8ZvE5cQvnMlkpHVJwwaIv3kWRoflZhFW2WdEBZQ>
    <xmx:y6pIZHBARsos5kUmU_h45jkyU0Ew6IWtgvBEP-a-PVhkeSr1HqKCiQ>
    <xmx:y6pIZMwgOPBcih-chGZ-9lSTnD-NYesdA_apGEueiG7SGuigC9IORA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Apr 2023 00:38:33 -0400 (EDT)
Date:   Wed, 26 Apr 2023 14:42:17 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: signal delivery, was Re: reliable reproducer
In-Reply-To: <63d4ef2b-ffdc-0294-30c8-aac50ee7b946@gmail.com>
Message-ID: <f408a661-06d5-be01-e3b5-931647cd8617@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <878rekz0md.fsf@igel.home> <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com> <87o7nfyd7e.fsf@igel.home> <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com> <87jzy3y79y.fsf@igel.home>
 <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com> <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com> <13d36a79-5aae-d63c-5014-5503688f07bb@linux-m68k.org> <d97fb295-886d-226a-c8f9-6359562d919f@gmail.com> <1d9955d2-6016-a238-142a-887f95465dd8@linux-m68k.org>
 <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com> <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org> <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com> <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org> <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org>
 <87y1mgryp1.fsf@igel.home> <ff777f08-a8a5-6f16-e197-6f2ee2510e56@gmail.com> <a72de14b-2e3a-60c3-0aba-81e36d2a68ae@linux-m68k.org> <63d4ef2b-ffdc-0294-30c8-aac50ee7b946@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 26 Apr 2023, Michael Schmitz wrote:

> It seems I got confused about user and kernel stack there myself. And 
> managed to confuse almost everyone else about this bug. Apologies for 
> the incessant noise.
> 

Likewise... I think it amuses some readers and annoys others ;-)

> What matters for the return from exception is an intact frame on the 
> kernel stack. Anything we do on the user stack (mucking around with the 
> offset the sigframe is set up at, copying siginfo, ucontext or 
> sigcontext plus exception frame extra) does not change the kernel stack 
> one whit.
> 
> The mangle_kernel_stack stuff is needed because sys_sigreturn will place 
> another exception frame on the kernel stack (a four word frame) that 
> needs to be replaced by the bus error exception frame (or any other 
> frame that caused the kernel mode entry prior to signal delivery) before 
> finally returning from the bus error exception.
> 
> Only at that time will the movel instruction that took the bus fault 
> resume (and complete its writes correctly, I hope).
> 

If the long format frame was corrupted while on the user stack, the 
partially completed MOVEM won't be resumed correctly. That's why I was 
concerned about a bug in sys_sigreturn.

> Our problem may be that, if we take the signal too late and our main 
> process inspects the stack that has been left partially saved only (due 
> to the bus error processing still in-flight), we appear to be in 
> trouble. After completing sys_sigreturn, everything will be OK.
> 
> I can see this cause the stack error in the test case. Not sure it also 
> applies to the dash case ...
> 
> > Wouldn't that depend on the exception frame format? Perhaps it is 
> > unsafe to treat any format 0xB exception frame in the way we do. If 
> > so, what do we do about address error exceptions, which are to produce 
> > SIGBUS? The Programmers Reference Manual says "a long bus fault stack 
> > frame may be generated" in this case.
> 
> We don't handle access errors (beyond terminating the offending 
> process).
> 

SIGBUS could be caught and handled, perhaps followed by a setcontext() or 
siglongjmp() rather than return. So I don't think we get to disallow frame 
format 0xB.
