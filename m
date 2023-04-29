Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F30EC77B60
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Apr 2023 09:46:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbjD2JqH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Apr 2023 05:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbjD2JqG (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 29 Apr 2023 05:46:06 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5975BE44
        for <linux-m68k@vger.kernel.org>; Sat, 29 Apr 2023 02:46:05 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 569C932009A0;
        Sat, 29 Apr 2023 05:46:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 29 Apr 2023 05:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682761561; x=1682847961; bh=I8kPmg1TABfBi
        trL65cV1m8tHHn30UPShWl/5IIt+xw=; b=jlGWCjL0S8G9IDDi2AFPyuV1EPfuw
        l3vJ1OWMIMSdpducBxakg29umdlFnUjK9ie95SMh3WY3v23VXXk2cfTC6T7lWiDe
        KtqPOZNYB4Vtb8USJEMZ18LauYk3dOy1YrUW9DGgif+DXZ6Pq3zPykau/VOtFspG
        RZE9lYsT+ePTMRqU4hDjV1VsP/jkdT246sW/x2IavGqwzx6+DNQJ7F1xUsmMkSZV
        39gtrpHy84LXYnDFBmTtcCSvcS8ZaOXgV44qY+i4HQCcfhQQBODtzs2BQzTOrSCW
        zHw9Xyv+6uvtU315Ijc0jUJToTAGmy48tJCwlVl1hvSRmQ9hxSx0o67bw==
X-ME-Sender: <xms:WedMZIT1bptoBPoRt4x_60BYY4JDVnCpXYvCT572ItzxHTZKB9xxvw>
    <xme:WedMZFw9efQWe7TTecy31RS3FdS603VkRmWjaCJSNgM7vW69KtpEe323aogcfo8Sy
    iB7qNB1QZzsCgu9iQU>
X-ME-Received: <xmr:WedMZF0g8FQWq7Ti3qtkbvKYa4c-SoEjpCGKBfHsCGcvV2Tcz-fLbLCmOI7kzeknSSdVJHfg23zCPeHtOcBW0ZrkfdOqW57FZFE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduledgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepfeeiheejvdetgfeitddutefhkeeilefhveehgfdvtdekkedvkeehffdt
    keevvdeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmhei
    kehkrdhorhhg
X-ME-Proxy: <xmx:WedMZMDB8KeScdbH8Z0_lVLyO_cP52SJx65znrvKBsfaWufwK1lBaw>
    <xmx:WedMZBjD2Ch4RZehOfen5MPRlEu8m-qCh3n3FBHrwd4n5CGBQV-d2A>
    <xmx:WedMZIo9mU6TIGRUgYM73nc58iOXiwaVLU4zP88deH2sCPgXJAmMlA>
    <xmx:WedMZEsbYLz4ETXh_9RRkphVEzA0kN--Uhbdw069h_Puz7mcNDe7Pw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Apr 2023 05:45:58 -0400 (EDT)
Date:   Sat, 29 Apr 2023 19:49:46 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>,
        Stan Johnson <userm57@yahoo.com>
Subject: Re: [PATCH RFC v1] m68k: signal.c: use signal frame gap to avoid
 stack corruption
In-Reply-To: <20230429080410.8993-1-schmitzmic@gmail.com>
Message-ID: <ad929524-52c8-143c-5249-02fd1722383d@linux-m68k.org>
References: <20230429080410.8993-1-schmitzmic@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Sat, 29 Apr 2023, Michael Schmitz wrote:

> Inserting a gap of 20 bytes avoids user stack corruption
> due to a discrepancy between user stack pointer and stack
> state when an instruction is interrupted by a bus fault
> in mid-execution, in particular a movem instruction with
> the user stack pointer as target, such as commonly used in
> the function prologue on C function calls.
> 
> The user stack pointer in this case reflects the stack
> state before the instruction, but as many write operations
> as would fit while on a mapped page are already written out
> at that point. On 030 processors, the resulting exception
> (format b) causes the instruction to be resumed, not
> restarted after return from exception, and only at that
> point is the user stack pointer updated. We must not corrupt
> the user stack by writing beyond what's already stored to
> the stack, and using the pre-execution stack pointer to
> place the signal stack, that is exactly what happens.
> 
> We have two ways to address the issue: avoid running signal
> delivery on format b bus fault exception (as suggested by
> Andreas), or insert a suitable gap into the signal frame to
> avoid it clobbering the stack contets.
> 
> Inserting a gap into every signal frame indiscriminately
> does appear to cause memory leaks or excessive memory use
> on low memory systems (been there ...). Some heuristics
> is called for to only use the frame gap trick where
> appropriate.
> 
> We can use the format b fault address in frame.un.fmtb.daddr
> to find the address where the fault occurred, i.e. the
> address where the instruction will resume. Addresses
> above are no-go, anything up to and including the fault
> address is OK to use. But we better make sure that the fault
> address is actually on the page below the USP, and that the
> start of the signal frame will end up on the same page that
> the fault occurred on (again, been there). The latter might
> be sufficient to ensure we're not hitting an unmapped page
> when copying the signal frame, as the bus fault will have
> been resolved when we get to signal delivery (??).
> 
> The bug that started this debug effort was reported by Stan
> Johnson. Finn Thain developed a test case and debugged the
> stack corruption. Fix developed and tested on my Falcon 030
> with just 14 MB of RAM.
> 
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> CC: Finn Thain <fthain@linux-m68k.org>
> CC: Andreas Schwab <schwab@linux-m68k.org>
> CC: Stan Johnson <userm57@yahoo.com>
> Link: https://lore.kernel.org/r/CAMuHMdW3yD22_ApemzW_6me3adq6A458u1_F0v-1EYwK_62jPA@mail.gmail.com
> Link: https://lore.kernel.org/r/e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org
> ---
>  arch/m68k/kernel/signal.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
> index dfc7590abce8..75f4c4943231 100644
> --- a/arch/m68k/kernel/signal.c
> +++ b/arch/m68k/kernel/signal.c
> @@ -858,11 +858,23 @@ static inline int rt_setup_ucontext(struct ucontext __user *uc, struct pt_regs *
>  }
>  
>  static inline void __user *
> -get_sigframe(struct ksignal *ksig, size_t frame_size)
> +get_sigframe(struct ksignal *ksig, struct pt_regs *regs, size_t frame_size)
>  {
> -	unsigned long usp = sigsp(rdusp(), ksig);
> +	struct pt_regs *tregs = rte_regs(regs);
> +	unsigned long usp = rdusp();
> +	unsigned long ssp = sigsp(usp, ksig);
> +
> +	if (CPU_IS_020_OR_030 && ssp == usp && tregs->format == 0xb) {
> +		struct frame *fmtbframe = (struct frame *) regs;
> +		unsigned long fltp = (unsigned long) fmtbframe->un.fmtb.daddr;
> +
> +		if (fltp < ssp &&
> +		   (fltp >> PAGE_SHIFT) == (ssp >> PAGE_SHIFT)-1 &&
> +		 (((fltp - frame_size) & -8UL) >> PAGE_SHIFT) == (fltp >> PAGE_SHIFT))
> +			ssp = fltp;
> +	}
>  
> -	return (void __user *)((usp - frame_size) & -8UL);
> +	return (void __user *)((ssp - frame_size) & -8UL);
>  }
>  
>  static int setup_frame(struct ksignal *ksig, sigset_t *set,

That seems over-complicated to me... I must be missing something.

What I had in mind was something like this (untested):

	unsigned long usp;

        if (CPU_IS_020_OR_030 && tregs->format == 0xb)
		/* USP is unreliable so use the worst-case value. */
		usp = sigsp(rdusp() - 256, ksig);
	else
		usp = sigsp(rdusp(), ksig);

        return (void __user *)((usp - frame_size) & -8UL);
