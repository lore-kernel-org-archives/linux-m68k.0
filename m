Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BE92C697
	for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Apr 2024 04:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714018597; cv=none; b=n7t2+8NO+cPmtOfo94cRpFpA2H4ngkRFfT8ThlHQa9oqcfh/9zNdFT3fg+bgbSajxk/VdaA7YenOKpm1iWG5mIXDqZidZDLPEI+WpqCVDH3RwN4I31wQIUPLFgJtOYhLmqvSGTfuVFuJb0V8lIq7VencHelMSbGjlg4kZ2rP6GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714018597; c=relaxed/simple;
	bh=v1rDX00H26B64X8GAmCga7nCHYY5dbW8pK2Rgl4yQgQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FifHQkBkvtvkUuJoan0jvJSrA60VNYSUAW/IO8MG0VjtS4Ud7JSpjjDplOwt7UysdNkkvGMVcEJB3Xjz8Pj5rTF8lbSDQzlp+wbyRopdiWClWgmnDaDO3RdYmj2JQegRaqb+FiSOfLhMH5fg74wXD5FcnI8LnvuoRN9qr3kjDvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E5+j4NmV; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E5+j4NmV"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 0F46211400DF;
	Thu, 25 Apr 2024 00:16:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 25 Apr 2024 00:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714018593; x=1714104993; bh=9Jm4J8XJXoVEWn0uuNzPl9K/oH7y
	OpGqzeUskCUAhBo=; b=E5+j4NmVI9r5qKHLZsPOAs6VHMT6rd2+8BJn1JFSkaSC
	oPXABTFixQvJzZydrP1JsC7zIQiOAHWwgFKPcIy3NrZRXJ1d5+r4X8B876yMqSD2
	JV7wbekQ1F7YHN1RzbFZW077+AFwPicud8g4+I8fMlsBghb9nyD9G5xswrZ/hLWs
	aQkhWaXxPDmDBzamT3ssy+NyP3NqCCKlFigM3+IoCorctvyzO71/ZElmusOiqneu
	TRQ++mqml0TEzk4R+SWA9OJy5UE7vBcPP4G+8oR5+XurhxkhB268fECxstCnC4x5
	R2LhU3hyz4A5le7LOuWEG0pCW3hN0Pp2JCW0OtYP0w==
X-ME-Sender: <xms:INkpZoB6Zr8yB6MXg8vbg54BCyCoFa15TGNZPDjlsTv8kEGMp_BnFA>
    <xme:INkpZqhEp8YDzcAzp5X7Qd-niLCxwhXN0AEsXZoGYNy39r1MCVmYFL6EKnX_qx5dS
    rDoTh6HckKgRIkmRPE>
X-ME-Received: <xmr:INkpZrmDJ88xnBgCYx90vZSUVHD8h0XK_8YRIgCvnCBKryZVdLn2YOw3QNzEKF78fd9NUJ0zYf28-6-PgxIZCr7DWJLnwMebuiU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeliedgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:INkpZuy3mtUCgAMjDIjWW-T4HUwy-lVoVv0DkFstW-CJYpz7pCPSxg>
    <xmx:INkpZtQb8mU6b-nQF8SvHVsRU4jyYBozEJgW13bu_74nbLSSJRFhiw>
    <xmx:INkpZpbtbO3eEMNhAZYloq3YSYEue5xpH2Blyc3_NK5uHSHKNCe80Q>
    <xmx:INkpZmR-u4GQtFhnE76bDxfmsvcH6x5e-r8NE3T9a-HkcbSifnR02A>
    <xmx:IdkpZodP7fEDd7IptHWvhabJuqS7C2oQ7yvSFY_sVeiZLLYKqmD8BVE4>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Apr 2024 00:16:29 -0400 (EDT)
Date: Thu, 25 Apr 2024 14:16:49 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
In-Reply-To: <20240422022943.13775-2-schmitzmic@gmail.com>
Message-ID: <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org>
References: <20240422022943.13775-1-schmitzmic@gmail.com> <20240422022943.13775-2-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Mon, 22 Apr 2024, Michael Schmitz wrote:

> As mentioned by Finn Thain in his patch to improve put_user exception 
> handling on 040, a similar problem exists on 030 processors.
> 
> A moves instruction that crosses a page boundary from a mapped page into 
> an unmapped one will cause a mid-instruction bus error exception (frame 
> format b), with the PC pointing (usually) two instructions past the 
> faulting movesl instruction.
> 
> Our exception handling in __generic_copy_to_user only covers the 
> instruction immediately following the faulting one. As a result, 
> fixup_exception in send_fault_sig does not detect this case, and cause 
> send_fault_sig to oops.
> 
> Extend the exception table to cover one additional instruction beyond 
> the moves[lwb] instructions.
> 
> Tested on 68030 (Atari Falcon 030) with a transfer beginning at a single 
> byte at the end of a mapped page followed by further bytes on an 
> unmapped page (testcase derived from stress-ng sysbadaddr stressor by 
> Finn Thain).
> 
> A similar problem exists in __clear_user(); modify the exception table 
> for that function in the same way (untested)
> 

I've just tested this on a Motorola 68040 and I got an oops in 
__generic_copy_to_user(). It appears that we need more entries in the 
exception table. (I also tested in QEMU and it did not oops.)

This oops indicates that we are going to need the final NOP that was in 
the first version of your patch. My test program seems inadequate to show 
that it is safe to omit that NOP -- we would need a test which doesn't 
jump over the MOVES.B.

Unable to handle kernel access at virtual address c0029000
Oops: 00000000
Modules linked in:
PC: [<0046454c>] __generic_copy_to_user+0x48/0x5c
SR: 2000  SP: 0152df10  a2: 01502160
d0: 00000000    d1: 00000001    d2: 2f746d70    d3: c0028fff
d4: 00000400    d5: c0028fff    a0: c0029003    a1: 0081bfff
Process badaddr-3syscal (pid: 83, task=01502160)
Frame format=7 eff addr=0152df6c ssw=0c81 faddr=c0028fff
wb 1 stat/addr/data: 0001 20000046 fcae0008
wb 2 stat/addr/data: 0081 c0028fff 2f746d70
wb 3 stat/addr/data: 0045 0152df64 2f746d70
push data: fcae0008 00000005 0152df88 0046451e
Stack from 0152df78:
        c0028fff 00000005 00000005 0081b000 0152dfc4 00128cf6 c0028fff 0081bffb
        00000005 00000400 efd92d5c 8000087a 8000408c 0099dd90 00c29900 0099d910
        00c0c400 0081bffb 00000ffb efd92d48 000027a2 c0028fff 00000400 efd92d5c
        8000087a 8000408c 8000408c 00000000 efd92ea4 ffffffda 000000b7 00000000
        0000c011 a5100080
Call Trace: [<00128cf6>] sys_getcwd+0xc8/0x15a
 [<000027a2>] syscall+0x8/0xc
 [<0000c011>] mac_reset+0x16d/0x170

Code: 0001 6706 3419 0e58 2800 0801 0000 6706 <1419> 0e18 2800 242e fff8 262e fffc 4e5e 4e75 4e75 4e56 0000 48e7 2018 242e 0008
Disabling lock debugging due to kernel taint

00464504 <__generic_copy_to_user>:
  464504:       4e56 0000       linkw %fp,#0
  464508:       2f03            movel %d3,%sp@-
  46450a:       2f02            movel %d2,%sp@-
  46450c:       262e 0008       movel %fp@(8),%d3
  464510:       242e 0010       movel %fp@(16),%d2
  464514:       2f02            movel %d2,%sp@-
  464516:       2f03            movel %d3,%sp@-
  464518:       4eb9 0046 44c6  jsr 4644c6 <__clear_user>
  46451e:       2002            movel %d2,%d0
  464520:       e488            lsrl #2,%d0
  464522:       7203            moveq #3,%d1
  464524:       c282            andl %d2,%d1
  464526:       226e 000c       moveal %fp@(12),%a1
  46452a:       2043            moveal %d3,%a0
  46452c:       4a80            tstl %d0
  46452e:       670a            beqs 46453a <__generic_copy_to_user+0x36>
  464530:       2419            movel %a1@+,%d2
  464532:       0e98 2800       movesl %d2,%a0@+
  464536:       5380            subql #1,%d0
  464538:       66f6            bnes 464530 <__generic_copy_to_user+0x2c>
  46453a:       0801 0001       btst #1,%d1
  46453e:       6706            beqs 464546 <__generic_copy_to_user+0x42>
  464540:       3419            movew %a1@+,%d2
  464542:       0e58 2800       movesw %d2,%a0@+
  464546:       0801 0000       btst #0,%d1
  46454a:       6706            beqs 464552 <__generic_copy_to_user+0x4e>
  46454c:       1419            moveb %a1@+,%d2
  46454e:       0e18 2800       movesb %d2,%a0@+
  464552:       242e fff8       movel %fp@(-8),%d2
  464556:       262e fffc       movel %fp@(-4),%d3
  46455a:       4e5e            unlk %fp
  46455c:       4e75            rts
  46455e:       4e75            rts

