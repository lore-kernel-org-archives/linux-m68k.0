Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A40C77B75
	for <linux-m68k@archiver.kernel.org>; Sat,  6 May 2023 02:07:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjEFCHh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 5 May 2023 22:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjEFCHg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 5 May 2023 22:07:36 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED1D59C3
        for <linux-m68k@lists.linux-m68k.org>; Fri,  5 May 2023 19:07:35 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 66181320090C;
        Fri,  5 May 2023 22:07:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 05 May 2023 22:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1683338854; x=1683425254; bh=jyLObnA9yhIN5
        nAgVEcgaDUorBpAbF0/9KrXR4BH0hw=; b=UpAgJHasL4MQemQ6vHtINa9UsNtwX
        wMtUkp2Ld4YvK6lvH1RlgvyLs3brRpltpW80SBz0RB99TS917CW/9DkPX3gfjbaQ
        PvkIGeirO2fHr46N809Y/HLAaKk4hVgz2Dnauww6ENcSV0icFXAUbjGBBizPt0+s
        ur6zQDANJkR0oa/NL9yJk0I4IVle9jeXsIgDu/A4W57HF9VkJvRcqmZxPW3YJius
        cPmWD9RL8n/DFpbssTMpJ4wuCEs7puSn5OR3k+m2jOvM11uQZHynSqWxvOK+L3d9
        t1vgsx2Iu7Hl5wMXlTerwOWONE/Fq3uZRRZ7aSzxQN+e8jxDVWOXgOdRw==
X-ME-Sender: <xms:ZbZVZHUKtN7seqbRWe08tUaGxVh5FYepGD-q6mg09chsFREutFbgPw>
    <xme:ZbZVZPmt3_W6Cezmk8qDcpGxG3A_uy7u5UIu-9dO4Knliy9TMHieEXh3hm3gvLDPF
    xXxUzbTZ92JtUh0zFE>
X-ME-Received: <xmr:ZbZVZDYhd-21rizyTR7eNOSA6l_3CKwn1zQG1bWSDD73_ITnwZvMjw9IlhEDckM-iqFQV8AlObr4HPP3vbRIk5p0SgZ-_V6xRrk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeffedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:ZbZVZCUUO9qI9b9EPSEK5xq2PZSF2VLiJXnUlfTgog-FvmoDj-itSw>
    <xmx:ZbZVZBmWoONwqwlh2JxyPKxFgI-tds0ZBh_BARCUL-Z98wgf5Owe4g>
    <xmx:ZbZVZPf6LMCbZGXHzrkSmc--0vfMSS9Vb9FJJ7ACDAwY5rgIpQLzIQ>
    <xmx:ZrZVZBuf0NKxS7HDiyNycoWFnx7OuzPPFOyiBEduaA0Al7uJHMv-lA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 22:07:31 -0400 (EDT)
Date:   Sat, 6 May 2023 12:11:31 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH RFC 2/2] m68k: Make allowance for signal delivery following
 an address error
In-Reply-To: <77d5c271-77d7-0959-93f5-6731dbea7bae@gmail.com>
Message-ID: <314a2206-6880-e8cb-5add-9f03284fd0ad@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org> <f94a7736c10bc4f256bef5b826419faacb297f4a.1683010227.git.fthain@linux-m68k.org> <f4280683-9044-3858-3262-16080e584c96@gmail.com> <421fd88f-1c91-8fb9-98a8-6ac3974bd9c9@linux-m68k.org>
 <268271f3-7d2c-bb2f-f0e4-b26bc80ac015@gmail.com> <79fa24d5-ab04-0750-5dd4-eae6db212a71@linux-m68k.org> <c4ed63f4-6aea-2a1c-56b4-80fd64274cef@gmail.com> <b57967eb-8021-a4c3-9171-973252529194@linux-m68k.org> <4e20d336-1215-bf66-14b1-a142a2960d70@gmail.com>
 <f393d20f-3067-885e-8f26-6d3b13bd9811@gmail.com> <e381cbf7-ac16-6ba8-cc47-90504ccbdaf3@linux-m68k.org> <77d5c271-77d7-0959-93f5-6731dbea7bae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, 6 May 2023, Michael Schmitz wrote:

> 
> Yes, I'd seen the OOM killer kick in before at least once (no soft lockup).

I wonder whether your .config has the same settings as mine...

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=60
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
# CONFIG_WQ_WATCHDOG is not set
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs
