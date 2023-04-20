Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21309C77B73
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Apr 2023 07:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbjDTHoA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Apr 2023 03:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjDTHn7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Apr 2023 03:43:59 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 357CC40F5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 00:43:57 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id E84995C00D8;
        Thu, 20 Apr 2023 03:43:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 20 Apr 2023 03:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681976634; x=1682063034; bh=SzQI5ZMmvYF0P
        /G+o8We2Kzlp5Ey7imKsD3OEzFCZo8=; b=N8584uryRYpyIOkZ4e0uwwIzY7USq
        PCz8dSbE2LRwzdbWneA5QpK02KHnW+CGAFFSSumnTrETi3/0amAlDBEqOaCsmTrk
        XP/7/KpDGmbZeMpbIp7YIhlUYrNn0WT74Hm7jfFd+iM6A/czQE1K8tvJ3QPxI3pY
        YudVZhHLczvJLXyFfG0F1CodioSTwmgOk5Wo9O7fEOT5/CmAQDwtflWoSRMExHr+
        jbwjMzo6RZG/mCA06VNzf/mB/RLDC63xXUxcMFFbUsJ3PH74HAadIGkQTnlo1Fmh
        DDaRBocHcKp8ZVJocsW2OoAX4a7UzkQyvZDG0t9a9ITlS8OF1Li8vraQQ==
X-ME-Sender: <xms:Ou1AZPR57rUPfUYyBmvgUfKiGJjqoWdIvQ_qZIDrZyIXBkhfIdrXLQ>
    <xme:Ou1AZAxBAQV-GoJaU3s8FmqegC8lXOmnuxDkD8VLCBzy3RxWIIXm1FALlsdJ3kuPI
    FgSqe5fWuVci2K3cpw>
X-ME-Received: <xmr:Ou1AZE3SaZgNzeBuL9kahjzcCoaTuZ0gbEWEjVJB6EnWiEmAmI94qDmBCC1I03rXaesJwpW1xDmdP2n6oNt-3Vh3ShuA-vfC35I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtuddguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:Ou1AZPAk3-HJU-2BICPVDeL4He6lPB71sXXIdiwMAIxcYhFaxyQe9A>
    <xmx:Ou1AZIgethDTzd7t8P6MoSr2VZufUX0cyVRrHkYG86GlFulOGQHIug>
    <xmx:Ou1AZDrMP1MWi4TmIKc5mIkiGEt_fUKbI-XtVEs_ATPNVaN0DQHKpA>
    <xmx:Ou1AZAIMsL8YZJmJknzu7DOYqtwTZvOSzo5OElKUSIPlFgl2k_iW3w>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Apr 2023 03:43:51 -0400 (EDT)
Date:   Thu, 20 Apr 2023 17:47:25 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: reliable reproducer, was Re: core dump analysis
In-Reply-To: <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com>
Message-ID: <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
 <60109ace-4e55-29da-86d9-35e931b11134@gmail.com> <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org> <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com> <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org> <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
 <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org> <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com> <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org> <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 20 Apr 2023, Michael Schmitz wrote:

> Am 20.04.2023 um 17:17 schrieb Finn Thain:
> > On Thu, 20 Apr 2023, Michael Schmitz wrote:
> >
> >>>
> >>> As with dash, the corruption lies the page boundary.
> >>
> >> Hence implies a page fault handled at the page boundary.
> >>
> >> Can you try and fault in as many of these stack pages as possible, ahead
> >> of filling the stack? (Depending on how much RAM you have ...). Maybe we
> >> would need to lock those pages into memory? Just to show that with no
> >> page faults (but still signals) there is no corruption?
> >>
> >
> > I modified the test program to execute rec() to full depth with no
> > forking, then do it again with forking.
> >
> > root@(none):/root# while ./stack-test 5000 ; do : ; done
> > starting recursion
> > done.
> > starting recursion with fork
> > done.
> > starting recursion
> > done.
> > starting recursion with fork
> > Illegal instruction
> > root@(none):/root#
> >
> > I can't get this to crash during the first descent. The second descent
> > always crashes, given sufficient depth:
> >
> > root@(none):/root# while ./stack-test 50000 ; do : ; done
> > starting recursion
> > done.
> > starting recursion with fork
> > Illegal instruction
> >
> > So all the stack pages would have been faulted in well before the 
> > failure shows up. It appears to be the signal that's the problem and 
> > not the page fault. That's not surprising considering the PC in the 
> > signal frame in the dash crash was a MOVEM saving registers onto the 
> > stack.
> 
> Well. without locking the faulted in pages in memory we can't be sure 
> they were not swapped back out. Unless I misunderstand what's involved 
> in that ...
> 

There was no swap enabled.

50000 frames * 36 bytes per frame == 1.8 MB
