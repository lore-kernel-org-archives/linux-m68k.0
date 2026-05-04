Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB00359A80
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 May 2026 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777885512; cv=none; b=tIIsLAWpYiU/fk8fmk4dX4nV7kbNabJN+9BOgujqGaLgZCK34zLT1C/zvT9wHwv+CwJGrMSFbZ9DtgUxstrstxYXk65UpMz3IVehU/oYCqXzQlOUvH1mBNAi6ZI/d70h6/tJuOKaziRZg9Aqkes28giEFGZZJMxGUkTwY7h+yvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777885512; c=relaxed/simple;
	bh=ysDliP+cTwfp+JFOJxQgFwZc7XXXKZ6ULXzFrwmC2rQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mkZoaje85ejYgtJ/P1dvJFJrykr8KO9Hk/w0d1h9hSk2ek4bMdZl5RoHbh0cA9uIq37smFUX1kA1f5wEuFMMcKifOF2p50BwO44yWuJrSVMDo3F67F3u4/lyeTNy4N6JNBxQicMpCL0q4aPSonpqTC+K4ZDboYq940zgszS4tM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VDsmhV06; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VDsmhV06"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id A8DACEC00A9;
	Mon,  4 May 2026 05:05:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 04 May 2026 05:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1777885509; x=1777971909; bh=TgFzU3+S8XCgZcciyuhLQbE5LbrXOLdAngJ
	dLUL1EEQ=; b=VDsmhV06QtqqleM2hqWLiECZ5VfY5vNRR2jHfxqpnbShuJKseAm
	SMrHBM6H8Sy22UchhJUwL07cQ4TkWjca2OmhdZR5gP09yuPgF1zzgwdUxiwtVhpk
	Ekhuun2oVDJ6SUY0enRqLpUp8fTLcqoUUlnZliCeM6noZ20OZqma6wNThHhC0uLN
	NuZZ+EbopNt55Gbsjhw1sa2lelkswvWkTq2dfAGD8iglle2J0lYYII+NMvwhqsU2
	+JpOIv1BnkQqzpIaG1WpHJiDOhd/Bcz+coY+iOWDxlhvzgIaNLSDINA4vJPE9mSm
	AcHg6UqNaWy/Rekr5SBH9PGAThKXSt5yNqw==
X-ME-Sender: <xms:RWH4aXjXIuFdVrTERIYG5u9ZQcwreU4JyWNa29UZ39x14rNfwJj2ow>
    <xme:RWH4aR2cK7VA1Bg6i_TMtnnqW8u0ZDx1fPYaIUH8Fj-zHyVzLYAwnp_yXEwh8YSNK
    DHOrT90k1agQJf-EUmrKT5C6tMI1JUFjLQCJLIXCay-zR3v1g2j9gg>
X-ME-Received: <xmr:RWH4aRi80A9MTmXkio6XDRwiW9NpQMRg8J7w8VF7J-anP1z5ThvE7JJ5xFXwsKHfPcB7ko_GcwxH_dAUzrNF89PD17ZaYlA2Ec4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfvhhgr
    ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueehueel
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
    grihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohepgedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorh
    hgpdhrtghpthhtohepshgthhhmihhtiihmihgtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:RWH4aRf0k8kcBJajG6_MKvVcT7mIsio90LKkzprhDrBsiLFV08fzXA>
    <xmx:RWH4aUmrakC1WgvvAWRvRtEy6SLTWRZtNt2o4Ch9rRs8irS8EzEOZg>
    <xmx:RWH4aatqx5Oduz8FWTwNfIR9BtL5DHekbgXAQ5vmxHCP6gA7Sb-Nlw>
    <xmx:RWH4aa-fdFjUKUZXj0fvukupYhU4NFX3ugL0JcmwoT2Jnw4F4v7f9w>
    <xmx:RWH4afTR6rRVbR7Lr1kr9yQDcB-We1OSX90OmOzWvNK3BG4KPQMPY488>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 05:05:06 -0400 (EDT)
Date: Mon, 4 May 2026 19:05:01 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@lists.linux-m68k.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: Handle put_user() faults more carefully
In-Reply-To: <1ed9c4c753395510c1a8df9c35e2ad4c31c90f95.1714265926.git.fthain@linux-m68k.org>
Message-ID: <fb2ca693-1f99-2c5a-7ff0-9bcf22f89de0@linux-m68k.org>
References: <1ed9c4c753395510c1a8df9c35e2ad4c31c90f95.1714265926.git.fthain@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


ping...

On Sun, 28 Apr 2024, Finn Thain wrote:

> Running 'stress-ng --sysbadaddr -1' on my MC68040 system immediately
> produces an oops:
> 
>     Unable to handle kernel access at virtual address f1c422fb
>     Oops: 00000000
>     Modules linked in:
>     PC: [<00005a1a>] do_040writeback1+0xae/0x160
>     SR: 2010  SP: 96087dc2  a2: 01500000
>     d0: 00000000    d1: 014e8000    d2: 00000081    d3: 00000000
>     d4: 00000481    d5: c043dfff    a0: 014e8000    a1: 00632fd5
>     Process stress-ng (pid: 221, task=1b729d30)
>     Frame format=7 eff addr=014e9eb8 ssw=0c81 faddr=c043dfff
>     wb 1 stat/addr/data: 0001 00000481 c043dfff
>     wb 2 stat/addr/data: 0081 c043dfff 2f746d70
>     wb 3 stat/addr/data: 0005 014e9ed4 2f746d70
>     push data: c043dfff 800daa70 00000000 014e9f1c
>     Stack from 014e9ed4:
>       2f740000 8017c000 014e9f10 00006830 00000081 c043dfff 2f746d70 2f746d70
>       0081a000 00000400 c043dfff 800daa70 c043dfff 80016a20 00000003 014e9f88
>       000026c8 014e9f1c 00000001 2f746d70 0081a000 00000400 c043dfff 0081afff
>       c043dfff 01500000 00000001 ffffffff 00000000 20000046 41d67008 014e9f58
>       04810005 00810045 c043dfff 014e9f84 2f746d70 c043dfff 2f746d70 c043dfff
>       80016a20 8017c000 00000000 0081affb 00000005 014e9fc4 00128bc6 c043dfff
>     Call Trace: [<00006830>] buserr_c+0x510/0x698
>       [<000026c8>] buserr+0x20/0x28
>       [<00128bc6>] sys_getcwd+0xc8/0x15a
>       [<000027a2>] syscall+0x8/0xc
>       [<0008800d>] sanity_check_segment_list+0x17/0x11e
> 
>     Code: 000c 0e90 1800 220f 0281 ffff e000 2041 <2228> 0008 0281 00ff
>           ff00 67a4 6026 4280 122e 0013 206e 000c 0e10 1800 220f 0281
> 
> The cause is a deliberately misaligned access in the 'bad_end_addr' test
> case in the 'sysbadaddr' stressor. The location being accessed here,
> 0xc043dfff, was contrived to span the boundary between a r/w anonymous page
> and an unmapped page. The address was then passed to the getcwd syscall
> which faulted in copy_to_user().
> 
> The fault for the mapped page appears to be handled okay -- up until
> do_040writeback1() called put_user() which produced a second fault due to
> the unmapped page.
> 
> Michael Schmitz helpfully deciphered the oops and explained the exception
> processing leading up to it.
> 
>     "regs->pc does point to the PC in the format 7 frame which is the PC
>     the fault was detected at, but not (in case of a writeback fault)
>     the PC of the faulting instruction [that is, MOVES.L].
> 
>     "The writeback would still cross the page boundary, and fault if the
>     unmapped page still isn't present. We would not see the PC of the
>     movesl in that case, and fail to find the PC in the exception
>     table."
> 
> One solution is to add a NOP instruction after the MOVES.L to flush the
> pipeline and take the fault. That way, the PC value in the exception frame
> becomes dependable so the exception table works.
> 
> Theoretically, there seems to be another bug in the existing code. If
> the instruction following the MOVES faulted, then after the fixup,
> execution would resume at the instruction which caused the fault. This
> appears to be a loop. After this patch, that cannot happen.
> 
> Cc: Michael Schmitz <schmitzmic@gmail.com>
> Reviewed-and-tested-by: Michael Schmitz <schmitzmic@gmail.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> 
> So far this has only been tested on Motorola 68030 and 68040 systems
> and still needs testing on the other MMU-enabled processors.
> 
> I don't know whether or not get_user() has the same problem. Hence this
> patch is confined to put_user().
> 
> No change since RFC patch.
> ---
>  arch/m68k/include/asm/uaccess.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
> index 64914872a5c9..44e52d8323e5 100644
> --- a/arch/m68k/include/asm/uaccess.h
> +++ b/arch/m68k/include/asm/uaccess.h
> @@ -31,11 +31,12 @@
>  #define __put_user_asm(inst, res, x, ptr, bwl, reg, err) \
>  asm volatile ("\n"					\
>  	"1:	"inst"."#bwl"	%2,%1\n"		\
> -	"2:\n"						\
> +	"2:	nop\n"					\
> +	"3:\n"						\
>  	"	.section .fixup,\"ax\"\n"		\
>  	"	.even\n"				\
>  	"10:	moveq.l	%3,%0\n"			\
> -	"	jra 2b\n"				\
> +	"	jra 3b\n"				\
>  	"	.previous\n"				\
>  	"\n"						\
>  	"	.section __ex_table,\"a\"\n"		\
> @@ -53,11 +54,12 @@ do {								\
>  	asm volatile ("\n"					\
>  		"1:	"inst".l %2,(%1)+\n"			\
>  		"2:	"inst".l %R2,(%1)\n"			\
> -		"3:\n"						\
> +		"3:	nop\n"					\
> +		"4:\n"						\
>  		"	.section .fixup,\"ax\"\n"		\
>  		"	.even\n"				\
>  		"10:	movel %3,%0\n"				\
> -		"	jra 3b\n"				\
> +		"	jra 4b\n"				\
>  		"	.previous\n"				\
>  		"\n"						\
>  		"	.section __ex_table,\"a\"\n"		\
> 
