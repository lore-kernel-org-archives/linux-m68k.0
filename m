Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3FB7E1
	for <linux-m68k@vger.kernel.org>; Thu,  5 Jun 2025 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749113359; cv=none; b=OHiN81PFiR7j8Cbe/oiBFrPuKlUk+7CfpTkpuhb3tWVC6t6RsnE9OyZaa679fa0vNhZwpy2PQtYmu5A5icYDRYPNcDlbXV1kPN2oUP5965jKPH8cWlDZm9MIMjyFyE+FoB2mZfr2I0daPivEq2yZVgofsIPRrTlagVqI4qtJMg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749113359; c=relaxed/simple;
	bh=61Q9MNQgKj/nfdeNjptr7aiw5p9TwPx4Ay8WdI98Ol8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mducA4Bcq1G0J5snE9urdZNU+7x2adR3EhWYMNzz/YMw14u6khusUqYuqG0zc5ATGhIkn3paXeqkUCKtOSnAiuuRMxwtlGkM2c1iVmrrs3lIkpu7SEDs2cTA2Yabk+nHHKm0CPeuMZt2N13cO+q2mX6nL4qCdVjBcQROnTe5mpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tethuvudet.se; spf=none smtp.mailfrom=tethuvudet.se; dkim=pass (2048-bit key) header.d=tethuvudet-se.20230601.gappssmtp.com header.i=@tethuvudet-se.20230601.gappssmtp.com header.b=g5YLEqta; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tethuvudet.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tethuvudet.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tethuvudet-se.20230601.gappssmtp.com header.i=@tethuvudet-se.20230601.gappssmtp.com header.b="g5YLEqta"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32a6c0d613eso1011981fa.1
        for <linux-m68k@vger.kernel.org>; Thu, 05 Jun 2025 01:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tethuvudet-se.20230601.gappssmtp.com; s=20230601; t=1749113351; x=1749718151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JY/ou1Qi9IB82nWBeWVWlKXuF2Fa3E3I5cFOuwqGQw=;
        b=g5YLEqtaMszZunZ7D/oQfGiBkn9zFJYaAWGtHl5UlZbZHrJdgNZdKDY5dxgS68RrQt
         M8yXO4KDs2qJueH3nJ4mX8u+sLke/wbKlQ0CnfHmpcN6o++xEEbBBmgXBm8M2a4h5x14
         8R0DzSFbPAyAUMmxVJOuKiynqqniDA5wXSXU7IYe5zqlNPYrj7rAy7U8twQg1Bziwen2
         5gj6OsrUTOu2Z7K7XnUJMuSfGL84UpeR3ZKuiJLAuK+gGjXDlPLApNOB8J2FuVdaOwhC
         zc7/cFtECqzZsgSHNkQK5JiiopbJl4lOiV6LXZZvKw0Yz+bwiMskXAyQqIOj7+EHT/ol
         uBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749113351; x=1749718151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JY/ou1Qi9IB82nWBeWVWlKXuF2Fa3E3I5cFOuwqGQw=;
        b=bOhI6+fEXWMVvVOls6V17kgJWP358+XnlawlkinlszAVKHhJ1M5p8HXyoZFOq6s9wj
         ddmpcUz58GG9ebbVkqdGB9NrLy2vdKFjLkFlSq5XCfIXu0T1kFdKTjF8QAJhhibpVCFK
         E++Q0VYYVILCBOLwh8M9vmWqR/5VF2imeuY/RzslNmZ9MFHEeBxvTffwEAZbVCA66ecw
         Q5vMl8UV7pRtOIjJ4PgUDfgdFPqV1rIO5clFjEIzBbMtowbCza7QIQuU6+CVnRvau2sR
         lSIViPL0nL5iy++IRHnh0l1eoPJ7chLJRsKTK9M/Bo6Q9Lboys/HUJedagw2T5TC8yPG
         ukwg==
X-Forwarded-Encrypted: i=1; AJvYcCVZmB0b/nOU7juv16w6/rfiuGNU/jc+fu6/U/HI+sssXnF0Zg/GH0++zH0S2PLntTZdqaEvMXm0uDea@vger.kernel.org
X-Gm-Message-State: AOJu0YzzyyiSDnLPCEa98KUDvG1e843D3EDqiUQT+8SwkAHmCQbcZrjK
	uA5Vtuk00uVkJHny6n6YSD0q+FR+SWQhoNxHxcg0Uu377PISk89iGdqfYewF6nFeCpHNIgXWSLe
	SkOG0t9A=
X-Gm-Gg: ASbGncvXAuYL0x+2a7LUu1Dx8OwPqcuCo8gwx2IZG6dbvhHR5hQw7/eu2zMOUdsQmT6
	wC3Z7JNi0C6Cqu+1eQNPDyPGdDa58MLK3iNhalDQpaRzIiHgA6SQO93wGFLxOyjq2L665OpjBLU
	ql0v+RYeyy8lOafm+f/r/RCgRHt0SUgJWnSreuqRtsajIVsvM2nbBXXvGFz2N4Eb45ivFG6uZyH
	E21wSS3uE2dQx8UzN5khgTq+O0AYsgppUFqfAqb/l/q6H3T2SoGc3xsvbJhXVv/i3ptzFRdp2Kl
	crrKGq8X3adx5960Lg19pmWULv54RhwfHIVwQlirq8BfK2DUxqZ8YswZbog6RoofYMjaeuowv4E
	ooTnKSdlh0j8j
X-Google-Smtp-Source: AGHT+IHzIxANsMg7m3zWjTtIyzsjH8f9miR/Qw1T9ef4eKa9d5MhzcSjxeKNdT/0VN2NXsWtua9ypA==
X-Received: by 2002:a05:651c:19ac:b0:32a:84f6:a859 with SMTP id 38308e7fff4ca-32ac714a480mr5964831fa.2.1749113350718;
        Thu, 05 Jun 2025 01:49:10 -0700 (PDT)
Received: from [10.22.115.102] ([81.92.27.138])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bd29a2sm23668621fa.105.2025.06.05.01.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 01:49:10 -0700 (PDT)
Message-ID: <30ad91c1-b42f-48f7-81a0-e1efa64a6891@tethuvudet.se>
Date: Thu, 5 Jun 2025 10:49:08 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
Content-Language: sv
From: Anders Magnusson <ragge@tethuvudet.se>
In-Reply-To: <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Just curious; does not Linux use the processor-specific flagging in the 
binary that can tell whether it's 16- or 32-bit-aligned (and handle it 
thereafter)?

NetBSD changed VAX from 1k to 4k pages quite some time ago, and to be 
able to use both we added a new id for 4k pages.

-- R

Den 2025-06-05 kl. 09:36, skrev John Paul Adrian Glaubitz:
> Hello Geert,
>
> On Thu, 2025-06-05 at 09:16 +0200, Geert Uytterhoeven wrote:
>>> Yes, please send a patch. I don't expect it to be accepted immediately, but
>>> it will help us spur a discussion on the necessary changes in the kernel.
>> It will be NAKed, because it would break the ABI.
> No problem. We'll carry the patches downstream then. I'm not going to change
> my mind about this because the alternative would be to just let the port die.
>
>> Thank you for providing solid evidence that changing the default
>> alignment in the compiler will break the ABI, and is thus unacceptable.
> And who cares about breaking the ABI in a retro-computing platform except
> for the few people actively maintaining it? This argument only really makes
> sense when talking about something that has commercial relevance or a relevant
> user base.
>
>> (I wanted to test-compile all uapi headers to find differences, but
>> ran into many headers not being self-contained, or causing conflicts).
>>
>> Feel free to start arch/m68k32/ to work around this ;-)
> Nope, we're just going to carry patches downstream and I'll just ignore people
> that actively want to obstruct fixing a long-time problem on m68k with the weak
> argument that it would break Linux binaries from 1993 running on a modern kernel.
>
> This isn't a use case I care about.
>
>> BTW, looking into the history of __ADDR_BND_PKEY_PAD() (which is
>> overkill on m68k, as __alignof__(void *) = 2, but might still be useful
>> for anyone wanting to revive CRIS support ;-), I ran into Andreas'
>> explanation why the minimal alignment is still 2 bytes:
>> https://lore.kernel.org/all/87y3i442w1.fsf@linux-m68k.org/.
> This post just proves that it's always a bad idea to keep historical burden
> instead of fixing it.
>
> Again, can you please bring up a convincing argument why it would be a hard
> problem to break the ABI for Linux on 40-year-old hardware? And who would be
> affected by it?
>
> The ABI isn't set in stone and if need to break it to fix fundamental problems,
> then be it. They even broke the ABI on a production architecture (s390) back
> in 2014 [1] and apparently we were all able to move on after this.
>
> Adrian
>
>> [1] https://lwn.net/Articles/605607/

