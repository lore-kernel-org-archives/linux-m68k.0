Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D0BC001B0
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 09:05:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243202AbjHPJEh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 05:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243256AbjHPJEd (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Aug 2023 05:04:33 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D0C31BEE
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 02:04:32 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id DE84332009BC;
        Wed, 16 Aug 2023 05:04:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 16 Aug 2023 05:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1692176668; x=1692263068; bh=l5l3B6tV9BEWk
        USyP78fc3Vw0swZiEVCD9pHXW7vTR0=; b=ohq1CkovqWVd5xBPFqgS3j0qY5Eon
        vFBtOUD6RL8sjzC7JMVCHHmnuLTl8uT1X9e6iQnphJp+hmLoxIMhMzL9lEDguoON
        eF6BnbchI/nAwTe+4+cDi8sVkERt5QaXA49aDT55KczeUzBqesa0x7PhQo6cvUoB
        kGJl4gRek2A4j4gsa4Q8SBQKkTdRz3+xg2vvNFhvN45/UFPklC2Ti4DX79flX91H
        8LVaaCYuCxlAnHX13V3TY6HbAh0rB3IS8QakWZ0SEmCGi7K0GIiI0rSdkn3Tqbrk
        y+vwUJVZKw3ZRPmqnjcIGbbmS1/dlYh8CYUpu2MT5JP1KK8B/c1NpU8wQ==
X-ME-Sender: <xms:G5HcZB-yPCHcwbV2sIB1QwoDCvPIE3WSGsHZPc6-YW0FvRbDVfMEHw>
    <xme:G5HcZFvNaQ0g8gxzYSGm0BJDMAVHnIxUU6fnNoGsZQD7gkf99S_728z81y9kdm7KQ
    jQkl3QECyfe_YAoDgg>
X-ME-Received: <xmr:G5HcZPCJ0PXc-MEYeJlgZ-d0O66-f-Hmw3zlQDeSJY2rJ9UHs37NWvgHCaqrsFDiyv66788rOzoMto7QMJv-55IJWu6nkyLyOpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtledgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:G5HcZFfH25NW7LxxOzTiQpf9swLWWXrGeI91GRZUMKaHJ6kovSNo2A>
    <xmx:G5HcZGPOI9wlP4F3o2MVZI1fxJYQrNvKtCWY1zo9H3N9iN6qUx2NJw>
    <xmx:G5HcZHlu1oQN9oiTVztCXGq4Lnq4Db2xurbXcg31PmaTl1dE3IV8Bg>
    <xmx:HJHcZPYk56uXTpzldHS2SeBKEguG-Uqou7_PhoUeAJkO0pOSnkUIzQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Aug 2023 05:04:25 -0400 (EDT)
Date:   Wed, 16 Aug 2023 19:04:33 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        geert@linux-m68k.org
Subject: Re: [PATCH RFC v3] m68k/q40: fix IO base selection for Q40 in
 pata_falcon.c
In-Reply-To: <653c4cef-d147-c66b-391a-7527e68df947@gmail.com>
Message-ID: <a3124b12-d243-34b5-967c-cb680509fe50@linux-m68k.org>
References: <20230815223212.13620-1-schmitzmic@gmail.com> <29964423-b09e-662f-7fcc-1a33e33e2139@linux-m68k.org> <df430e28-9bca-4453-2c81-c50edbbf4f9e@gmail.com> <2371f714-e0a2-7c0e-d811-5b7ea7a6684f@linux-m68k.org> <44bc64de-8463-5e43-7335-8ea1ffc07cee@linux-m68k.org>
 <653c4cef-d147-c66b-391a-7527e68df947@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 16 Aug 2023, Michael Schmitz wrote:

> Instead of doing that for each call to pata_falcon_data_xfer(), I'd 
> rather find the relevant bits from the module parameter at device probe 
> time, and set the device-scope bit mask accordingly.
> 

Good idea -- I see why you'd want to optimize pata_falcon_data_xfer(). But 
you don't need a device-scope bit mask, you need a device-scope bit, which 
could be obtained just by comparing private_data with NULL.
