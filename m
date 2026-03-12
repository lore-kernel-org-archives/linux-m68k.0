Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B4C2F39C2
	for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Mar 2026 18:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773339956; cv=none; b=SNcBV4dABqxYLUw/HC0WPeeooBRoeUe4ZoMd32QuHM0otV1bdwS75Q1vDKRC8gMGlXbD2IF6ffx/zT1pdNbbPJypP1cHAaip9jX61DLs+S0d88GPbGxeG+byL+9jGopiT+m9wvlLqcAHPCkFwu7oyTiH70sIbVumgptOI1kAjIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773339956; c=relaxed/simple;
	bh=aGGnjsi++eyVwK84bO0prqfr/oUQYiT4Yd19kpkhtww=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IRYT8Ca5l6kSirxoHxz6PzWik9yY1EwfDdCNIaV9hjPRWp4b0V0HWAx9L0C7CF1JT0l2XSNIAxKX3zWlnCkbdzf0v0hMo6kogwQ+fPEX0XaXVTXIIPkBSISZmzCbBOWtxMCBv6oNB+y+UlblHW5FZaqtqI1xz4MUTTswFEBO63M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.at; spf=pass smtp.mailfrom=gmx.at; dkim=pass (2048-bit key) header.d=gmx.at header.i=christoph.plattner@gmx.at header.b=bBl91msK; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.at header.i=christoph.plattner@gmx.at header.b="bBl91msK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.at;
	s=s31663417; t=1773339952; x=1773944752;
	i=christoph.plattner@gmx.at;
	bh=msFhdfO5z9I0HDUdUVT/lVNilt+jR0B3AbmDBhrYt8w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Cc:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bBl91msKU9dYPO2b2PmrQYLLyn+EPpllVOB4Hyn2Z9O7wZzzkV/nzxrOpEaHykPQ
	 jY75badwheA1JjkjHqZkO5BBz5QHduymPwHp0kDRADXV1yDbXJHSszpRdJBt/t5sE
	 cnuO82VjQtY3Q0k2gzruce6NAbyopBba/fDL/G7B6nKI5LSdLsL1+2Fvhm0wXv3A+
	 4tpyOrvgoorNHUFyc/aXRzbBShtTm7M3yuVGZq01djtwnKMyyj4+R65/zWpV51t8V
	 I4R6jLwXeH8DdFoEI0nCnzuQ0DBDgUCRRjzagD4EdYjoZvf+TNbNjDwWvMwvkcCNl
	 +8zWFHB4qUMJckPK6g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH5Q-1vUzsq0MTk-00Zh2O; Thu, 12
 Mar 2026 19:25:52 +0100
Message-ID: <c70b940d-9522-472f-8d56-e593b89cfafa@gmx.at>
Date: Thu, 12 Mar 2026 19:25:51 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: christoph.plattner@gmx.at, sashal@kernel.org
Subject: Re: [PATCH] m68k: Fix task info flags handling for 68000
To: Daniel Palmer <daniel@0x0f.com>, gerg@linux-m68k.org,
 geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
References: <20260312115832.835968-1-daniel@0x0f.com>
Content-Language: de-AT
From: "christoph.plattner@gmx.at" <christoph.plattner@gmx.at>
In-Reply-To: <20260312115832.835968-1-daniel@0x0f.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lgJUq5NoU0bVcTUJSFecINujRs6FzDTIJC1AR1g3U3S7Atjw6Hw
 gCXxB4RfFjHP8S32VojBlxc+7+fOd2RG8K2dlkWtsG2sOXREreLPSTJGzRwgMnCFfo9/w+u
 Si3Ntj+q9MfM7pWh1yTSak/EgnV3wimZOebn0RjktCz6qyDkC9uC6Fh3YwoDLT+q8t0/YOr
 GPkj2gwMppUZEqLwp2yKA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PEunteNkEEA=;yeFBQ3bx0/LTtFHyy3+x56G1OMv
 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
 jrzStnsTfpC

Hello Daniel,

I tested first the 6.18.17 kernel with my full patch, which was OK.
Then I re-started with a new kernel, added your patch and removed my=20
"movel" from my patch, which I applied afterwards.
Kernel boots fine, shell running, even telnetd is running, all OK.

So, green light !

Thank you
Christoph


On 3/12/26 12:58, Daniel Palmer wrote:
> The logic for deciding what to do after a syscall should be checking
> if any of the lower word bits are set and then checking if the reschedul=
e
> bit is set.
>
> Currently we are loading the top word, checking if any bits are set
> (which never seems to be true) and thus jumping over loading the
> whole long and checking if the reschedule bit is set.
>
> We get the thread info in two places so split that logic out in
> a macro and then fix the code so that it just loads the whole
> of the flags, checks if anything is set and then checks if
> the reschedule bit in particular is set.
>
> Reported-by: Christoph Plattner <christoph.plattner@gmx.at>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>
> I have had a variation of this patch for ages and haven't
> gotten around to sending it. Christoph e-mailed us (Greg, Sasha and me)
> to report this issue with a similar patch. Apparently this is an
> issue all the way back to 5.15.
>
> Christoph, can you check this works for you? I took this out of my
> personal branch and made sure it built but I have a bunch of other
> junk I need to actually boot it on the things I have.
>
>   arch/m68k/68000/entry.S | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
> index 72e95663b62f..cd193fd34c19 100644
> --- a/arch/m68k/68000/entry.S
> +++ b/arch/m68k/68000/entry.S
> @@ -18,6 +18,13 @@
>  =20
>   .text
>  =20
> +/* get thread_info pointer into a2 */
> + .macro getthreadinfo
> +	movel	%sp,%d1
> +	andl	#-THREAD_SIZE,%d1
> +	movel	%d1,%a2
> + .endm
> +
>   .globl system_call
>   .globl resume
>   .globl ret_from_exception
> @@ -70,9 +77,8 @@ ENTRY(system_call)
>  =20
>   	movel	%sp@(PT_OFF_ORIG_D0),%d0
>  =20
> -	movel	%sp,%d1			/* get thread_info pointer */
> -	andl	#-THREAD_SIZE,%d1
> -	movel	%d1,%a2
> +	/* Doing a trace ? */
> +	getthreadinfo
>   	btst	#(TIF_SYSCALL_TRACE%8),%a2@(TINFO_FLAGS+(31-TIF_SYSCALL_TRACE)/8=
)
>   	jne	do_trace
>   	cmpl	#NR_syscalls,%d0
> @@ -96,16 +102,15 @@ Luser_return:
>   	/* heavy interrupt load*/
>   	andw	#ALLOWINT,%sr
>  =20
> -	movel	%sp,%d1			/* get thread_info pointer */
> -	andl	#-THREAD_SIZE,%d1
> -	movel	%d1,%a2
> +	getthreadinfo
>   1:
> -	move	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */
> +	/* check if any of the flags are set */
> +	movel	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */
>   	jne	Lwork_to_do
>   	RESTORE_ALL
>  =20
>   Lwork_to_do:
> -	movel	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */
> +	/* check if reschedule needs to be called */
>   	btst	#TIF_NEED_RESCHED,%d1
>   	jne	reschedule
>  =20

