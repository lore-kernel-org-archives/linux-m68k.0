Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD3BC77B61
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Apr 2023 01:56:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238574AbjDZB4T (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Apr 2023 21:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238588AbjDZB4S (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Apr 2023 21:56:18 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D5A1988
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 18:56:17 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id B25AE5C0176;
        Tue, 25 Apr 2023 21:56:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 25 Apr 2023 21:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682474176; x=1682560576; bh=nUBtrZJ6tQZ55
        7QjEvYNAPe/lDtHLUfq6IelISe+wvA=; b=EZvORdAF/zf2cAHjbPNoykmvB0/NN
        TyqUuf5ojv2VT34NKF9mfSloYqt8HryvqGZgfqZTyxeQKpwDD1JFiDfOLHEvdUSs
        r6ptde2KSzxVJGqOahyEsweP2CzEQsAXSgWACZpP/S4jXnVZMDIMXsiPJcRuuHwa
        K02J+HK4RzLvPwGQIst5ByqdVU0TE1NIc0JdzhCPixmC+YyTm++YC5MPO0y79h1X
        tNAJQNXYklGVFRwh7qB9GnL0MZ/NtN+O0+IWzW+GXkp38XRao54Yck1y+siLOoyP
        mutaLBMdQoseOKbqkEG7sQJ+G4vqWkMUljZzgHehEKBJCGM/2c0t00pcw==
X-ME-Sender: <xms:wIRIZC9glla7IRU_A4ygh_sB6H-gW0VKTHZUF0HtWbo9a4FaL8YiRA>
    <xme:wIRIZCtKu63sukE7jxjQ5XPfOs_HzRmjDSaY_nJ3TWgIBeVXTW2ET62aDLiMHMtFY
    LXAmmSMqrLhpIDaKqA>
X-ME-Received: <xmr:wIRIZICOZd5LGC3f82IXBUYJGseb0SVozAh-YOkl6l_cnjQ5sPbH57RIKmCrR3twFoPcg876vadi7WduqVfnEDJjTrbsbYiD4us>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedufedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeejfefhfeeiuddtvdfhudeugfetleffveehtddvgfelleekleetfeelkedv
    tdekgfenucffohhmrghinhepvghnthhrhidrshgsnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdr
    ohhrgh
X-ME-Proxy: <xmx:wIRIZKcYKJLSsVmSg2BFp9XizNc-YMt_CTb6mkzJRnePjgqaCl-jag>
    <xmx:wIRIZHNNcAno_sA0wXsZWq2WfTuoeA-1R7H0O8Q8ZkFzvp9lMykNmA>
    <xmx:wIRIZEnoUIvNCETlFeQPMZpFqPm3TRup7Z2K-8L9sVvP8UNwAu3b1Q>
    <xmx:wIRIZN3x9CLLSLgih5NQYqP6fkVEzHbPuw_Cx-g8R1AYeJlAnV5DOg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 21:56:13 -0400 (EDT)
Date:   Wed, 26 Apr 2023 11:59:53 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Andreas Schwab <schwab@linux-m68k.org>
cc:     Michael Schmitz <schmitzmic@gmail.com>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: signal delivery, was Re: reliable reproducer
In-Reply-To: <87ttx4rxep.fsf@igel.home>
Message-ID: <ee798575-67f7-1a3e-9c42-285f6257caae@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com> <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com> <87fs8sz6e9.fsf@igel.home> <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com> <878rekz0md.fsf@igel.home>
 <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com> <87o7nfyd7e.fsf@igel.home> <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com> <87jzy3y79y.fsf@igel.home> <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com> <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com>
 <13d36a79-5aae-d63c-5014-5503688f07bb@linux-m68k.org> <d97fb295-886d-226a-c8f9-6359562d919f@gmail.com> <1d9955d2-6016-a238-142a-887f95465dd8@linux-m68k.org> <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com> <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org>
 <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com> <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org> <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org> <87ttx4rxep.fsf@igel.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Tue, 25 Apr 2023, Andreas Schwab wrote:

> Please try this patch. 

Thanks for looking into this. Your patch solves the problem for me and 
doesn't seem to cause any regression.

Tested-by: Finn Thain <fthain@linux-m68k.org>

> Signal delivery should only happen at insn boundaries, but due to the 
> way the 030 handles return from bus error

The Programmer's Reference Manual says that the format 0xB frame is used 
by '020 as well which is consistent with the ifdef below, so it probably 
should be mentioned in the commit log too. (And I assume that '020 is also 
affected by this bug.)

> exceptions (the insn is resumed, not restarted like on the 040/060) the 
> kernel may do it in the middle of the faulting insn.
> 
> diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
> index 4dd2fd7acba9..6c09a5710728 100644
> --- a/arch/m68k/kernel/entry.S
> +++ b/arch/m68k/kernel/entry.S
> @@ -117,7 +117,11 @@ ENTRY(buserr)
>  	movel	%sp,%sp@-		| stack frame pointer argument
>  	jbsr	buserr_c
>  	addql	#4,%sp
> -	jra	ret_from_exception
> +	| don't do signal delivery when interrupted while insn is in progress

We might avoid the word "interrupted" like so:

	| deliver no signal if the fault occurred while insn was in progress

> +	| (on the 020/030)
> +	tstl	%d0
> +	jeq	ret_from_exception
> +	RESTORE_ALL
>  
>  ENTRY(trap)
>  	SAVE_ALL_INT
> diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
> index a700807c9b6d..40fc408d1333 100644
> --- a/arch/m68k/kernel/traps.c
> +++ b/arch/m68k/kernel/traps.c
> @@ -751,8 +751,10 @@ static inline void access_errorcf(unsigned int fs, struct frame *fp)
>  }
>  #endif /* CONFIG_COLDFIRE CONFIG_MMU */
>  
> -asmlinkage void buserr_c(struct frame *fp)
> +asmlinkage int buserr_c(struct frame *fp)
>  {
> +	int not_insn_boundary = 0;
> +
>  	/* Only set esp0 if coming from user mode */
>  	if (user_mode(&fp->ptregs))
>  		current->thread.esp0 = (unsigned long) fp;
> @@ -793,8 +795,9 @@ asmlinkage void buserr_c(struct frame *fp)
>  	  break;
>  #endif
>  #if defined (CPU_M68020_OR_M68030)
> -	case 0xa:
>  	case 0xb:
> +	  not_insn_boundary = 1;

The build uses -Wimplicit-fallthrough so I added this:

	  fallthrough;

> +	case 0xa:
>  	  bus_error030 (fp);
>  	  break;
>  #endif
> @@ -803,6 +806,8 @@ asmlinkage void buserr_c(struct frame *fp)
>  	  pr_debug("Unknown SIGSEGV - 4\n");
>  	  force_sig(SIGSEGV);
>  	}
> +
> +	return not_insn_boundary;
>  }
>  
