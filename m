Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52264C77B60
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Apr 2023 06:09:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbjD2GJW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Apr 2023 02:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbjD2GJV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 29 Apr 2023 02:09:21 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 514DA1FFA
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Apr 2023 23:09:19 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id B9DC53200949;
        Sat, 29 Apr 2023 02:09:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 29 Apr 2023 02:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682748558; x=1682834958; bh=DOB7BEGgDH7b2
        fVBz2C52oU4lhmf9NDeTqT0yDa0i9w=; b=QB17Q/5SK52ln41ZclSeyqWiOPtdk
        m0z3IYv1xUGTlo7mHZ0UnyeBoj0EmyZ9ReWtOGyov2X01ug7VP+lBZwE4nhh0Jdm
        dq+LiAg2dXZl2hngnoodbdE/2ci5I0H3T/bFOywubPl2gC0WD+3ClC2VtpJFrCGM
        wYbhkE3RkzczH4Y2/MyCBdnXf9Jupn70nD96wizc2uXiSd9V5r8xYje9CLGKiyl9
        fGWAr0ET7GRU9/t68SisNOfsUk/QKbHs7jk4503gnI67RqmyxVqwg3/rkhmA9B4d
        1fZ3NpRvSdSCA1Th9GZhDNAICuc9VgMH3PT4+Gx7pi13ijUXYcHXDFaZQ==
X-ME-Sender: <xms:jrRMZCaFt4Mzks_xheWUvH9ocs9Z-GliZnyM2zVMxTPzT15v-DeGRg>
    <xme:jrRMZFbxwfEYqvKhomEtZTmbqJaPjIa9rLO8EJx8I0EAZ9wMQUtLlBbH9YrFY7b_U
    Lphl2iVuOa323irUTI>
X-ME-Received: <xmr:jrRMZM9dDzUYOOryYeYbCGmybl7sKwVxDW3jbo4JrTz-24dVt0RdQFoa5TtsCuMSLPj-hq77S3BS56YX_UMh02LRPTgXjxdu8EQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduledguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:jrRMZEpXiqeXyUaGJ1S9_yAdxNIvrl5Uatm5X9dNdpv7tOCrk3aWug>
    <xmx:jrRMZNpqz4AtLJYNsQgNPk8g3En4KpcZXubVTZrsaMtTny3-hNePmg>
    <xmx:jrRMZCT3LkCb4ZCjztqtxQ1PE-R9HaQtNuzavBr7XlDhGKuyiAJdAA>
    <xmx:jrRMZPG4FlqCxdOgmvj4yhidMiVgyyCpIahCMmLqXbLYdF167FbyeA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Apr 2023 02:09:16 -0400 (EDT)
Date:   Sat, 29 Apr 2023 16:13:04 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@lists.linux-m68k.org
Subject: Re: signal delivery, was Re: reliable reproducer
In-Reply-To: <585e64e3-d3e1-b4dc-5fa6-627f21a28792@gmail.com>
Message-ID: <22152b78-45d2-d23f-8d49-f57922e6bdf8@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com> <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org> <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org> <7c86ad1d-7bbd-8f61-5ac4-56a1b99a8663@gmail.com>
 <1ac37684-2696-6103-10d9-92914b0497a1@gmail.com> <1c4fc19f-ad9b-7b8f-6638-8b026fe1280b@linux-m68k.org> <5ac55169-4916-d671-489f-7eb8fb85d336@gmail.com> <9544ef26-a444-e186-fb1e-0e914acd36af@gmail.com> <20de24b3-098d-4603-2768-b0468a4fe772@gmail.com>
 <69565abb-1cd6-716e-046e-5a6d69a4e617@linux-m68k.org> <89cb2211-5f6e-07a2-3149-1ad1ad887265@linux-m68k.org> <d3d27369-8532-ba69-2463-66b8decbee67@gmail.com> <4b4eacf2-6934-5563-fb47-04843a77a35c@gmail.com> <dad59503-34e4-bc0e-db29-f53b951afc78@linux-m68k.org>
 <13d2b2f4-ad99-02a8-db89-828a4c20fe54@gmail.com> <ae06a4dd-fbc2-7924-9f7d-b8e0a92a8a7d@linux-m68k.org> <585e64e3-d3e1-b4dc-5fa6-627f21a28792@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, 29 Apr 2023, Michael Schmitz wrote:

> 
> Might be, but this has all been on m68k v6.3-rc7, and I hadn't seen the 
> memory squeeze before there. I'll have to run a few hundred of the test 
> case on an unpatched v6.3-rc7 and on the one with the minimal frame gap 
> to be sure though.
> 

You could use a stable kernel for this.

> > Anyway, I agree that stkadj would need to account for the gap, as you 
> > pointed out earlier.
> 
> Not sure about that anymore - mangle_kernel_stack() does not even use 
> stkadj to shift contents on the kernel stack (after restoring the 
> exception frame from the signal stack, but it uses the start address of 
> the frame for that copy operation, and uses a local buffer to move it 
> from user space to kernel space). It uses the extra frame size from the 
> exception frame directly.
> 
> stkadj is the offset of the replacement exception frame on the kernel 
> stack. The replacement frame gets us into the user space signal handler 
> instead of completing the exception right away. stkadj is used to skip 
> that replacement exception frame used for the signal handler on the 
> final rte (after a trip through sys_sigreturn to copy the original 
> exception frame back on the kernel stack).
> 
> The offset we use for he signal stack on the user stack does not matter 
> here at all.
> 
> Or so my limited understanding...

Thanks for passing it on. I sure wish this stuff was documented somewhere.

> 
> >
> >>> I believe we can use USP to get a worst case estimate for the future 
> >>> extent of the user stack. ...
> >>
> >> What is the most data a moveml <...>,sp@- can take? If that's not too 
> >> much, a constant offset for the signal stack in case of format b 
> >> frames on 020/030 might be easiest.
> >
> > I think it's 64 bytes (16 registers). But we also have to consider all 
> > of the other instructions that may write to the stack. There's 
> > probably a reason why do_page_fault() picked a 256 byte gap (?)
> 
> That's not used as a gap, just to catch any user access below the user 
> stack pointer.
> 

MOVEM _is_ accessing the stack below the stack pointer. That's why the 256 
is relevant here.
