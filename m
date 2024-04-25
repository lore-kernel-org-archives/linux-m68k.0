Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10885134A8
	for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Apr 2024 06:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714026742; cv=none; b=u5JDVSJP0ybI39LzjFg89iIB6FH7a67XeOcmPwuqgvxwVnadb7TQwUX2bTsRoAqZ/C3zLyzRDF4dp79LezE+w3biCXmOCBdFTfZoZ1UGO0yh7ILr0dUowVufOnOmbO9nokfBjnfxfRXcZGxv/mlXzq8zKFSazaoAPsp/0cQ5rmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714026742; c=relaxed/simple;
	bh=JpfZw62a/hVbPGraLLtkYh2jE+EPoCdWJCUoQftRhq8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KVLoYFYtraBTG8f14aa3feHFbc/fG+3mh9TU80SDPFf1l3ARAOnJ7bMjfwcIKHGldnleN6ClpxTJ9/SkhQ9qpK/NGArBdRGPFqShR9+ITt21DnAGfRvuOcp34omDvZ377UMWs+MVU5senBpb1U3SsAmdy0ub7J7ZIfHJU271B2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GdioIT94; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GdioIT94"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id BAE371C00112;
	Thu, 25 Apr 2024 02:32:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 25 Apr 2024 02:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714026738; x=1714113138; bh=QQ7k7PrEueu4SWwjKtBv97Moq4yf
	aC5MS0fBezt2Hu0=; b=GdioIT949h0gCJoK0nHC2dyj8UaJYzXQsPyo5CX/1Uk6
	JnMJxNkGXZlloAF4xkB0mn5XfqA+s2C5WS77gx9t+uX3gnoHd1VYGDc8QX3mE2eH
	SYyUpUtUH1Avtj2lJsHVxOzas3Ki3FPYiCFL3k5f2fbIVnN4t0kRFi4HZHNEUOix
	8YNvIFEwnLK/d6mMhMMsKqVIAhcqztgU4tOY5WUoEaKQ9jydRkCtcLz0YwMnuSru
	g/WyGoxd8AvGkUL9vS6pMXMzNbBUNPHfVGI+JtP/95cYweP5qyjMz8YxOvOyvYav
	iwuXkLhp7KojUL7ngdObqBrzbka1mj6piz0xQ98n4A==
X-ME-Sender: <xms:8fgpZnX3SFQeLleQIHJvoLsTV9QDmHmeMiG92iBKRecIN29JY0Gp-Q>
    <xme:8fgpZvmWNk-xMFhq5b2udjwpPy7Au3oURUYaVVNomVEGcbey5uc9G3h0Wbo5jpRph
    cRY2nt1cgjohxMXYzE>
X-ME-Received: <xmr:8fgpZjZWztgTbbkePdlmQbDLmziN2FdW2cIsACG5t-oevKXhtAiaihMAdtiwvHlv33vhOpn7IHV0usp1lo8893VeH8WKRVOsYrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeliedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:8fgpZiWl-kNzMkzCeAnb-JMUcZGdLG3350ruExBn3A_i1BEfMdVaNA>
    <xmx:8fgpZhlTd7JDb0dxjLZKSYjmoH61IGhbGuu8alax0t7AyVOQOR2FLA>
    <xmx:8fgpZvdzaftD0v_Ss0vW-YOCCvHHgvprItQ6pFSFsT3ciC9MLcUERg>
    <xmx:8fgpZrHbZ1bXW_z-LFFaLvfH07VXcEqF7kSipVBTXyQBMuMKtiWnkQ>
    <xmx:8vgpZmxKZmSuOlgi-MFr0OxRsOXpyPx3DgvBh-StA9FaqbNvPhZkjgPc>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Apr 2024 02:32:16 -0400 (EDT)
Date: Thu, 25 Apr 2024 16:32:35 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
In-Reply-To: <5d1a552e-f66d-dbbb-5630-42d22870dd15@gmail.com>
Message-ID: <36a70661-3bfc-46f1-f211-fa87f883371a@linux-m68k.org>
References: <20240422022943.13775-1-schmitzmic@gmail.com> <20240422022943.13775-2-schmitzmic@gmail.com> <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org> <5d1a552e-f66d-dbbb-5630-42d22870dd15@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Thu, 25 Apr 2024, Michael Schmitz wrote:

> >
> > I've just tested this on a Motorola 68040 and I got an oops in 
> > __generic_copy_to_user(). It appears that we need more entries in the 
> > exception table. (I also tested in QEMU and it did not oops.)
> 
> I'm a bit puzzled about the location of the fault.
> 
> The values of faddr and a0 from the exception frame indicate that the 
> transfer leading up to the fault was a longword transfer. Both ssw and 
> wbs2 suggest the same. Yet we don't take the fault on the longword 
> moves, but apparently on the word moves right after.
> 
> That can't be right either - d1 is 1 so the word moves would have been 
> skipped. It appears that we only take the movesl fault the next time any 
> bus cycle is initiated on 040 (the moveb at 0x46454c).
> 

Seems so.

> That's different from how the 030 faulted in the same situation. I 
> expect we'll have to add exception table entries on the movew and moveb 
> instructions, too. I'll do that next.
> 
> > This oops indicates that we are going to need the final NOP that was 
> > in the first version of your patch. My test program seems inadequate 
> > to show that it is safe to omit that NOP -- we would need a test which 
> > doesn't jump over the MOVES.B.
> 
> We'd need a test using any number of longword moves expected to succeed, 
> followed by a byte move which is expected to fault. The current test 
> would attempt to do a byte move, but faults during the longword moves.
> 
> This requires running the test program in a directory whose absolute 
> path is a multiple of four characters long, and setting the start 
> address for the getcwd test accordingly, so the newline at the end of 
> the string is the single byte left to copy. Does that make sense?
> 

Yes (I take it you meant NUL instead of LF). But my concern was that the 
test program passes a pointer like 0xc0029000 - 1. That means the final 
byte will land on a word that already faulted. I'll need to add a new test 
that passes a pointer like 0xc0029000 - 5.

> Incidentally - what is the path this tests is run in? Any path longer 
> than five characters (including the newline) would have to had looped 
> back to the first movel, and faulted there?
> 

It was /tmp.

> As you said before - we'd need to know a lot more about 
> microarchitectural details here.
> 

It's hard to be certain. We just have to experiment until we find 
something that works on the CPUs we can test.
