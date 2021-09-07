Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96662C433F5
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Sep 2021 23:50:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 769DB60041
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Sep 2021 23:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbhIGXwE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 7 Sep 2021 19:52:04 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:56955 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231519AbhIGXwE (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Sep 2021 19:52:04 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id E6C445C0058;
        Tue,  7 Sep 2021 19:50:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 07 Sep 2021 19:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=edRlyL
        E+/ZUaqZlIGbdYMwq3j5dlLhen7foTFFWhycc=; b=rGaCbW9tCRS2/DQFx8O2jO
        kBQjFtUPgTLhG9KjbqFaGR16850U1RMoT6S+U4u4b9zeEqf7ViwIHurLHDV9EmCj
        me7A9AaBgcdKhsRqkTN4DUSFUtOtS2TuO74d9Rtj0CFNLAHxKNJx9bk6lD/6JDwi
        wfRIYdoEv+J18IrpqAx0TsYsEwjj0jlQ+Ew9ssA4DJz37HMHHyrGnn/iALl3rWFp
        6/LU+ZHKhjdw+O746R8X4TgHw491OMNhjGPMEBWg7JY3yO6E/mZ1eA/1hpw0UElP
        AnMmnBhYvMyf72OI1zsHceXolrRKfc8QJVlxj5Xy3GPjW5ZOWpL8oRqu8LT2BxXA
        ==
X-ME-Sender: <xms:3_o3Yf2KiPC0m1DrlszRCTeOwpgph-PZpV3-ZS3Ej-6zQqq-0BUERQ>
    <xme:3_o3YeGXNOZnd_yqUxJ-H4RUA4cPIspXdU7sjyPCEWnwL0Y2RP0x5JlnmJ9Ybq9a0
    OOliU_Hfj7JrTGlbYc>
X-ME-Received: <xmr:3_o3Yf4opV3_iUe49X_cn7mu-iPLJuh6Fs5NYyt9AJ8AuH47nX4I1hX36nSpdUAoG1ZVRRb_mPvuyp9npIJuaFSHJtPtYku1-dccvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefiedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
    uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:4Po3YU0UMpXhlQmrIQleqqtrT_9P2vefGyY3vmAb2Cm1EiyQV9vLVA>
    <xmx:4Po3YSGXzz2Sl-byilCatA6emmgyBt4mWZ6JAOFIlVM-OQGK4gTFaA>
    <xmx:4Po3YV-bfUTQjrVjq4aojaGmevdqO3_Mp9nXEFBVmtccCucHupjevw>
    <xmx:4Po3YdyFZXm65b-rKjMxOCqvopvuZbn6pN4qbfwVB4gVlZMT7XxZgw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Sep 2021 19:50:53 -0400 (EDT)
Date:   Wed, 8 Sep 2021 09:50:34 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@vger.kernel.org
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
In-Reply-To: <977bb34f-6de9-3a9e-818f-b1aa0758f78f@gmail.com>
Message-ID: <fa8682aa-c5f4-7995-166d-8fa899594b19@linux-m68k.org>
References: <20210721170529.GA14550@lst.de> <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com> <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com> <20210815074236.GA23777@lst.de> <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com> <20210816065851.GA26665@lst.de>
 <23f745f2-9086-81fb-3d9e-40ea08a1923@linux-m68k.org> <20210816075155.GA29187@lst.de> <d407a2a1-738b-5cd5-c2ed-b7250c5da8ec@gmail.com> <83571ae-10ae-2919-cde-b6b4a5769c9@linux-m68k.org> <dc594142-e459-533e-cac2-c7a213cec464@gmail.com>
 <f4ab2dcb-6761-c60b-54ce-35d0d017d371@gmail.com> <d772d22e-a945-3e35-80a2-f4783893bea@linux-m68k.org> <b2c55280-657b-51c2-065c-3fc93db050b9@gmail.com> <d7b8f7eb-fc18-c8d-fe3e-dcdf19d3f4b@linux-m68k.org> <755e55ba-4ce2-b4e4-a628-5abc183a557a@linux-m68k.org>
 <b52a10fe-3e4b-5740-d3f8-52bce3bc988@linux-m68k.org> <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org> <ed2ca322-b957-cd52-8d2f-a8edd2785625@linux-m68k.org> <977bb34f-6de9-3a9e-818f-b1aa0758f78f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 7 Sep 2021, Michael Schmitz wrote:

> > Does anyone know what causes this?
> 
> Our practice to run interrupt handlers at the IPL of the current 
> interrupt under service, instead of disabling local interrupts for the 
> duration of the handler?
> 

Lock contention will happen anyway.

If using spin_trylock() outside of "atomic" context was a bug (really?) 
then it can't be used here.

Perhaps add_interrupt_randomness() should use the lock in irq mode, like 
the rest of drivers/char/random.c does.
