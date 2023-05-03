Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116F3C77B78
	for <linux-m68k@archiver.kernel.org>; Wed,  3 May 2023 07:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjECH6z (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 3 May 2023 03:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjECH6x (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 3 May 2023 03:58:53 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73D13C29
        for <linux-m68k@lists.linux-m68k.org>; Wed,  3 May 2023 00:58:52 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id B85B95C040C;
        Wed,  3 May 2023 03:58:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 03 May 2023 03:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1683100731; x=1683187131; bh=KGl+W2Tr5Weah
        Vh2AOxiICJGiO8M47SpyFvAbK0735Q=; b=K/6qLg/nBnd68HEDOJRv42bAPY+UX
        +xGLORAOrzsm4InM2dJddQjCNkyxkifum+hU9kawb42sIo8ukW9QdrBgHC++ZYhp
        KExags0zeiU3XmCP7BYdNw2da/ZncRjSMRqtlgjU6U86jihFNWUs0TW/DqpUXr9s
        nR2Aznrm4CSVLS1gagPjwBqYKc7sMyeSa98KKYmr+b18i+tG0I68Nycobcq2u6BA
        kKpHKR4UyNRSVG8lFs51EBuLLeb1qHTsLthDxfkcHTeEmifGRGCPAqaOq3a3tvIU
        de86FpPFKBgGlaFVRPoaueAeg8HaTbOR5YnssU+JYPSSs+ElhwN7v71TQ==
X-ME-Sender: <xms:OxRSZOuTJajYcwJvLUQtiZOCl7df7UqJ4uGEr9rXoMbPHtrQVxYp6g>
    <xme:OxRSZDc5f8mbNBilNA1SVudvNbDCJnWKjYEb-QeT_psA7a5eZTg4JCAlj6NcHFLrc
    RGfN-VqgUkg9CnlryM>
X-ME-Received: <xmr:OxRSZJwep4DcUR1wT-hWOuMujdpriK0XS72CyWCkjEQnat6tsJKcC5yIMsa_iRG_7JexK7YgkrgydDv8rvuQxIiB0N9T8HCkpaY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvjedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:OxRSZJOcW7E4xDFW4mxyNStFUEL7JCmta0RMHAxar9Qu_mN57Gc50w>
    <xmx:OxRSZO-AdeA4FyNQuf1WcKAMSYGgn8OdALm4xkqZrBCV9sVhFU-tfQ>
    <xmx:OxRSZBU8GcMsRbMR7rRhSE0Lh8EP6n24tGMWmMUeI6rIvZxD8gzAag>
    <xmx:OxRSZEmHpMydGMbFU4siAd7roHeEq2HJrG6DZJQQz8YhiXNvubYqEA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 May 2023 03:58:48 -0400 (EDT)
Date:   Wed, 3 May 2023 18:02:43 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH RFC 2/2] m68k: Make allowance for signal delivery following
 an address error
In-Reply-To: <268271f3-7d2c-bb2f-f0e4-b26bc80ac015@gmail.com>
Message-ID: <79fa24d5-ab04-0750-5dd4-eae6db212a71@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org> <f94a7736c10bc4f256bef5b826419faacb297f4a.1683010227.git.fthain@linux-m68k.org> <f4280683-9044-3858-3262-16080e584c96@gmail.com> <421fd88f-1c91-8fb9-98a8-6ac3974bd9c9@linux-m68k.org>
 <268271f3-7d2c-bb2f-f0e4-b26bc80ac015@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 3 May 2023, Michael Schmitz wrote:

> >
> > I haven't yet tried to write code to demonstrate the theoretical 
> > address error issue but I can attempt that if need be. However, such 
> > code would be moot if this patch is going to be required anyway, just 
> > to fix the bus error case...
> 
> No, seeing the coprocessor conditional branch case we want this patch 
> even if we decide to handle data faults differently.
> 
> That is, unless Andreas can come up with a reason why calculated branch 
> target adresses cannot be used with these coprocessor branch 
> instructions?

Moreover, can Andreas or Geert come up with a better way to fix the actual 
bus error bug (nevermind the theoretical address error bug) than this same 
patch (which just happens to work for both)?
