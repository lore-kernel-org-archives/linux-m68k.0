Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB22442A86
	for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Apr 2024 07:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714031010; cv=none; b=bl573sd7q33rY2aHVnN76f+ZZ3Qp0YIBpzTZWT4xxa8337PSeP6+A/6fmNcoyR2RDulNUYv+M+F21mVpR5rV9+32GeE5PCnCLlhBtE/B0PdojVGJJg13MoLeRsYw/mcXZOq8apl/thN/DLomMrRMTmLa+oVwe6o923tOQw1U+BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714031010; c=relaxed/simple;
	bh=3yz+zZvX24vQYS9uY2E3miaxtYd+PS/VuZ5+4GJiTZo=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Xpbk3CPHchT8xbIpEyBeywo5Xg1GFETtWgBkQRYVGlnwTPAqSxw0xtHgj9e0pMR4MSI6UGHh4rWI0ppDaPpcJAgdcXVigmTRxilLifIy6P4l7VjQ9W5uZSHfpnmbgd4e0RtNf9KvoMBAoqR1sNDUPggmL85BpBUsXo9jXH+oI5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4FqoXv/; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4FqoXv/"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5acb737b508so306744eaf.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Apr 2024 00:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714031007; x=1714635807; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bScjVubZbaFziu90vDejYkXKLLcsUrFi7PSPkxL3P/c=;
        b=C4FqoXv/E7zmNinNYNV4MZhf7cPWgde970vYaoPJg/dVzzeL+qOnBqxDBnG1u0KU+M
         ufVuAY/MbKPQ4aAJzPDp8DIlc7VmHLrk4R2OmswSVDQgptCEgGoelQKAHuVER3RIvqJn
         KDJfhuvw9WcdWQZqu+GY2gSw9ZS2VQepa8yZzPrngVi1mc6Yd76yD3ehjwi5r8BFUh5e
         BAtVBc1yH6gahq85a59vl3RSO456y9aCrN0+sL3/+FxIAxMrZkaeoQ94OoMh7imzY63I
         mubq6TaYLh72w9q6uYH8k8N3yeoNgeCd0aku3VHTOz5aF6V0xBwuA3LuUbuJxT9Ak3e7
         eEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714031007; x=1714635807;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bScjVubZbaFziu90vDejYkXKLLcsUrFi7PSPkxL3P/c=;
        b=rUlnA6i8PzHfrnnphHysRWgCdJaRupUppfSBdEWl8oSCXhc4vbYvEh3MQbjEgWR/An
         o1pEq5Vxkp2BpmONQOpuaEiBNoX2iC46kxU8ceeBs6sgzbjvgNa6h9/XfkfeYgxYYJoT
         owVe2bmy22yUtnmSJhDPLYTG/8GzkCm+NUUFuwbYC7/Q4juyHkjBcBrw8amd0bnpoNVW
         rFzE3T+IGCTHav27sjfLQA87t3g0V2tmVrEGofOzK+kNFNzGr9XpqUvsLOOwrMlI7VMJ
         ff1XuDpMQzyU8kYySTYOHVK+LbgDOYovf5VDt5EJuu4TSRepiUfw3QNc85INtEg09ktL
         E1nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqPiQtzOJbTxjGersm4u2cJra44v4b0/g2DjlcemUwOUFFjaDXdD/VvjwfEhs5NetCaYjsOMJhH6/ey5aeNXMRhSCHtHDbD3dIT91l+EEF
X-Gm-Message-State: AOJu0YxU7MSc5x6cKXxiypQjIH2x4hn0FhsSCP89nIykUgf2G0umw6d2
	HV3CVciWqW9nnagKII3kMBgxVIIg6LXbzRzU4H+jytANsKeYk67v7VFjkw==
X-Google-Smtp-Source: AGHT+IE/GPz9J2NohkmexCKPbyt4KhIdrWUDh1ylnz7z4w3z+blHV1tSJGuHBo8E9qZ/u/GDAmv1bg==
X-Received: by 2002:a05:6358:2183:b0:18a:d3d5:f77e with SMTP id v3-20020a056358218300b0018ad3d5f77emr5092557rwb.17.1714031006577;
        Thu, 25 Apr 2024 00:43:26 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id x71-20020a63864a000000b00606dd49d3b8sm2229901pgd.57.2024.04.25.00.43.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2024 00:43:26 -0700 (PDT)
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
To: Finn Thain <fthain@linux-m68k.org>
References: <20240422022943.13775-1-schmitzmic@gmail.com>
 <20240422022943.13775-2-schmitzmic@gmail.com>
 <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org>
 <989ec316-69c3-d5e6-8312-9a62e78be547@gmail.com>
 <e34c716c-8dc9-f74f-1183-03ecfb0b300d@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <0c2d9b59-7a91-9660-55fd-6ba1b96302a2@gmail.com>
Date: Thu, 25 Apr 2024 19:43:20 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <e34c716c-8dc9-f74f-1183-03ecfb0b300d@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 25.04.2024 um 18:47 schrieb Finn Thain:
> On Thu, 25 Apr 2024, Michael Schmitz wrote:
>
>> --- a/arch/m68k/lib/uaccess.c
>> +++ b/arch/m68k/lib/uaccess.c
>> @@ -68,23 +68,25 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
>>  		"3:	subq.l	#1,%0\n"
>>  		"4:	jne	1b\n"
>>  		"5:	btst	#1,%5\n"
>> -		"	jeq	7f\n"
>> -		"	move.w	(%1)+,%3\n"
>> -		"6:	"MOVES".w	%3,(%2)+\n"
>> -		"7:	btst	#0,%5\n"
>> -		"8:	jeq	10f\n"
>> -		"	move.b	(%1)+,%3\n"
>> -		"9:	"MOVES".b  %3,(%2)+\n"
>> -		"10:\n"
>> +		"	jeq	8f\n"
>> +		"6:	move.w	(%1)+,%3\n"
>> +		"7:	"MOVES".w	%3,(%2)+\n"
>> +		"8:	btst	#0,%5\n"
>
> I understand why you put the MOVE.W and MOVE.B into the exception table.
>
>> +		"9:	jeq	13f\n"
>> +		"10:	move.b	(%1)+,%3\n"
>> +		"11:	"MOVES".b  %3,(%2)+\n"
>> +		"12:	nop\n"
>> +		"13:\n"
>>  		"	.section .fixup,\"ax\"\n"
>>  		"	.even\n"
>>  		"20:	lsl.l	#2,%0\n"
>>  		"50:	add.l	%5,%0\n"
>> -		"	jra	10b\n"
>> +		"	jra	13b\n"
>>  		"	.previous\n"
>>  		"\n"
>>  		"	.section __ex_table,\"a\"\n"
>>  		"	.align	4\n"
>> +		"	.long	1b,20b\n"
>
> ... but I don't see why you need the MOVE.L in there (?)

It's part of a loop - if there's enough longwords to copy, that 
instruction may follow the fault instruction eventually.

> Also, it is odd to see the third JEQ added to the table but not the second.
> Perhaps we don't need either one in there (?)

Faults on 030 appear to happen two instructions after a moves. But I may 
be misremembering that...

I'll have to verify that.

Cheers,

	Michael

>>  		"	.long	2b,20b\n"
>>  		"	.long	3b,20b\n"
>>  		"	.long	4b,20b\n"
>> @@ -93,6 +95,8 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
>>  		"	.long	8b,50b\n"
>>  		"	.long	9b,50b\n"
>>  		"	.long	10b,50b\n"
>> +		"	.long	11b,50b\n"
>> +		"	.long	12b,50b\n"
>>  		"	.previous"
>>  		: "=d" (res), "+a" (from), "+a" (to), "=&d" (tmp)
>>  		: "0" (n / 4), "d" (n & 3));
