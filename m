Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6854642B
	for <linux-m68k@vger.kernel.org>; Sat, 27 Apr 2024 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714210452; cv=none; b=F5NNpej9d0J+AYQVIMq5QDchP4dzxkJTzvBdJvKoJb/4rW20scZZfIW3i6zmmcu6UxXMtIrGUmggDmDZurVZkFvzRFHcOPvE2g2mSZ+htk5GdqM99vRCHlnGPDmfk1vhyCGLsXh5Nq7n8eGvvkYdkICFpvLwkQraD9NGTopWQwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714210452; c=relaxed/simple;
	bh=3YFi9QagV/mPK1k21SoNID3b+j5Jyi/ND4krM8kKwU4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nmHZgkCTF/5Cqs8U8hvbKhqfPKdV0OSS5DILI2f6eA3YIRqYvhLNOUr9ixPI+L8JlRDhPfYrkh+NF/BIas218Zvi5Drt4dngc7rfqWkL9kVNPDhNiKxb1u10m+YnesBltERR9dyNJ2fbZC0wJlWetKygPcM09iyDs84PRoqivJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LZ8L30o7; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LZ8L30o7"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id E7DA81C00101;
	Sat, 27 Apr 2024 05:34:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 27 Apr 2024 05:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714210449; x=1714296849; bh=10OrAVBv6qGJhIgbBP3q3k7QULeR
	FTsOqHH2kFZyRps=; b=LZ8L30o78spNqEHHe0EBwp3MGgNCvMHOB+YRoK/e9x2l
	aw5MtvFK4ujDx4NsuUpUlRqjrFhL1sAV+LIA0i7AaiNEuO7UBUrg+LFD8aAhoWPB
	6VvUeV0buIln57b/yVqzwoB5/YnxfGLmSVtYt4n5JFM5m4Npbt3ARGQ84V+Sa9Ri
	egtiFVVT8kx7X6mE8BLoLIba44uSirouIADRi/04SQ4W0g9TjEWGu6elCdWudqBd
	Yrv4y5h2gPKXry2cFUSQsXjv4ZsT5/L64W67KAdu1btOIHNoLiengl+k5kMWv+vL
	5N0pkkQIOlYlq9PQeGh2XaY//fJT2JtMUafCEqrtsw==
X-ME-Sender: <xms:kcYsZs2epNb4a3YLAF1gNU0wR0rbBqcgTq-jakL36r11yDRMYpV_VA>
    <xme:kcYsZnHntb2fHvWZuJqzpv6L3vY5_9yo5Y5eOwJWxvElk5DrpjTb0x_E6I-TadVhT
    iJyBoXS5erA1UD1Ti8>
X-ME-Received: <xmr:kcYsZk5p74Xxe-fLUe7lpskqTfnAsoKFi8m5_n3NORJOSmrmYvsg9QfEr6Ete6hDx2sL5F8ZoqpWmQl5FVTfEJdv6jEyPflvZ0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddtuddgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:kcYsZl1WVxwJbJ96BJqz_Lijh-gNFeQfQzUsz2_UXSsTo9dq6eCiqA>
    <xmx:kcYsZvEXxwiQoJ7T5sUU0TOtk9qdSX5s2tii2M29LNBR4iVMjPlz9w>
    <xmx:kcYsZu9TWi2jcVkzMLJSe-4ySRBdeFOuIVszV1ecNfNkHbuKLwy4NQ>
    <xmx:kcYsZkkI0Iu5x55k2EZUvC8b18n1X9ev4_9Nukj3Fh2v00Yjvgqfzw>
    <xmx:kcYsZjj3dBlDWXau4CF8plAcszSZim4jOa-6IhD31yOjC5NCLuvX-mWX>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Apr 2024 05:34:07 -0400 (EDT)
Date: Sat, 27 Apr 2024 19:34:30 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org, gerg@linux-m68k.org, 
    linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v3 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
In-Reply-To: <20240427084815.1449-2-schmitzmic@gmail.com>
Message-ID: <fdbe029b-1df0-3e8d-fced-64cc719397fa@linux-m68k.org>
References: <20240427084815.1449-1-schmitzmic@gmail.com> <20240427084815.1449-2-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Sat, 27 Apr 2024, Michael Schmitz wrote:

> 
> diff --git a/arch/m68k/lib/uaccess.c b/arch/m68k/lib/uaccess.c
> index 86b6fed5151c..e3ed893047f8 100644
> --- a/arch/m68k/lib/uaccess.c
> +++ b/arch/m68k/lib/uaccess.c
> @@ -62,35 +62,42 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
>  
>  	asm volatile ("\n"
>  		"	tst.l	%0\n"
> -		"	jeq	4f\n"
> +		"	jeq	5f\n"
>  		"1:	move.l	(%1)+,%3\n"
>  		"2:	"MOVES".l	%3,(%2)+\n"
>  		"3:	subq.l	#1,%0\n"
> -		"	jne	1b\n"
> -		"4:	btst	#1,%5\n"
> -		"	jeq	6f\n"
> -		"	move.w	(%1)+,%3\n"
> -		"5:	"MOVES".w	%3,(%2)+\n"
> -		"6:	btst	#0,%5\n"
> +		"4:	jne	1b\n"
> +		"5:	btst	#1,%5\n"
>  		"	jeq	8f\n"
> -		"	move.b	(%1)+,%3\n"
> -		"7:	"MOVES".b  %3,(%2)+\n"
> -		"8:\n"
> +		"6:	move.w	(%1)+,%3\n"
> +		"7:	"MOVES".w	%3,(%2)+\n"
> +		"8:	btst	#0,%5\n"
> +		"9:	jeq	13f\n"
> +		"10:	move.b	(%1)+,%3\n"
> +		"11:	"MOVES".b	%3,(%2)+\n"
> +		"12:	nop\n"
> +		"13:\n"
>  		"	.section .fixup,\"ax\"\n"
>  		"	.even\n"
>  		"20:	lsl.l	#2,%0\n"
>  		"50:	add.l	%5,%0\n"
> -		"	jra	8b\n"
> +		"	jra	13b\n"
>  		"	.previous\n"
>  		"\n"
>  		"	.section __ex_table,\"a\"\n"
>  		"	.align	4\n"
> +		"	.long	1b,20b\n"
>  		"	.long	2b,20b\n"
>  		"	.long	3b,20b\n"
> -		"	.long	5b,50b\n"
> +		"	.long	4b,20b\n"
> +		"	.long	5b,20b\n"
>  		"	.long	6b,50b\n"

I think a fault at 6b has to get fixed up at 20b.

>  		"	.long	7b,50b\n"
>  		"	.long	8b,50b\n"
> +		"	.long	9b,50b\n"
> +		"	.long	10b,50b\n"
> +		"	.long	11b,50b\n"
> +		"	.long	12b,50b\n"
>  		"	.previous"
>  		: "=d" (res), "+a" (from), "+a" (to), "=&d" (tmp)
>  		: "0" (n / 4), "d" (n & 3));
> @@ -109,32 +116,35 @@ unsigned long __clear_user(void __user *to, unsigned long n)
>  
>  	asm volatile ("\n"
>  		"	tst.l	%0\n"
> -		"	jeq	3f\n"
> +		"	jeq	4f\n"
>  		"1:	"MOVES".l	%2,(%1)+\n"
>  		"2:	subq.l	#1,%0\n"
> -		"	jne	1b\n"
> -		"3:	btst	#1,%4\n"
> -		"	jeq	5f\n"
> -		"4:	"MOVES".w	%2,(%1)+\n"
> -		"5:	btst	#0,%4\n"
> -		"	jeq	7f\n"
> -		"6:	"MOVES".b	%2,(%1)\n"
> -		"7:\n"
> +		"3:	jne	1b\n"
> +		"4:	btst	#1,%4\n"
> +		"	jeq	6f\n"
> +		"5:	"MOVES".w	%2,(%1)+\n"
> +		"6:	btst	#0,%4\n"
> +		"7:	jeq	9f\n"
> +		"8:	"MOVES".b	%2,(%1)\n"
> +		"9:\n"

Should we put a NOP here to avoid having the unknown next instruction 
(label 9) in the exception table? We can't actually fix up a fault there 
unless by chance it was the MOVES that caused it.

>  		"	.section .fixup,\"ax\"\n"
>  		"	.even\n"
>  		"10:	lsl.l	#2,%0\n"
>  		"40:	add.l	%4,%0\n"
> -		"	jra	7b\n"
> +		"	jra	9b\n"
>  		"	.previous\n"
>  		"\n"
>  		"	.section __ex_table,\"a\"\n"
>  		"	.align	4\n"
>  		"	.long	1b,10b\n"
>  		"	.long	2b,10b\n"
> -		"	.long	4b,40b\n"
> +		"	.long	3b,10b\n"
> +		"	.long	4b,10b\n"
>  		"	.long	5b,40b\n"
>  		"	.long	6b,40b\n"
>  		"	.long	7b,40b\n"
> +		"	.long	8b,40b\n"
> +		"	.long	9b,40b\n"
>  		"	.previous"
>  		: "=d" (res), "+a" (to)
>  		: "d" (0), "0" (n / 4), "d" (n & 3));
> 
