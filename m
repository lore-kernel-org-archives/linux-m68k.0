Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3585DC001B0
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 10:41:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233363AbjHPKkr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 06:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244025AbjHPKkp (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Aug 2023 06:40:45 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E2F268D
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 03:40:12 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 4FB8F32009D0;
        Wed, 16 Aug 2023 06:40:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 16 Aug 2023 06:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1692182402; x=1692268802; bh=sAng/c7AXfnPz
        yw9kOy36N+NtZBgbXCrZV5w4anAlts=; b=QbPxEX9KcFKpylKHfhjITnT1JbaWh
        n9MS3TF1j0KlNXGQ3vHhJU/93ncGuKmbDVmeD0KlKe5Mu4g15XOdsgjNQD3SV8Fq
        2rxyT/S+Ilz6B2yihIn4UOoOqmYNKNveVynuy6TVD4/u1TvV3dfUHt2iqvQ2Ltgv
        UGJzZ2tIJQJBDTroQA/i0waZ7/JZwM1YL320gxyCMJzMhQHC/HLc0iCU1CGnffFH
        J3FevLHuDJlMMjxOftN9uBiNNRqAxK507iDe0y6s0hKK8pUT3lPGCjiwI7JhLI75
        Jn8oh2fx2CcWdtEAsT6Uj4WUYhlj8OYIh/hmdyEKdP8ojjmTAps8cOTgw==
X-ME-Sender: <xms:gqfcZLLiN7KNRfl9U7EjAqFfsrvf5g1ESQyoj3cCXF2G46dzVmrlMg>
    <xme:gqfcZPKNhbeVNppUddsmpsxcLwxHxcTa1q-82I33CdRb9yynboalSER8acorNskzx
    Q121q-aMg323bQu_Ts>
X-ME-Received: <xmr:gqfcZDs03c-_k4qYEpDes6mUY8QyBcUpPsBmSonuuST6ojKwccyd0bTmXJkZVWKp_7mffQKsq-Q4d4aHltgRYvId4gNtwssBXgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtledgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:gqfcZEarY9OHAwsU70X71jDoGUcQVC8bX1wc_tDIN8SGb0xMtvBmzA>
    <xmx:gqfcZCaVHGItqCzsUM72uabRXQh7_foz6xk_CvdV80WL-zrBdqGmAw>
    <xmx:gqfcZIBBGmhTu5uMY3wytTmZcb2wzWfPYEe2GJIGTfJxg3ISqnKQEA>
    <xmx:gqfcZBnhmksvogT7R4v5bITqa4IPMuoFxmRA7b6yDlVBpdzJv0qwuw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Aug 2023 06:40:00 -0400 (EDT)
Date:   Wed, 16 Aug 2023 20:40:10 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        geert@linux-m68k.org
Subject: Re: [PATCH RFC v3] m68k/q40: fix IO base selection for Q40 in
 pata_falcon.c
In-Reply-To: <a3124b12-d243-34b5-967c-cb680509fe50@linux-m68k.org>
Message-ID: <15a957b1-18f6-c75b-aa2f-48f90a004eb9@linux-m68k.org>
References: <20230815223212.13620-1-schmitzmic@gmail.com> <29964423-b09e-662f-7fcc-1a33e33e2139@linux-m68k.org> <df430e28-9bca-4453-2c81-c50edbbf4f9e@gmail.com> <2371f714-e0a2-7c0e-d811-5b7ea7a6684f@linux-m68k.org> <44bc64de-8463-5e43-7335-8ea1ffc07cee@linux-m68k.org>
 <653c4cef-d147-c66b-391a-7527e68df947@gmail.com> <a3124b12-d243-34b5-967c-cb680509fe50@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 16 Aug 2023, Finn Thain wrote:

> On Wed, 16 Aug 2023, Michael Schmitz wrote:
> 
> > Instead of doing that for each call to pata_falcon_data_xfer(), I'd 
> > rather find the relevant bits from the module parameter at device probe 
> > time, and set the device-scope bit mask accordingly.
> > 
> 
> Good idea -- I see why you'd want to optimize pata_falcon_data_xfer(). But 
> you don't need a device-scope bit mask, you need a device-scope bit, which 
> could be obtained just by comparing private_data with NULL.
> 

You're right, of course -- you need two bits per port. Sorry for the 
noise.
