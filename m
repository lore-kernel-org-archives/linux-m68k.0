Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B4CC04FDF
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 05:32:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241871AbjHPF3V (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 01:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241869AbjHPF3H (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Aug 2023 01:29:07 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E641FC7
        for <linux-m68k@vger.kernel.org>; Tue, 15 Aug 2023 22:29:05 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id D587632009E4;
        Wed, 16 Aug 2023 01:29:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 16 Aug 2023 01:29:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1692163741; x=1692250141; bh=o0DcP25JNfUSa
        ALyvthCkeKPNND9N0dK6RRV3oDSDxk=; b=P6yuXQKBGBIMbRRX75cjarUFLXfRx
        4b7LqvG1nK9hV4jY27q5H+o9XZWVBNvvg9m18WqwQLeiQRNAr9b0dY0UvMQKkFL1
        DWAugx3ljO9jWFXEBt1p3GmEEPk4HAZ4Q70Ro4h78NsnOVp9LQvDPg8z6UUe/p7y
        ByCmEs4ZpSxRf8+gitInmQ12ouvFZnfgs7JYqXCu4EWXnoOkk+81xs2mSoqwugiz
        ktImD3rUBWZfkjZKe5VkAcRvQn3LdKEuCh8xQILVREccBDQNIASWBtXkwuKH9imP
        qzJSA3K5UGaF/5DZRucTp8zXRCOq/vUVo93UsC1KNREPnOcaM3XpCZVTQ==
X-ME-Sender: <xms:nF7cZNdH6cn-9JTEjhg2fClHvSfBigqRrRA03wj0WzxDmTpr_snU9w>
    <xme:nF7cZLPcCIOH1QxvJ7YlS0yVArvvgNgFGIukHS2laYNMm45oj-Wh5PysIt3-Z-6o9
    3TDjX-RabRQNlaq8Ew>
X-ME-Received: <xmr:nF7cZGgic2f_AhWwfnCd50CqdPibf0V65j7maOvqd5TIVs4prbfwNJOZVB4qbzarTuKRSeNKLeHvgZFGlNK3WxEJOJpKrjXBQEc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtkedgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:nF7cZG-CsqkwzjEbkFMH6z_hc18e_PeUp8UM4bkxl-JBouJJQ3cGhQ>
    <xmx:nF7cZJsHyV61txk4D3aYdk63EBal0408iv8X1tk3jX7PTcww6WzvDA>
    <xmx:nF7cZFEbOObOYChpnGBZax5jGoOSSQhUgAKOsJykkbMBHIY6XWfRlg>
    <xmx:nV7cZC5N1S7Xr-61-vjyRsFHasRnMXSkDPK59U7O-f7jKQMr3gp8Fw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Aug 2023 01:28:57 -0400 (EDT)
Date:   Wed, 16 Aug 2023 15:29:07 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        geert@linux-m68k.org
Subject: Re: [PATCH RFC v3] m68k/q40: fix IO base selection for Q40 in
 pata_falcon.c
In-Reply-To: <df430e28-9bca-4453-2c81-c50edbbf4f9e@gmail.com>
Message-ID: <2371f714-e0a2-7c0e-d811-5b7ea7a6684f@linux-m68k.org>
References: <20230815223212.13620-1-schmitzmic@gmail.com> <29964423-b09e-662f-7fcc-1a33e33e2139@linux-m68k.org> <df430e28-9bca-4453-2c81-c50edbbf4f9e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Wed, 16 Aug 2023, Michael Schmitz wrote:

> 
> Right - I also wonder whether using priv->swap_data to skip the bit test in
> the most likely case (no byte swapping) is actually worth it.
> 

Given it's a platform device that's only ever instantiated once, you could 
just use the module-scope variable rather than device-scope.

BTW, the patch description could state some of the implications for the 
default setting i.e. interoperability with the vendor operating system 
(and IDE disks from Atari Falcon I guess) as opposed to interoperability 
with everyone else.

> I'll split this into bugfix and byte swap parts
> 
> Where should this go - linux-ide for sure, but is Bartlomiej still the 
> correct maintainer?
> 

The latest MAINTAINERS file says,

$ scripts/get_maintainer.pl -f drivers/ata/pata_falcon.c 
Sergey Shtylyov <s.shtylyov@omp.ru> (reviewer:LIBATA PATA DRIVERS)
Damien Le Moal <dlemoal@kernel.org> (maintainer:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers))
linux-ide@vger.kernel.org (open list:LIBATA PATA DRIVERS)
linux-kernel@vger.kernel.org (open list)

See also c4f9c8bbcc24 and fd86194aca1f.
