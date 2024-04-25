Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E11E3BBE8
	for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Apr 2024 06:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714027666; cv=none; b=K8eH5kGg1TbMbU4frRz3F0Zz1iULxt1XZwLxKBQnqaLBwpFyJW83w1lQN8DR8dlxG+ZcxTMWoe/0zjn6vLDjVqf6htIEcDV6nwTV9Ldwjj13SlSkGum3gOBM3eTlMAQQER2LByCL6nxfGT59gPiTngEDZh37RqrQOYFAqfXRNe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714027666; c=relaxed/simple;
	bh=KqgjUceMo8LFvkhwpsLDObJ2Embh7gD7IW37EJxZo8I=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LdsN5i5TgHYulawox3jmwdCQt26ZwyfV/kqrc2XpEF2YawWqwqmQTI7OzwlNhV4J1snjP1kBJo9GVx4Hn5hGfrQdVrDg5QUUVH4oAJJg10mt1PPcX0i4f38KXImdffzStVL2imKA1QaRKG2wULlyCn/LE7ALKuHD9JFF/AdYJ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Lq/Z2Hmk; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lq/Z2Hmk"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id 6C57D1C000CD;
	Thu, 25 Apr 2024 02:47:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 25 Apr 2024 02:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714027662; x=1714114062; bh=s/r8sPdWKYWttfj5V0iY1HhX4kun
	sPfg1QIKmHLL1cg=; b=Lq/Z2HmkFiTmVYllon1toRWKrO8DR0Mh+TVHrejCHotF
	SDIcUWj7Q3vBlUzpIJfWCRrs1DxDbqkvNhintdbr8xzVlKTUAhCsHUXKXU24qtKd
	U/pie5eQYcDJfczuXLZJg1/1g/RglQoug9E+hB0HjX/I5ZC5D7nnT3bLULlmnQQx
	BERVVRAR1kLBsP4ySIlbAvZq4CpaFGi5WjAlLZYKHPyig0UtYW7eHcalSAHIsHcU
	jzXDux7sCIb002EiszryWY2G/zV7EJlkLVriTQiNGWuDNHRTUBX+W1UMPZqcbclA
	Phsg/Fz03UTZvhF1VR7D/7Ot9RMdhs8NzcZV3zMN6w==
X-ME-Sender: <xms:jvwpZru91ZB4CgdcttM8Le8yjUv5jTkqkbv8y2QudrF78MakgpMG8A>
    <xme:jvwpZsfm0Q1C-9pmX5nWgRZFQIquHG0SojsOdtCUtzMBBjyT8uxlXhqP7Dt1VqxZQ
    YG4SZeSrLPTFaFDzlc>
X-ME-Received: <xmr:jvwpZuxkisB3zAnwyEMtlvNmIy6yWpvklSAbfxQgm224wFp6QyCPuK7-FgXiyNzIwnTdrx7p8c6se-OjHbXSRpGLooPo0DoA5jI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeliedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:jvwpZqNsDEhpzzmCB7Nxm3uBmqt3rz1tPpuSyOYafOQzl3wXT45Trg>
    <xmx:jvwpZr93bJNVpWOntCQOWKWG8LnrPGkH2uu54iin2zRihlC0VlNp7g>
    <xmx:jvwpZqUyv7-216k41qNpWQMLnOZpsGeaAFP37C5CrUWkdAWZKO2T9A>
    <xmx:jvwpZsdfoqRmACVrKyX0carK4lnT5kWGQmZdyzy2iIhP7sLwqJC7xw>
    <xmx:jvwpZtIdwQtoVrIsDnISPYZkJRQLn7Ondr_QYM7swQQTaXjsXifpSJiF>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Apr 2024 02:47:39 -0400 (EDT)
Date: Thu, 25 Apr 2024 16:47:58 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
In-Reply-To: <989ec316-69c3-d5e6-8312-9a62e78be547@gmail.com>
Message-ID: <e34c716c-8dc9-f74f-1183-03ecfb0b300d@linux-m68k.org>
References: <20240422022943.13775-1-schmitzmic@gmail.com> <20240422022943.13775-2-schmitzmic@gmail.com> <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org> <989ec316-69c3-d5e6-8312-9a62e78be547@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Apr 2024, Michael Schmitz wrote:

> --- a/arch/m68k/lib/uaccess.c
> +++ b/arch/m68k/lib/uaccess.c
> @@ -68,23 +68,25 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
>  		"3:	subq.l	#1,%0\n"
>  		"4:	jne	1b\n"
>  		"5:	btst	#1,%5\n"
> -		"	jeq	7f\n"
> -		"	move.w	(%1)+,%3\n"
> -		"6:	"MOVES".w	%3,(%2)+\n"
> -		"7:	btst	#0,%5\n"
> -		"8:	jeq	10f\n"
> -		"	move.b	(%1)+,%3\n"
> -		"9:	"MOVES".b  %3,(%2)+\n"
> -		"10:\n"
> +		"	jeq	8f\n"
> +		"6:	move.w	(%1)+,%3\n"
> +		"7:	"MOVES".w	%3,(%2)+\n"
> +		"8:	btst	#0,%5\n"

I understand why you put the MOVE.W and MOVE.B into the exception table.

> +		"9:	jeq	13f\n"
> +		"10:	move.b	(%1)+,%3\n"
> +		"11:	"MOVES".b  %3,(%2)+\n"
> +		"12:	nop\n"
> +		"13:\n"
>  		"	.section .fixup,\"ax\"\n"
>  		"	.even\n"
>  		"20:	lsl.l	#2,%0\n"
>  		"50:	add.l	%5,%0\n"
> -		"	jra	10b\n"
> +		"	jra	13b\n"
>  		"	.previous\n"
>  		"\n"
>  		"	.section __ex_table,\"a\"\n"
>  		"	.align	4\n"
> +		"	.long	1b,20b\n"

... but I don't see why you need the MOVE.L in there (?)

Also, it is odd to see the third JEQ added to the table but not the second.
Perhaps we don't need either one in there (?)

>  		"	.long	2b,20b\n"
>  		"	.long	3b,20b\n"
>  		"	.long	4b,20b\n"
> @@ -93,6 +95,8 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
>  		"	.long	8b,50b\n"
>  		"	.long	9b,50b\n"
>  		"	.long	10b,50b\n"
> +		"	.long	11b,50b\n"
> +		"	.long	12b,50b\n"
>  		"	.previous"
>  		: "=d" (res), "+a" (from), "+a" (to), "=&d" (tmp)
>  		: "0" (n / 4), "d" (n & 3));
