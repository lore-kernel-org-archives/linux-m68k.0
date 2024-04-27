Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F88C2E639
	for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Apr 2024 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714208202; cv=none; b=gRE2RglDiWbPr46kzOaG0naSOqUjt3ZdMgHJKAZzDFbpYebKQhF+IGGl0nIiN3nkvM/rdMxbbLe3h6NYWAz/FVxBABgnZ91T7C1Bn02Li2c+XeIn1BPFad3umx5a+hT7fIRdIJXxzCTXvP9tnZv+x6qZi3wBBt1hOfCprDPquZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714208202; c=relaxed/simple;
	bh=cyXGXoYb/ULl3ZmvZMQHdSnrB9lG+vYnmYSVF0sO6fc=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=QPkxopRryYF8Q/zUnWjA0a3fPlz7pPCOC8P0srcxw+RD9n41ner2xxmZ1GyLhxBOL/U8dytu8xSqiPtHulQskpjkaEwJHdJtKXRK4OHC3mcwyFjqteK12Su/E5YoXTFldoLuSspmg6Z+h47zSRHN36Ez6hjtII+DsA+PODUM0I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMkDq/SH; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMkDq/SH"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5f80aa2d4a3so2442384a12.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Apr 2024 01:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714208199; x=1714812999; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CUPIgw0HEQ4RBAhj+KI3x1dgKlttJcbHni6M8okNqU=;
        b=BMkDq/SHVjVCFnDBN8oOFqk2XyzRhg9m3VIsYe7yK8N5TMrkVlPprHTBLUN004Ws5q
         jQWk8e/gQ/gd+7XjQ3xM303V6T+1N4Q+mXjzYlNNm9PWvBI1/olsFEQ5+DGCLOcDAy8+
         +n8ySD+mULKE5RLtLDxUMi07FnaUENLfiAc3I15zOGYtK9yGSyO5TrxiZfrx7vWvFpO3
         eOdY2YuVDr+c2uykmxyh0uVf25WMkEQq+bpeA67Rp1FR5uMnoKXWHPYW+BCsRQ8ni1pY
         bPloG3O727SBMy6mWkP6JupCbBnxgbjpPIrM2XRWlDEA0IwrEnuyd27lWDohmCn1lJJQ
         ZshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714208199; x=1714812999;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4CUPIgw0HEQ4RBAhj+KI3x1dgKlttJcbHni6M8okNqU=;
        b=NbfzkVF1y1lIRoc8Unijp3+HjZkRk0SC0i2BbQ0yqCcrB+DrR/yZOSLbt7r5Ri5UBM
         tlEy+j59qs2Jl/brMm0Tl68p6ivIj6THJAeAQcZjdL7FE7e47w818oLuaeP8I01YvgeJ
         5hT20EWjPnjUgsCrVnA5G3Skbu0H/hCZGvZG1AmgiYSCBn9ofqv6h+6k34uAydT5bbTE
         nzluIBNFi9IYFs/6thjPO2xr2FMOAltd40YcIOXE40dftX3xWZDH61cGWu98H9Hh24Ho
         WmLa8dZGis8h/pVDltobAnqyrUDhVyIdPoSNy0tNaSsLAYOHhjUGmDbgwzz6P8WiOB7A
         C9jg==
X-Gm-Message-State: AOJu0Yx6zsD4dqvuIaUOGjrEO2vftut0APEY/K/nuabCR6MjvNdymUwc
	tjNr2yLAhKpVMFL/Gv10G9l+C9XGP1LnUo6Pyln0ALPLRbAymqBKsviLew==
X-Google-Smtp-Source: AGHT+IEvB57mbqCDdcBxOUH7mIwjcN5BAuGzyjRk31trLmlPzwNaKBIA7MMMqAQeuj0EqLyKDE8duQ==
X-Received: by 2002:a05:6a21:279e:b0:1ac:5040:2a70 with SMTP id rn30-20020a056a21279e00b001ac50402a70mr5118581pzb.35.1714208199497;
        Sat, 27 Apr 2024 01:56:39 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id s12-20020a17090a5d0c00b002a005778f51sm9964949pji.50.2024.04.27.01.56.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Apr 2024 01:56:39 -0700 (PDT)
Subject: Re: [RFC PATCH] m68k: Handle put_user faults more carefully
To: Finn Thain <fthain@linux-m68k.org>
References: <e0f23460779e6d16e2633486ac4841790ef2aca0.1713176294.git.fthain@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <cb7b2221-6ee2-ced0-55e4-2326c695d237@gmail.com>
Date: Sat, 27 Apr 2024 20:56:35 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <e0f23460779e6d16e2633486ac4841790ef2aca0.1713176294.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 15.04.2024 um 22:18 schrieb Finn Thain:
> Running 'stress-ng --sysbadaddr -1' on my MC68040 system immediately
> produces an oops:
[...]
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
[...]
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

Extensively tested on 68030, too (where there isn't a writeback but 
put_user can still fault in the same context), and after some review and 
testing I'm satisfed adding NOPs is the only solution, so:

Tested-by: Michael Schmitz <schmitzmic@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
