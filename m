Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F0CC77B60
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Apr 2023 04:59:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjD2E7k (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Apr 2023 00:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjD2E7j (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 29 Apr 2023 00:59:39 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A282136
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Apr 2023 21:59:38 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id A25EA320097D;
        Sat, 29 Apr 2023 00:59:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 29 Apr 2023 00:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682744375; x=1682830775; bh=3JMq6gHs3Bx+4
        qo23Y/HtvUycq+0bUnTkH+6tnJNjmE=; b=cXSO0eDrzm6EVZ6VJDVjZMOHjnVc5
        ha+CHzAddJUoRP7phhJ0S2LCDZzXr6jhJQ32R167g9Lh/5DLyTfu6eSFP3Qy8vcr
        VEsbaV0kjadVv4Bau0hghN2jIffnZLkmRt2kzxg5Iqo3UOQQx5n1NHfCSmQTEF2q
        YaW/tNLha3QIwaXHnW5lHeLvoDIIWi/ua/zMWgWe/oLb4DZ/bPdyDd+lCUhxsH8y
        P+0IzI4njSos27mCkxlfu61gkGoXP6eEqfRb6Qkze/UjuPnmZbJ9WuFrWyXTm+kB
        PyjQJa2AsFL8X6oSOTQSL0M6V34G/1L3jc37Tpag73t01BAQvalKVsKlw==
X-ME-Sender: <xms:NqRMZAJWXoivFW8x0fCaPK14o1OfyidwTy7nTkOvBRMBP8PqIwP7Pg>
    <xme:NqRMZAKHPh-1cyFrbkKRUSng4XFIKpJwzKkt-dcQ8ltiaDpvDnDBL41fJXwn_OzGU
    EofDW0PNJR2wyUAIGs>
X-ME-Received: <xmr:NqRMZAugI6TwINeSdwMCUCt7RidpD5TiY6iw3sFWgQH8Cmt2KiXXLoSvSvlvBPfZLh4BLfjg3HhxMFmPyEQXtQwjscGObWNxEvE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduledgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:NqRMZNZy_D1bz1yuWmq0Itwr0ox_QEjjuCCPwOjQpxd0yQBH_D53SQ>
    <xmx:NqRMZHbtNOESSdPTMdPjPkJUyU6mLZFTquGETT0RDsoQfRLqrU4bQQ>
    <xmx:NqRMZJC7jy6oDfjGgBx-vKlpb4nyzRc5bl-cx15ML-u6fXuG0hH5RA>
    <xmx:N6RMZB3Y9w1YjCBbbzpY3BCwmTyILXay0pxZOBOqkGv2yKCDw3H7Xg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Apr 2023 00:59:31 -0400 (EDT)
Date:   Sat, 29 Apr 2023 15:03:19 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@lists.linux-m68k.org
Subject: Re: signal delivery, was Re: reliable reproducer
In-Reply-To: <13d2b2f4-ad99-02a8-db89-828a4c20fe54@gmail.com>
Message-ID: <ae06a4dd-fbc2-7924-9f7d-b8e0a92a8a7d@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com> <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org> <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com> <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org>
 <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org> <7c86ad1d-7bbd-8f61-5ac4-56a1b99a8663@gmail.com> <1ac37684-2696-6103-10d9-92914b0497a1@gmail.com> <1c4fc19f-ad9b-7b8f-6638-8b026fe1280b@linux-m68k.org> <5ac55169-4916-d671-489f-7eb8fb85d336@gmail.com>
 <9544ef26-a444-e186-fb1e-0e914acd36af@gmail.com> <20de24b3-098d-4603-2768-b0468a4fe772@gmail.com> <69565abb-1cd6-716e-046e-5a6d69a4e617@linux-m68k.org> <89cb2211-5f6e-07a2-3149-1ad1ad887265@linux-m68k.org> <d3d27369-8532-ba69-2463-66b8decbee67@gmail.com>
 <4b4eacf2-6934-5563-fb47-04843a77a35c@gmail.com> <dad59503-34e4-bc0e-db29-f53b951afc78@linux-m68k.org> <13d2b2f4-ad99-02a8-db89-828a4c20fe54@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, 29 Apr 2023, Michael Schmitz wrote:

> Am 29.04.2023 um 12:28 schrieb Finn Thain:
> >
> > Right. If we fix this in the signal handling code, we take care of 
> > address errors as well, which was my concern with Andreas' patch. We 
> > can do what do_page_fault() does and assume the worst (256 bytes?).
> 
> Well, we could do that if we could be certain this does not cause a 
> memory leak in some way. The reason I bring this up is that I've just 
> seen the kernel that I'd used to run the latest test cases (which 
> inserts a 20 byte gap only!) run amok terminating pretty much my entire 
> user space because it ran out of memory. Never seen the like of that.
> 

If the test program ran out of stack space it would not trigger the OOM 
killer. So that incident probably has something to do with upgrading your 
kernel (?)

Anyway, I agree that stkadj would need to account for the gap, as you 
pointed out earlier.

> > I believe we can use USP to get a worst case estimate for the future 
> > extent of the user stack. ...
> 
> What is the most data a moveml <...>,sp@- can take? If that's not too 
> much, a constant offset for the signal stack in case of format b frames 
> on 020/030 might be easiest.
> 

I think it's 64 bytes (16 registers). But we also have to consider all of 
the other instructions that may write to the stack. There's probably a 
reason why do_page_fault() picked a 256 byte gap (?)

> But we need to find something that works in the general case (and then 
> analyze the performance impact it might have in stack and signal heavy 
> applications - I might have mentioned that before, but your equivalent 
> to Andreas' patch seemed quite a bit slower in the test case than when 
> signals were allowed after format b bus faults. Interrupt latency, most 
> likely).
> 

The alternative is to use more stack memory, which means marginally more 
paging. Choose your poison...
