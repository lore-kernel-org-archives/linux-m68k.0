Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640E8C761A6
	for <linux-m68k@archiver.kernel.org>; Sun,  9 Apr 2023 03:59:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjDID7h (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 8 Apr 2023 23:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjDID7g (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 8 Apr 2023 23:59:36 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60F359ED
        for <linux-m68k@lists.linux-m68k.org>; Sat,  8 Apr 2023 20:59:34 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 692E65C015A;
        Sat,  8 Apr 2023 23:59:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 08 Apr 2023 23:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1681012772; x=1681099172; bh=m2hMaMWVYVSP4
        42xFNEdNO1FQTydfCJx1bP9XgpuwYM=; b=KuhX4ZepFxJjBY/r94y79vTNeLHJY
        UjdL2tSuO8va9EAkiBZd/d2Kcf+CbrDr1/CtRiJk8UUGl6X54ikSQPKp31VwCSdp
        Mz/wPBOyhNSjibSCidnUDJM+CVhDck6N3gVtY7XW4DJSKDd25h9QEQ0Yjr34FXgQ
        Ub/EBPkanr8CiMZy7AjHf173vo7c/nsVDn6NA4vunBH2yf5j02zVyxXRNYZac2mA
        3SeOuUqCf1R3y10V1UZuAzKvjvceq3RdjmStoX4FLqngjsnRfN/3gyj3GwMkMJaO
        XFg/yshYp2CsTxKMyQ4rh6Yb1//jNiWH2CmcocH5VR0BCrkf+ohy5UgcQ==
X-ME-Sender: <xms:IzgyZF2rjTEZpI0c_pS4h5OKZoHgSrfxclDf75YeGCjd9f5CPWzmvg>
    <xme:IzgyZMGg-UjSiwcEVEMoY_kl-_0mx0AAYIWSVEQECATPScjXMGe6lkni6uNdDLIPY
    dl40xDF1nIrRXywZSw>
X-ME-Received: <xmr:IzgyZF4wA-DowDjZf_TVR_ryE089P8YlZjjvUNeF9NUC7A9JuIvt2xNKmtgQU-JIdHWEjtyBdiOwo5DZ_kzlq_9nOzqtOsPRx74>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejkedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:JDgyZC14W54BMgnIl0DW_NMsqO2aVh5QuL9VgSF1LUFxO4OPEex71A>
    <xmx:JDgyZIFdqqaXRMF-R0B_iTNSYkjCg0lVbWAKJq9OZjxBTunuLem8sQ>
    <xmx:JDgyZD9SXphmeQjAvtyQlksr0f4PVJXVYbzdkk2tQK1RNgMzqt-4DQ>
    <xmx:JDgyZDO7VmNtUFHjFH9rFHQfsb_-OAV8k4HOz06hl_5r4WZODAhqlA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Apr 2023 23:59:29 -0400 (EDT)
Date:   Sun, 9 Apr 2023 14:02:14 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: core dump analysis, was Re: stack smashing detected
In-Reply-To: <e51458c8-353d-c339-5e3e-d4feb5d0da36@linux-m68k.org>
Message-ID: <0cce7643-b194-400f-fbf3-df836517c2e2@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <bb27b393-3d02-f42c-5c7f-c27d4936ece9@linux-m68k.org> <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com> <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com> <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com>
 <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <6c4d497e-6f0e-35cc-908e-9ef98151a56a@gmail.com> <44c29a26-a470-c03a-da55-0a9f6d347edd@linux-m68k.org>
 <d6bdf882-9470-4d05-bd3c-36a1f3410fc1@gmail.com> <69f70488-b84d-7c24-d001-529896f3bd34@linux-m68k.org> <e51458c8-353d-c339-5e3e-d4feb5d0da36@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 4 Apr 2023, I wrote:

> On Tue, 4 Apr 2023, I wrote:
> 
> > 
> > The actual corruption might offer a clue here. I believe the saved %a3 
> > was clobbered with the value 0xefee1068 which seems to be a pointer into 
> > some stack frame that would have come into existence shortly after 
> > __GI___wait4_time64 was called.
> 
> Wrong... it is a pointer to the location below the __wait3 stack frame.
> 
> (gdb) info frame
> Stack level 8, frame at 0xefee10e0:
>  pc = 0xc00e0172 in __wait3 (../sysdeps/unix/sysv/linux/wait3.c:41); 
>     saved pc = 0xd000c38e
>  called by frame at 0xefee11dc, caller of frame at 0xefee106c
>  source language c.
>  Arglist at 0xefee10d8, args: stat_loc=<optimized out>, 
>     options=<optimized out>, usage=<optimized out>
>  Locals at 0xefee10d8, Previous frame's sp is 0xefee10e0
>  Saved registers:
>   a2 at 0xefee106c, a3 at 0xefee1070, a5 at 0xefee1074, fp at 0xefee10d8,
>   pc at 0xefee10dc
> 
> That shows %a2 was saved at 0xefee106c, and the address of interest is the 
> stack location immediately below that. But it has no particular 
> significance: it holds a NULL pointer when the struct __rusage64 *usage 
> argument to __wait4_time64() gets pushed there:
> 
>    0xc00e8152 <__wait3+226>:   clrl %sp@-
>    0xc00e8154 <__wait3+228>:   movel %fp@(12),%sp@-
>    0xc00e8158 <__wait3+232>:   movel %d0,%sp@-
>    0xc00e815a <__wait3+234>:   pea 0xffffffff
>    0xc00e815e <__wait3+238>:   bsrl 0xc00e8174 <__GI___wait4_time64>
> 
> But it's no longer a NULL pointer at the time of the crash, though it 
> should be, since that stack frame is still active.
> 
> (gdb) x/16z 0xefee1068
> 0xefee1068:     0xc00e0172      0xd001e718      0xd001e498      0xd001b874
> 0xefee1078:     0x00170700      0x00170700      0x00170700      0x00005360
> 0xefee1088:     0x0000e920      0x00000006      0x00002000      0x00000002
> 0xefee1098:     0x00171f20      0x00171f20      0x00171f20      0x000000e0
> 
> Beats me.
> 

At the time of the crash, the corrupted %a3 was a pointer to location in 
__wait3's stack. That location was a NULL pointer (the *usage parameter) 
when __GI___wait4_time64 was called but now points to 0xc00e0172, which is 
just after the __wait3 text and just before __GI___wait4_time64 text.

(gdb) disass __wait3
Dump of assembler code for function __wait3:
...
   0xc00e015e <+238>:   bsrl 0xc00e0174 <__GI___wait4_time64>
   0xc00e0164 <+244>:   lea %sp@(16),%sp
   0xc00e0168 <+248>:   braw 0xc00e00b2 <__wait3+66>
   0xc00e016c <+252>:   bsrl 0xc012a38c <__stack_chk_fail>
End of assembler dump.
(gdb) disass __GI___wait4_time64
Dump of assembler code for function __GI___wait4_time64:
   0xc00e0174 <+0>:     lea %sp@(-80),%sp
   0xc00e0178 <+4>:     moveml %d2-%d5/%a2-%a3/%a5,%sp@-
   0xc00e017c <+8>:     lea %pc@(0xc0198000),%a5
   0xc00e0184 <+16>:    movel %sp@(116),%d2
...

But I realize now that this stack location gets overwritten with the 
return address for bsrl __stack_chk_fail, so there's nothing wrong there.

Perhaps its just a coincidence that the saved %a3, once corrupted, ended 
up pointing to the *usage parameter... I don't know what to make of that.
