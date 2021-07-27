Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84AEC4338F
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Jul 2021 10:22:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98D5F615E6
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Jul 2021 10:22:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236195AbhG0KW3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 27 Jul 2021 06:22:29 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:42349 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236169AbhG0KW2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 27 Jul 2021 06:22:28 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 42CE1320014C;
        Tue, 27 Jul 2021 06:22:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 27 Jul 2021 06:22:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JllDc+
        mQc+fGsx2EtwgCRO3Sz4y7k8DZECXEF7ykUOI=; b=ogzvAVA4Fg5ruX06uIHei5
        GiiMHCqvEkO3may9i2dxwhw/J4g4m1bt1wtiE2dBNXbuhpWOttiLZ3lvoz1vK83T
        dpWDmi9dRjcFUrQnkz8WllBE1iEvcvoRLXDdyFH+KtihbypRSsNfbhJCUmVlJv0F
        zSdE0y5xYgaAV+VSZ6E9jipVlv7Vo/moaVah53ptqx3d2P48981NX0FpzLaVDTPC
        0VI4OYKrHl7jX3p9Fo+3cjmR5CNsPF74HQRCWtlGYvaybXfq627SwdHzuapb/V8K
        A3Wa8x8wLy/7aZt3e4ve2PEAllkgKQr7FIS1Fo/kSJ+QBd4AO11B+4/yLWhAfjeA
        ==
X-ME-Sender: <xms:Y97_YD1Y75P1jKczGp58XZbcKUQ7uTuBRGk2FgcS_Xf7d6PhQSsraA>
    <xme:Y97_YCF8YYxfucFuQ1230otyQTCUjduJtFYXDdXUCFRQwtq_urz_Ytr1_zkrLUaJq
    Zc3gKn5gtkllIjDn8s>
X-ME-Received: <xmr:Y97_YD7Y0144RFlup9fi0CgKvO90TRZG1cqYmWur-unoAOHfT3mRl7mK8BUt7ckrBIlPq47PTRVvjc0_Pc1mjQWIGQ6uQwCyR88>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeejgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
    rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
    gvrhhnpeekveevtdekfedtfefhvdfgleelfefhtdefieetjeejvefghfdufeejkeehgfeu
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdr
    ohhrgh
X-ME-Proxy: <xmx:Y97_YI0yhhZR6ON2vzm4Ejomsu0RSOOUnsRXjbqwHDKpS62BGtZRJA>
    <xmx:Y97_YGH4zUQLv7cWtICs0XKRmwJphuHKEauz189eu4-sICL8_DiTsw>
    <xmx:Y97_YJ-DLPEZUJoRvdHgnQ68zJqwnP8fTY_WR1a-o096fjMy6bywNg>
    <xmx:Y97_YLRQoa02qOVfDn5N_Q2C7QFZvzeVL2nG9RmitILqFznudQL4UA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jul 2021 06:22:25 -0400 (EDT)
Date:   Tue, 27 Jul 2021 20:21:52 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Al Viro <viro@zeniv.linux.org.uk>
cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC][CFT] signal handling fixes
In-Reply-To: <YP2c1xk9LJ0zE3KW@zeniv-ca.linux.org.uk>
Message-ID: <5622d120-1b89-6898-d091-8b4ceff6418@linux-m68k.org>
References: <YP2c1xk9LJ0zE3KW@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 25 Jul 2021, Al Viro wrote:

> 
> 	The series is on top of 5.14-rc1; it lives in
> git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git #untested.m68k
> Individual patches in followups...
> 
> 	_Very_ lightly tested on aranym; no real hardware to test it on.
> Any help with review and testing would be very welcome.
> 

I can test this branch on a Motorola 68040 machine I have here. Can you 
advise how to get decent code coverage? Maybe there's a package out there 
with a signal-heavy test suite? Maybe I need a break point in a signal 
handler? Or perhaps just send ^C to a process running under strace?
