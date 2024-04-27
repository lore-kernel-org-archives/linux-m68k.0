Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7794023A0
	for <linux-m68k@vger.kernel.org>; Sat, 27 Apr 2024 23:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714259780; cv=none; b=jWVXm9DtkBsxp5l4ZJySYVbonW8dTycAMO0u0/RZagkcfUGHPbtbXzh9GjPXVsoQ9upooT+VbI83DwTTI4100j23X2IFf2IGF5Pqn0QIf1ier2IB1J1dCo1+MI/k+qP1QrQ7vHx4XhNNB6w+7A8lzA0adjqWlUJmmA7VgUyJJzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714259780; c=relaxed/simple;
	bh=+Wkr5vsatLkyBOt0DsL9MS5FYtELuISMFgyZIJBV0D4=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=aKjgcJ9fDcQcEMn6QOUy2hT18lOc9Li6guqF2E0e2ZhMbxunRCYm8/GhD7gWKxWdSMHDkPT8iQE9Tk/If9w7J+A8o/z4AsgaE+ze+zrLleoL9RVhCWQw1afP7bbTO/RDZ1Ks37zlj1vF0F/lrrsQy5WSWKgP5cS4FrJmOP58Mlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjczCiuj; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjczCiuj"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5d3907ff128so2692984a12.3
        for <linux-m68k@vger.kernel.org>; Sat, 27 Apr 2024 16:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714259779; x=1714864579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJQc8vKeHOf4K7aCn8IEEv+Tv46Mcd+p3rmPD6J6rzg=;
        b=QjczCiujpDD0wFNxq2eY7Bb+eQXJt4iYmEYNjnoTin3ja7lrmuu8GLXD05lIp+CNKJ
         l9l+p1Tm3vV2oKDoyHpiorvm9e/om+bnS9OQbI8UP9I1rD+95uOQjsNL2HwA+pW9mIAC
         8ptldFlFvTkIE+RfQoHm+OsGe7URLZDzOmxbTDbAgqtjCup/XevZC/b8JYG3RK/7Enqm
         5ScGqRK29stVM8G8k8vhT45QulELorQNi8IUtZ5X3YSqEtfs0caPAr/c0sSUbQLwkPTO
         /Qz7aqh4vvUXWwwT2XgGbXsLu7V++OB6uQQEBptjFy2hpCZr55Q/k6xNCg8sVLRlbaEC
         Q2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714259779; x=1714864579;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pJQc8vKeHOf4K7aCn8IEEv+Tv46Mcd+p3rmPD6J6rzg=;
        b=T1lW8Y1RLjpdzxbFklay3VyOkBSHq3RvqCpyzyuIEX7HkRnB/VlDxapsohdBePoKGa
         U+Y7r88gwsJyDTGqY4N5F5sBrF0w9C9Tl4h8/uXwtiXKRaROC7TKfqm3C7JzA3QzPzHi
         zonyElrrtK/o1/L3dytEpLrSFObS8FMG3Pl6B5Pqh7d5YJ6aOjxe8JkO9zsSEJsskwRb
         WE80/IoI/hz4NGPAcoqGU1x/5MVDJKmlNOqbjQgmFaiUMzTME/XCDGJdyStc9XM4BJ6s
         XiHQ9u6cyk2YKIfS8AInVZcfK91ddyp/KiR7HN5y+Dl3uFWK8DMQYBAgW0FIfoxdFWen
         PIyQ==
X-Gm-Message-State: AOJu0Yyic80smzNlZw+8+gOaUN1F0pG71VGvrmVTkmCAtbje2asnd764
	+MKY4XUCg4+2gxGGW3GVNB7zd35yT74HeDopnzlKQ5bP1aUz8oHmTvPGUQ==
X-Google-Smtp-Source: AGHT+IHKc2UQxBklDmV6BJmRR5Dkmf+hRNkB9wEFAPHR1qBkAAEPnWSQMyWqVLJF2JY8E5GRgEn68Q==
X-Received: by 2002:a05:6a21:3942:b0:1ae:426a:b53b with SMTP id ac2-20020a056a21394200b001ae426ab53bmr8393766pzc.1.1714259778514;
        Sat, 27 Apr 2024 16:16:18 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id b8-20020a056a000a8800b006f388e6546asm4274009pfl.214.2024.04.27.16.16.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Apr 2024 16:16:18 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
To: Finn Thain <fthain@linux-m68k.org>
References: <20240427084815.1449-1-schmitzmic@gmail.com>
 <20240427084815.1449-2-schmitzmic@gmail.com>
 <fdbe029b-1df0-3e8d-fced-64cc719397fa@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org, gerg@linux-m68k.org,
 linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <f88ad8f7-4fd9-45b2-a52c-cee3217083bf@gmail.com>
Date: Sun, 28 Apr 2024 11:16:11 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <fdbe029b-1df0-3e8d-fced-64cc719397fa@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

thanks for your review!

Am 27.04.2024 um 21:34 schrieb Finn Thain:
>
> On Sat, 27 Apr 2024, Michael Schmitz wrote:
>
>>
>> diff --git a/arch/m68k/lib/uaccess.c b/arch/m68k/lib/uaccess.c
>> index 86b6fed5151c..e3ed893047f8 100644
>> --- a/arch/m68k/lib/uaccess.c
>> +++ b/arch/m68k/lib/uaccess.c
>> @@ -62,35 +62,42 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
>>
>>  	asm volatile ("\n"
>>  		"	tst.l	%0\n"
>> -		"	jeq	4f\n"
>> +		"	jeq	5f\n"
>>  		"1:	move.l	(%1)+,%3\n"
>>  		"2:	"MOVES".l	%3,(%2)+\n"
>>  		"3:	subq.l	#1,%0\n"
>> -		"	jne	1b\n"
>> -		"4:	btst	#1,%5\n"
>> -		"	jeq	6f\n"
>> -		"	move.w	(%1)+,%3\n"
>> -		"5:	"MOVES".w	%3,(%2)+\n"
>> -		"6:	btst	#0,%5\n"
>> +		"4:	jne	1b\n"
>> +		"5:	btst	#1,%5\n"
>>  		"	jeq	8f\n"
>> -		"	move.b	(%1)+,%3\n"
>> -		"7:	"MOVES".b  %3,(%2)+\n"
>> -		"8:\n"
>> +		"6:	move.w	(%1)+,%3\n"
>> +		"7:	"MOVES".w	%3,(%2)+\n"
>> +		"8:	btst	#0,%5\n"
>> +		"9:	jeq	13f\n"
>> +		"10:	move.b	(%1)+,%3\n"
>> +		"11:	"MOVES".b	%3,(%2)+\n"
>> +		"12:	nop\n"
>> +		"13:\n"
>>  		"	.section .fixup,\"ax\"\n"
>>  		"	.even\n"
>>  		"20:	lsl.l	#2,%0\n"
>>  		"50:	add.l	%5,%0\n"
>> -		"	jra	8b\n"
>> +		"	jra	13b\n"
>>  		"	.previous\n"
>>  		"\n"
>>  		"	.section __ex_table,\"a\"\n"
>>  		"	.align	4\n"
>> +		"	.long	1b,20b\n"
>>  		"	.long	2b,20b\n"
>>  		"	.long	3b,20b\n"
>> -		"	.long	5b,50b\n"
>> +		"	.long	4b,20b\n"
>> +		"	.long	5b,20b\n"
>>  		"	.long	6b,50b\n"
>
> I think a fault at 6b has to get fixed up at 20b.

In my tests, the fault seen there had been caused by the movesl in the 
section above, hence the fixup at 20b.

But your comment has me thinking about a side effect of this change: in 
case the movew at label 6 were to fail, that fault was masked by our 
exception handling. We'd silently ignore a kernel bus error there.

On the other hand, we'd probably see a fault there manifest with a PC 
corresponding to the movesw or btest instruction rather than the movew 
instruction. These instructions have always been in the exception table, 
so potentially missing a kernel bus error there has always been an issue.

The only way I see that would avoid having to place this instruction 
(and the moveb later) into the exception table is to place a NOP after 
each of the movesl and movesw sections. Shouldn't have too much of a 
performance impact as long as it's not placed inside the movesl loop.

>
>>  		"	.long	7b,50b\n"
>>  		"	.long	8b,50b\n"
>> +		"	.long	9b,50b\n"
>> +		"	.long	10b,50b\n"
>> +		"	.long	11b,50b\n"
>> +		"	.long	12b,50b\n"
>>  		"	.previous"
>>  		: "=d" (res), "+a" (from), "+a" (to), "=&d" (tmp)
>>  		: "0" (n / 4), "d" (n & 3));
>> @@ -109,32 +116,35 @@ unsigned long __clear_user(void __user *to, unsigned long n)
>>
>>  	asm volatile ("\n"
>>  		"	tst.l	%0\n"
>> -		"	jeq	3f\n"
>> +		"	jeq	4f\n"
>>  		"1:	"MOVES".l	%2,(%1)+\n"
>>  		"2:	subq.l	#1,%0\n"
>> -		"	jne	1b\n"
>> -		"3:	btst	#1,%4\n"
>> -		"	jeq	5f\n"
>> -		"4:	"MOVES".w	%2,(%1)+\n"
>> -		"5:	btst	#0,%4\n"
>> -		"	jeq	7f\n"
>> -		"6:	"MOVES".b	%2,(%1)\n"
>> -		"7:\n"
>> +		"3:	jne	1b\n"
>> +		"4:	btst	#1,%4\n"
>> +		"	jeq	6f\n"
>> +		"5:	"MOVES".w	%2,(%1)+\n"
>> +		"6:	btst	#0,%4\n"
>> +		"7:	jeq	9f\n"
>> +		"8:	"MOVES".b	%2,(%1)\n"
>> +		"9:\n"
>
> Should we put a NOP here to avoid having the unknown next instruction
> (label 9) in the exception table? We can't actually fix up a fault there
> unless by chance it was the MOVES that caused it.

The movesb does not have the potential to cause a misaligned access, and 
I believe it is for that reason that a NOP there is not required (it 
probably isn't for __generic_copy_to_user either). My tests on 030 at 
least have confirmed that - selecting path length and start offset such 
that the movesb is the first instruction hitting the unmapped page has 
never produced an Ooops.

As to the unknown instructions following the final exception label: 
These functions, though they contain inline assembly code are not 
further inlined, and the instructions following the inline assembly are 
simple boilerplate register restore stack saves that ought not to fault 
(an invalid stack pointer would have faulted on function entry, if at all).

On balance, I am confident the code is correct as-is. You (and in 
particular, Geert) may argue though that the NOP approach follows the 
principle of least surprises, and can be considered safe to apply 
without further testing on 68060 and Coldfire.

Cheers,

	Michael


>
>>  		"	.section .fixup,\"ax\"\n"
>>  		"	.even\n"
>>  		"10:	lsl.l	#2,%0\n"
>>  		"40:	add.l	%4,%0\n"
>> -		"	jra	7b\n"
>> +		"	jra	9b\n"
>>  		"	.previous\n"
>>  		"\n"
>>  		"	.section __ex_table,\"a\"\n"
>>  		"	.align	4\n"
>>  		"	.long	1b,10b\n"
>>  		"	.long	2b,10b\n"
>> -		"	.long	4b,40b\n"
>> +		"	.long	3b,10b\n"
>> +		"	.long	4b,10b\n"
>>  		"	.long	5b,40b\n"
>>  		"	.long	6b,40b\n"
>>  		"	.long	7b,40b\n"
>> +		"	.long	8b,40b\n"
>> +		"	.long	9b,40b\n"
>>  		"	.previous"
>>  		: "=d" (res), "+a" (to)
>>  		: "d" (0), "0" (n / 4), "d" (n & 3));
>>
