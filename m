Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244B2C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 05:23:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC7CA60F8F
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 05:23:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhIMFYR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Sep 2021 01:24:17 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:55781 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229563AbhIMFYQ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 13 Sep 2021 01:24:16 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 46AA93200907;
        Mon, 13 Sep 2021 01:23:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 13 Sep 2021 01:23:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7ctCr2
        lcnevb9WtDGsYvm66UNq21wBWVZ2X7s0aTxls=; b=nE2Dv0v7kR64ZfnBOOMf+6
        Cr6+u068BFTYiNvMwLaRT7ByoPbg5Jdmcipbm3kaZ0GfLWSzuIk1e2DmdkL/glKx
        7lNyObrT4P178K7QUZuSEm8LLw/urzDNoKViR0jr3PdjmoReBTrOCIxvf004R+Gm
        fJRkHVPW/Nx0Q/hmWso1tfJDHFWEMG8Y7REsKST1OWZ2doBRhh3XytjDJHAN2VF4
        f7ML/Cti8U3nbqfpx6ZpCWrCQse81qBIrrrVuazh2mm+N76mbL6P5xN625PnGfmA
        IKTKw2Rqdor+G9uKQ7xJwmLNuTB5fAns1xiR1oqdnVFQm2WEp6Q8IFMrPv/xnsIA
        ==
X-ME-Sender: <xms:NOA-Ye6alCjHfl-ny9IPmcYNGl8kFTMPMwhwP4sQwKzGbOJg9steoQ>
    <xme:NOA-YX7n1UnsNJ4UmEPO5Vb_l3rS7fkojAQKNuz1fSv9gH1FczXs9z4ksfWgaCaZ8
    GeavguQkaoL_ffM7Wk>
X-ME-Received: <xmr:NOA-Ydccl0Etd-9F5VWUd5ovda09IKun742sE2Pp4p5gsl_T3fU6qd1PtO8CeG_QwwGg77sPwV8vBB5DkM3T9yyWB4iz0C4P34UT0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegiedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
    uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:NOA-YbLdV_4sdo-4PW8-4I1EmEBz-krRNvCGExZiTjFDpBP2mKNVuQ>
    <xmx:NOA-YSIV8zQnt9V39S1L4dal83ebqQZ0cd1MfUpuGTNf1qZsLIJYXg>
    <xmx:NOA-Ycwnu2hbdUaI4JoqqguVX2ThYNWr1an5h6D937PcCFoifbENaQ>
    <xmx:NOA-YRlMVIbjPVzjE1mOsJb24sw7m5272kGfAlV6sCWQQpoCDSvwfw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Sep 2021 01:22:57 -0400 (EDT)
Date:   Mon, 13 Sep 2021 15:22:50 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@vger.kernel.org
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
In-Reply-To: <82f6f161-b9e0-bf9b-3c20-aa2ce810d99a@gmail.com>
Message-ID: <4564a46-2115-9058-2a9-2d77736291c@linux-m68k.org>
References: <20210721170529.GA14550@lst.de> <83571ae-10ae-2919-cde-b6b4a5769c9@linux-m68k.org> <dc594142-e459-533e-cac2-c7a213cec464@gmail.com> <f4ab2dcb-6761-c60b-54ce-35d0d017d371@gmail.com> <d772d22e-a945-3e35-80a2-f4783893bea@linux-m68k.org>
 <b2c55280-657b-51c2-065c-3fc93db050b9@gmail.com> <d7b8f7eb-fc18-c8d-fe3e-dcdf19d3f4b@linux-m68k.org> <755e55ba-4ce2-b4e4-a628-5abc183a557a@linux-m68k.org> <b52a10fe-3e4b-5740-d3f8-52bce3bc988@linux-m68k.org> <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org>
 <ed2ca322-b957-cd52-8d2f-a8edd2785625@linux-m68k.org> <977bb34f-6de9-3a9e-818f-b1aa0758f78f@gmail.com> <fa8682aa-c5f4-7995-166d-8fa899594b19@linux-m68k.org> <42b30d4f-b871-51ea-1b0e-479f4fe096eb@gmail.com> <7ac7a41a-53f9-b13c-83fa-2c6b8ef2b90@linux-m68k.org>
 <0477f373-86c9-dacb-a7b1-25fe4b3befd3@gmail.com> <2c624213-6a4-799c-45e-a1be578dd5f@linux-m68k.org> <d59a44c-ddea-a774-d217-2484ad582dc0@linux-m68k.org> <82f6f161-b9e0-bf9b-3c20-aa2ce810d99a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 13 Sep 2021, Michael Schmitz wrote:

> > 
> > [23982.680000] list_add corruption. next->prev should be prev 
> > (00b51e98), but was 00bb22d8. (next=00b75cd0).
> 
> I chased a similar list corruption bug (shadow LRU list corrupt in 
> mm/workingset.c:shadow_lru_isolate()) in 4.10. I believe that was 
> related to an out of bounds memory access - maybe get_reg() from 
> drivers/char/random.c but it might have been something else.
> 
> That bug had disappeared in 4.12, haven't seen it ever since.
> 

Do all of your builds have BUG_ON_DATA_CORRUPTION and DEBUG_LIST enabled?

> 
> Incidentally - have you ever checked whether Al Viro's signal handling 
> fixes have an impact on these bugs?
> 

I will try that patch series if you think it is related.

So far the problem seems to be confined to one machine. Stress tests on 
other mac models did not yet reproduce the problem.
