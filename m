Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6F2C77B72
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Apr 2023 05:13:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjDTFNn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Apr 2023 01:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjDTFNm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Apr 2023 01:13:42 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F01154234
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Apr 2023 22:13:40 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id AC3155C0226;
        Thu, 20 Apr 2023 01:13:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 20 Apr 2023 01:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681967617; x=1682054017; bh=tHoNceUbU3zVT
        yijkKJssXuMxZXeSdmuIz7urJu2QGs=; b=KY1fc4it7vylvL0KJNkU+HvZze8JX
        hxa5P1vI1Rlsx5snlVLdzxYAhLXl6LFzbXDhEIfvSBIYN4S5sEzv5+XUAF/taXez
        6Vw1Y6wd3GTFaZ9BZPlQ75pAJH0uR6PSjvj2QwNhNVpb9aI5JsDRTkAKzgSGac/g
        vacCL2hlHxiTPEs9xug1p+sXt1tI8h3uG0+OdK0Cg6aMFhQcxHuQH5c2m6IF4ejx
        Y/hYtFw7Z7Z9s2/DRIJVdVXyY2sD9Bd3UjTTy2t2JjY2sQbdqFZlbCOdNmABMwbd
        esdMqH3fST6oEuoCPs/xHSpTAsMRxKtHVXJ0p6HkCW9B72yb7PsEE+SXQ==
X-ME-Sender: <xms:AcpAZAUjAil3qx_PNrS2AELTHOaS9iEvEmqWbj-K8z1ZARrXIdYDNw>
    <xme:AcpAZEmD8Uf8zVvw6Ns1Z2oPgnsF0MVFVW8wvG4EUtnz6SILfGbZtqk6q9bw5g2_-
    Kxn7q3EfHGvJo5PAlg>
X-ME-Received: <xmr:AcpAZEbUdOo1gAvXcdPPIFblTzZB3LBJD4V5zH0T2TDGdK9V9kx1GihAfOyVUACFp18ksH-KuibNMp3WEfTIt8p_OBEo7GhsI_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtuddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:AcpAZPWx4HPDUnTICjhZT7oqb3vxO5Om-CJzgBdfrGUq94-TSbgOvQ>
    <xmx:AcpAZKmnrfYhoscKFwl5L5DsSJNj8Drank-MShniaXV3hg8HVHcxzg>
    <xmx:AcpAZEfVRKudXWqG_Nmt3CHBJL12WwiUDHxnSY1-T9gLTJynC6IsqQ>
    <xmx:AcpAZBv0URmoQjKMRWcQ9cgb71XBUBtzO-aYA8uRPXKvlyCxD3XwCg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Apr 2023 01:13:34 -0400 (EDT)
Date:   Thu, 20 Apr 2023 15:17:08 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: reliable reproducer, was Re: core dump analysis
In-Reply-To: <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
Message-ID: <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org> <60109ace-4e55-29da-86d9-35e931b11134@gmail.com> <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org> <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com> <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com> <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org> <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 20 Apr 2023, Michael Schmitz wrote:

> >
> > As with dash, the corruption lies the page boundary.
> 
> Hence implies a page fault handled at the page boundary.
> 
> Can you try and fault in as many of these stack pages as possible, ahead 
> of filling the stack? (Depending on how much RAM you have ...). Maybe we 
> would need to lock those pages into memory? Just to show that with no 
> page faults (but still signals) there is no corruption?
> 

I modified the test program to execute rec() to full depth with no 
forking, then do it again with forking.

root@(none):/root# while ./stack-test 5000 ; do : ; done
starting recursion
done.
starting recursion with fork
done.
starting recursion
done.
starting recursion with fork
Illegal instruction
root@(none):/root# 

I can't get this to crash during the first descent. The second descent 
always crashes, given sufficient depth:

root@(none):/root# while ./stack-test 50000 ; do : ; done
starting recursion
done.
starting recursion with fork
Illegal instruction

So all the stack pages would have been faulted in well before the failure 
shows up. It appears to be the signal that's the problem and not the page 
fault. That's not surprising considering the PC in the signal frame in the 
dash crash was a MOVEM saving registers onto the stack.

It's worth noting that the test program never crashes with a corrupted 
return address. Random corruption would have clobbered that address about 
10% of the time, since the entire rec() stack frame is 9 long words. So it 
must be that a MOVEM went awry when a signal got delivered.
