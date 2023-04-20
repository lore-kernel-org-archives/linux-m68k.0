Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78669C77B7F
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Apr 2023 07:55:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbjDTHzL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Apr 2023 03:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234194AbjDTHzI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Apr 2023 03:55:08 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E6B211C
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 00:55:01 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id C1E385C025E;
        Thu, 20 Apr 2023 03:55:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 20 Apr 2023 03:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681977300; x=1682063700; bh=9guqsytdR4b8a
        x045d6OXqYSxOLayi9wf+/AovuxVbw=; b=GdETw/C+dNZMML9qhncgkMMF2mg+3
        i3rswi7fYh0Ak16Cr4FEzgBWMv2HFxCGEC4lU+eH2wwrFANWxjVqfJCO+JaWY8/M
        O/6dHl/EfW1xX7OFYz1hBHAzAVwnqgt/0QSF25AY/wc9L9OdvRDSGmqfuKKgt0Ui
        kCfCtiAMAp9X5qfqtBn4EbCkHznmAGUj5hRnAQfVNln3BTzL8pg3RJQHvKEAsrHr
        1PurOXZsFrO5ZbdhqCviBYB4KApO9MRZF5bxAFuf6T3Opa9jyKwcbCmflf5HO/Ar
        +zwBmUOjNcd4TDyMjMp/Uyq1TlFxg3v4iRr5iORZSlQdMC3keLb/lqJZA==
X-ME-Sender: <xms:1O9AZBzmQs3enx3rj31OfhBLqHotqNizekXSTs5xksTQHIFEHVP2qw>
    <xme:1O9AZBQ-_zH_UFwUIHlqQz-PVfvrS8iwZg4dPMeMsG6xt0fvxR77-209sA5GvIoB7
    kY_heT0OM1dNYe6zso>
X-ME-Received: <xmr:1O9AZLW-QyWKX4fuFpQ-PoBtKvuFx7iYwCUdU8FrXfVPLBLtJna_9oAthMiQdbXXyfiQttzO0xYev-Z7MhJssFZCuN3pifQhHMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtuddguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:1O9AZDg97sSPQIr2nxM3go5leq70DKToOJok7gYBKPaHM5C7YffqEw>
    <xmx:1O9AZDAlVCD4sJ2RMGeDlvnXw13PoD3O-qKHx1Gk5PHmML4AvKN-bQ>
    <xmx:1O9AZMKRY8YPyetEZ4ANYV2EvWLYdmStIukT7BsxOVL7AjJxSt9gkw>
    <xmx:1O9AZGodpATd1MA1OQpZxLT2VM27q6PqkfizMPbBAy25DYlTCWUS2g>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Apr 2023 03:54:58 -0400 (EDT)
Date:   Thu, 20 Apr 2023 17:58:28 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: reliable reproducer, was Re: core dump analysis
In-Reply-To: <576b7614-00e2-7ad2-6769-c2d231d4729b@gmail.com>
Message-ID: <fcb61bd1-7feb-1af9-0eaf-0446afe800d3@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
 <60109ace-4e55-29da-86d9-35e931b11134@gmail.com> <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org> <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com> <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org> <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
 <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org> <be49e4a9-298b-a748-399a-9a075ceca72a@linux-m68k.org> <576b7614-00e2-7ad2-6769-c2d231d4729b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 20 Apr 2023, Michael Schmitz wrote:

> Am 20.04.2023 um 18:04 schrieb Finn Thain:
> > On Wed, 19 Apr 2023, I wrote:
> >
> >> Oddly, the program never detects any stack corruption when run on the
> >> QEMU '040.
> >>
> >
> > I tested a Motorola '040 and got the same result.
> 
> OK, that would mean the bus error was just the most reliable way to get 
> do_signal_return run after child process termination, and the signal 
> delivery itself may be responsible for stack corruption.
> 

I agree (I assume you're replying to my other message about the absence of 
swap).
