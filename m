Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616E7C001B0
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Jul 2023 01:54:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbjGXBym (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 23 Jul 2023 21:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjGXByN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 23 Jul 2023 21:54:13 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08EF9ECE
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Jul 2023 18:45:12 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 599CF3200302;
        Sun, 23 Jul 2023 21:43:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sun, 23 Jul 2023 21:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1690163017; x=1690249417; bh=x8fQhk2w7LSEP
        UsoUGxOnVDMAZSdVDJsN8jRVGBIEX4=; b=1lBmVfKOexCipBmobVSltd+o4U0/h
        1wYLrwbvTuFIG9tbqs25nyc5/ZYHvsybog6sYrESgmhW+zAWRxSRVEP6N2vJJEOB
        W6bbEZ0aHSJ6bdCQMz25kJuXOunWMWkCszOrHLMayeBah1bXaPLUZXBMo73HfCRB
        zHBr8QyMVBbGotQnt9TNzGIO8WtYEyenTAn8/XVh4K5a+YsLUpuK/GBMvIrwsM1h
        SHJsCmDuKy4+Zi5bQ8fUwInCjPXn6WBXyR0Qzad/y93OvFThs0jD7yp9oPg5lTa6
        PgZw/MOzXpDvz3GoEkGXM1mg2wuxHaJe/lzpUdbc9N5roLZ6nvvTH8rrA==
X-ME-Sender: <xms:Sde9ZOEP9KF5gdkGwv4U2KqFAjUsJA-aTyX3JpvTEIHSum2OsJjcPw>
    <xme:Sde9ZPUEkUSnKKD7Njyh3XxBQHU9HSgJnFQpycI4eg4k7xcZGxyv39LFbb-aDLoQI
    eiOpxRxiEDeLk7wqu0>
X-ME-Received: <xmr:Sde9ZIKSb3sWMBU5cJfWRFgutPuTuEdNj5Be_PCUieyxBQr4JNjvnNgPCpiW3ZJclb32LpqYx_kPRpYSdvw_uSj_UQnFYP34NJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrheejgdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
    ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:Sde9ZIGZ3dwB6rYDN_12qKEUXsVvG4GcymB1fOmdwEQVuDU1jxpdRA>
    <xmx:Sde9ZEUGdL8f7m0HHW4ugtCu0U3g7CQKx4aK-pB52_kJOtiikCF1GQ>
    <xmx:Sde9ZLNFi-DZeIggpLgXiMOcKtATA_UpHpuivXY0RPmlxwMyfcCMzg>
    <xmx:Sde9ZNe9d0jJmzf9_pljAwGgTLpPcG9TileDEKnZCU8QxdBcytRREQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Jul 2023 21:43:34 -0400 (EDT)
Date:   Mon, 24 Jul 2023 11:43:44 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     William R Sowerbutts <will@sowerbutts.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot
 time
In-Reply-To: <ZL1HMqBbdw+8buf+@sowerbutts.com>
Message-ID: <37514b0b-5735-d856-b342-7797ac412e21@linux-m68k.org>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com> <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com> <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org> <ZL1HMqBbdw+8buf+@sowerbutts.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 23 Jul 2023, William R Sowerbutts wrote:

> > > It might be a good idea to verify that IDE works in v5.13
> >
> > Yes, please do.
> 
> It does:
> 
> [    0.000000] Linux version 5.13.0-wrs (btg@carbon) (m68k-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 Sun Jul 23 15:47:14 BST 2023

Thankyou for building and testing 5.13. Would you please send the .configs 
from your 5.13 and 6.4 builds?
