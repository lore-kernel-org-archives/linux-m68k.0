Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B1622F388
	for <linux-m68k@vger.kernel.org>; Mon,  3 Mar 2025 23:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741045143; cv=none; b=LM7awT/eLaz+MhUGolCwFC9UevxPYYCWO+FBve7A6JIVzdKQc4vPqNQvEfaMCPSktvDyCYi1lEysOaF1yKa2zWai8stJdfiYQ0KICiDZYt3pHZr6jRg80AGXw6J2S9dgavhahLviQqlQSR8Em6J92QwaSdgiVGtxvUoFuYaliaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741045143; c=relaxed/simple;
	bh=c3HDR/iAHzbskdqrfDIo88YL4cRe5lsOLPl5TMiB+5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZFm6vqp3iJGdMszqvTpF+91cILJHmvRvOhlJieEMjSjZhQt1NrZhbWso1UQfArSwPOh3PcSdDPrdnAYZjxQ8v4eQKZZ+5zW9JTeS+kTNRQfNJfHyauIdVUxwHX9XHxMTDjG0Ue0DgvCiYUp8ubbagdpPOQLsoHfB80HauCiI1Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7QbLJU4; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7QbLJU4"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so7956019a91.2
        for <linux-m68k@vger.kernel.org>; Mon, 03 Mar 2025 15:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741045141; x=1741649941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LFlWEHC1TXX1QLKJITE3bbCVd5N6YK7LJlXho2ssm/4=;
        b=K7QbLJU4GM23VJT/kVYXK8Uvz4mYSgBcZym5mGDx85vGbtrGkqmW8kH4aQyC2OpHPd
         vLHImitCfSBDxcOjey40/NzZ0TnFDAVeXgISbBHK37DWCpUa9htq0r0U+15K+BQcEPYS
         tQtORkkzD4u7lwkVbhVo7cyX9ThiurNtld22pATbG6k2p/EdlzR0gZ08iABIP1x+jrRJ
         dK756EFhQ5usD7EVsrJJO7e1pHIfdu85hnazTcsBB6C0ekBHu9LOvWyi+Qc5gpNjr4a0
         WHjJkywH9p47VTyty8qf7uZ5wcPl9f6AqW+XejSc34m3PfONV4QECmmvmlLd1T+zpJOc
         EplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741045141; x=1741649941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LFlWEHC1TXX1QLKJITE3bbCVd5N6YK7LJlXho2ssm/4=;
        b=nvY8MTEoDpGijd40k5cJND/2oEGwPYtoVWuL6j4sl4H+ETY/k2IuwTMlP4ACLA3+cm
         ISbJuq6xBXovx8N5KtefqHwQ8Q3B9QKb8jUq6J7BeALEqlZIXaGvfyL9TudpYI/nCSFU
         szeT8m1YYgkp0HRWCpTJLs0auUahLHyiVNkll4mP5LDDLz82uhF11vID8L1BTawPTz2x
         TKjzmwiU2UT8B5LGVqMw7hfRJ2Q0v236OTZqQLbs7LtQilKtpMRgiyU7ytprSJSqL5P2
         XzIwKz4DJ8snB+mxpzGniS4oHY69Gk0xfz08Zrqiwy06ubpqaUqRRMifVapVSeklWX6M
         +NDA==
X-Forwarded-Encrypted: i=1; AJvYcCWy8s0XIV8I8zZsYiJcJT7R/ENa4FhJzuavM/4V55Co0m3qv+787i+tTBzu/Hs3Nvpmi/805ltIyBcZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu3CD0/3mHyG+AH1ZXd1HWfSBGrb7b/pOefBrRslXtPFXFLjdd
	gkTBs1QQayQ+hcrCZyLud6Wix3+QqBDhyYv/+yUesx5yT9bgZKkMYAtYeg==
X-Gm-Gg: ASbGncs4GK8aUZRhiPBy69LW7Y6aVnKRPpwX+cltHCuzvjodXHwovMzNAvBMAJaw0dT
	xdA8aFU+C63Bo/6XX3vm6ofq91caqAzColGU8G0ko2CQYkCDT892bCqBM2UmY/4m/bkS8yN8OVD
	85ii0XBlhZPXweK28tWVRLMM3WRdMOP62I+urtZowM4BbNfUnWVQvVONjiMhLKqYvq2z989p5Kb
	Z77dVIN9evWLhosiE3VkJ7WB7r4Jry3+UY0HVtXPR5pBvAMse4OnBxkQ3xpMcZ4VBEhVHbYrb3L
	UlawASRQ3+UfIWeqPLKr4kvRbY+0osPOC8fXAbH3MRDDVjt3LyU1xyiUIXqiBhiinDF++OTgtuC
	eUTug0WPjStyctXgpPZWR2EBOZApGdUh4nQqrK/+g1RtrbVrhoB7SrSTcIGg=
X-Google-Smtp-Source: AGHT+IEUp2QFezUJT52oHtZPgOdYFyLsgC1KoFfuM/foSLSOXrRW+R4i9nB7tNRfO6kKjbmk9a2gFQ==
X-Received: by 2002:a17:90b:1e50:b0:2f5:63a:449c with SMTP id 98e67ed59e1d1-2febabcb14cmr22160113a91.28.1741045141072;
        Mon, 03 Mar 2025 15:39:01 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:acbe:70b0:48fd:9dc0? ([2001:df0:0:200c:acbe:70b0:48fd:9dc0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea6753137sm9590885a91.6.2025.03.03.15.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 15:39:00 -0800 (PST)
Message-ID: <091d25fa-6a79-4685-a920-075611e79626@gmail.com>
Date: Tue, 4 Mar 2025 12:38:56 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Software FPU emulation in linux kernel
To: Thorsten Otto <admin@tho-otto.de>, linux-m68k@vger.kernel.org
References: <3374772.VqM8IeB0Os@earendil>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <3374772.VqM8IeB0Os@earendil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thorsten,

On 4/03/25 05:22, Thorsten Otto wrote:
> Hi,
>
>
> i'm currently trying to port the software FPU emulation of linux-m68k to
> FreeMiNT, and got some questions about it.
>
>
> As seen in https://github.com/torvalds/linux/blob/
> 7eb172143d5508b4da468ed59ee857c6e5e01da6/arch/m68k/kernel/vectors.c#L96 and
> https://github.com/torvalds/linux/blob/
> 7eb172143d5508b4da468ed59ee857c6e5e01da6/arch/m68k/kernel/vectors.c#L119
>
> the FPSP for 040/060 are not installed when the software emulation is used.

That is correct - the FPSP and IFPSP packages are only meant to handle 
unimplemented instructions on the 040 and 060 processors, respectively. 
These packages were part of Motorola's developer support for 040/060, 
and are used unmodified (aside from kernel specific asm glue) by the 
Linux kernel.

The generic math emulation support was added much later, and is largely 
incomplete (many functions are just stubs, as you found out). The 
Kconfig help text for the M68KFPU_EMU option does note that BTW.

> However, almost all trigonometric functions are not implemented: https://
> github.com/torvalds/linux/blob/7eb172143d5508b4da468ed59ee857c6e5e01da6/arch/
> m68k/math-emu/fp_trig.c#L21-L28
> What sense does it then make to use an emulation, when only basic instructions
> like fadd/fmul etc. are implemented? Programs are not even aborted when using
> one of those functions, uprint just prints an error message, and the functions
> just return with their input arguments as result instead of calculating the
> expected value.
As I recall it, the main purpose was to keep kernel and a few important 
system utilities from blowing up on 030 machines with no FPU. User space 
programs that need to use trig functions or other FPU implemented 
functions can be compiled with -m soft_float (or something along those 
lines) on those systems.
>
>
> Then i also noticed, that there seem to be some quirks. Eg. the IS_ZERO macro
> is defined as
> #define IS_ZERO(a) ((a)->mant.m64 == 0)
> But that condition is also true for infinities, and there are several places
> where IS_ZERO is used before checking for infinities. Eg. in the emulation of
> fmul https://github.com/torvalds/linux/blob/
> 7eb172143d5508b4da468ed59ee857c6e5e01da6/arch/m68k/math-emu/fp_arith.c#L157
> +inf * +inf will return a NAN instead of +inf.

I'm sure the FPU emulation code can be improved a great deal. In this 
particular instance however, both operands are checked for infinity 
first. Only if the mantissa of (one of) those operands is zero will the 
NAN condition be raised.

I suspect this is mandated by some sort of standard - zero mantissa at 
infinite exponent makes no sense as a number.

> Next problem is the interaction between assembler/C. On entry, a2 is loaded
> with a pointer to the emulated FPU register set in the thread struct. However,
> all the arithmetic functions call out to C functions, which in turn callback
> some assembler functions like fp_long_ext2ext. At that time, a2 may contain
> any value. Won't that just crash, or did i miss something?

a0 - a2 and d0 - d5 are saved on the stack on entry in fpu_emu, and 
restored in ret_from_exception. What happens in between to these 
registers is up to assembly or C code. These registers are never 
expected to be preserved, so code can't rely on them having any specific 
content.

I cannot locate the specific assembly function you mention 
(fp_long_ext2ext). Can you post code or disassembly to illustrate the 
problem?

> Another problem: the fsqrt function seems to be broken when using arguments <
> 1.0. Eg. fsqrt(0.75) yields 1.7320508075. Looks like the returned exponent is
> off by one there.
That might be a genuine error in the sqrt algorithm there - can't see 
how it does arise though.
> So essentially: is that emulation actually used anywhere?

Not beyond the very basic stuff that did get implemented, no. You may 
have to look elsewhere for a feature complete FPU emulation (does netbsd 
have that?).

Cheers,

     Michael


>
>
>
>
>
