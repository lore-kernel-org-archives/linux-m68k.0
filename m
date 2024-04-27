Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A473FE31
	for <linux-m68k@vger.kernel.org>; Sat, 27 Apr 2024 09:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714209884; cv=none; b=uX+ns2C8z56EUaxfeRnlrwNVxqarkqBiC4yWlg3zCzasWSTxuyMO1cxaNsBFi3fkAJwHNyNYQrFTcu1lmOUXXQc8f2Pqv92pCeg05bprMBoMzLjKNGiFWnx5VeO6IFep6PeyvqgF4MsEmjqWFgQS7jYBsP11eyiSoy328m4x4ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714209884; c=relaxed/simple;
	bh=2KSpOfsXbM9lkLxM23Zk2iPXc7kmcQLpTtuxWQi9AFk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=T24jsBVGgQYsC3B+fig6RaBTD4RwY6qT6bH+ZTpL4kLcbmaemuNp2H8fhRcsBLip3Cq4xjdmkQCasvO49h8rqdXPjXMHBnkFanVwiLOfc8IjZZw5KOEuI6PbpmazENOe2i+zIYSTyg7mfKnPSeGoGi6iSUtXXrYNHMzAMnWXHaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aHrEKAxz; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aHrEKAxz"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id A578A1C0012D;
	Sat, 27 Apr 2024 05:24:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 27 Apr 2024 05:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714209879; x=1714296279; bh=XRlrMJnoqRhICycYntWUIB2+UasE
	/Hd+jPKF1WaLHzg=; b=aHrEKAxzv3IHnJuBn21Dnv8dcJOZyCP3DvCBs0oilSBs
	CZlmfvzC4JuuGl+iKlq+mALtuR7BoBlzzb//3nZ/y5HJJI1LcQhp2dvzb7mPeheE
	OOpEH39MTOPCCYcKGN9Bcv14gEzX60cC2Hd53MPxMexRuqooixmguW21xxc/lxBz
	cx+N5gIAeSh5gVr/vtr/ppoN2uVGFFxn37tDPvUAkAtD0V462IsXBMDMQOm4ZCfA
	jlAp4FKBJRg0rLQjhmxFnyegaJdCCTS4De5vj1ko5q1tuLEmgC5QXuQ4qSaQV2NI
	16NJr6hU2fKUogYShc52OpzoCs4/x3caVI8KcCc8FA==
X-ME-Sender: <xms:VsQsZlTDqC5zHERwW1sNlZ6WRavlCrTBcE9kYq5JWvl4l6ACK-EfMg>
    <xme:VsQsZuy-vq6eJpnvHSvfVip9ThOCt_IXMVJ6XSqZVNOgm6Kaj0YOhXKVgMmG75KBl
    LCAqz9itqA2jtgVbz0>
X-ME-Received: <xmr:VsQsZq2qr2edy1hDI1wFMrP2HEYQJuD-h5LlpITdunHiRVlB1UgwaL7FXL4OSLI2IxE0v3tNsBpoVyeNGPixTzdZ4Cc1sMO7YjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddtuddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeefieehjedvtefgiedtudethfekieelhfevhefgvddtkeekvdekhefftdek
    vedvueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieek
    khdrohhrgh
X-ME-Proxy: <xmx:VsQsZtCFgpvoTUY5uoyfS6uMHkpjmFZD2jHBlYu4QWAHBZnAr2J9ug>
    <xmx:VsQsZuidz3JMqmKQ7qgfN9NsZSLBpyNyI6gs2wgcz6sVCj7LDva0dQ>
    <xmx:VsQsZhpIC63bjsznltT5SCPKf4KBH4ltgagklnRtuUnZ7_hM0iBJRw>
    <xmx:VsQsZpigKkes7TcP7tXrL3veBQuns1e6AbVIVYeTomJuCtZfnKWHug>
    <xmx:V8QsZvvWpsfaXMuG-9FrHClMsdh0G6yMnOkcWr88kRLnyqusLSbGds_8>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Apr 2024 05:24:36 -0400 (EDT)
Date: Sat, 27 Apr 2024 19:24:51 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org, gerg@linux-m68k.org
Subject: Re: [PATCH v3 2/2] m68k: improve __constant_copy_to_user_asm() fault
 handling
In-Reply-To: <20240427084815.1449-3-schmitzmic@gmail.com>
Message-ID: <88fd52d9-bd23-d5e5-addb-7f2a54c82eb2@linux-m68k.org>
References: <20240427084815.1449-1-schmitzmic@gmail.com> <20240427084815.1449-3-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Sat, 27 Apr 2024, Michael Schmitz wrote:

> A problem similar to that reported for __put_user_asm and
> __generic_copy_to_user is also present in
> __constant_copy_to_user_asm.
> 
> Address the problem by extending the exception table to cover
> two instructions past each moves instruction, and adding a
> single NOP at the very end to catch faults on the final
> instruction (which is not guaranteed to be a movesb!).
> 
> Tested on 68030 (Atari Falcon 030) with a transfer beginning
> at a single byte at the end of a mapped page followed by
> seven more bytes on an unmapped page (testcase derived from
> stress-ng sysbadaddr stressor by Finn Thain and modified to
> use the llseek syscall).
> 
> Cc: Finn Thain <fthain@linux-m68k.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Link: https://lore.kernel.org/all/e0f23460779e6d16e2633486ac4841790ef2aca0.1713176294.git.fthain@linux-m68k.org
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Tested-by: Finn Thain <fthain@linux-m68k.org>

> ---
>  arch/m68k/include/asm/uaccess.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
> index 44e52d8323e5..f1f4b62d6f69 100644
> --- a/arch/m68k/include/asm/uaccess.h
> +++ b/arch/m68k/include/asm/uaccess.h
> @@ -288,10 +288,11 @@ __constant_copy_from_user(void *to, const void __user *from, unsigned long n)
>  		"21:	"MOVES"."#s2"	%3,(%1)+\n"			\
>  		"22:\n"							\
>  		"	.ifnc	\""#s3"\",\"\"\n"			\
> -		"	move."#s3"	(%2)+,%3\n"			\
> -		"31:	"MOVES"."#s3"	%3,(%1)+\n"			\
> -		"32:\n"							\
> +		"31:	move."#s3"	(%2)+,%3\n"			\
> +		"32:	"MOVES"."#s3"	%3,(%1)+\n"			\
> +		"33:\n"							\
>  		"	.endif\n"					\
> +		"34:	nop\n"						\
>  		"4:\n"							\
>  		"\n"							\
>  		"	.section __ex_table,\"a\"\n"			\
> @@ -303,7 +304,9 @@ __constant_copy_from_user(void *to, const void __user *from, unsigned long n)
>  		"	.ifnc	\""#s3"\",\"\"\n"			\
>  		"	.long	31b,5f\n"				\
>  		"	.long	32b,5f\n"				\
> +		"	.long	33b,5f\n"				\
>  		"	.endif\n"					\
> +		"	.long	34b,5f\n"				\
>  		"	.previous\n"					\
>  		"\n"							\
>  		"	.section .fixup,\"ax\"\n"			\
> 
