Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EAF1876
	for <linux-m68k@vger.kernel.org>; Sun, 28 Apr 2024 03:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714276306; cv=none; b=ql0mXJy8f7E01lvyHer+sSRlA4FJf19xHoQhlrdeTp+4iK+LGJ/+nvZ4kcv49d/esWpfJ6c9IuYob540+zky9ONO8DiarSTR+KwqsFazmjI7SGCs4/5NtCsvI60eAbDyHS1nqoy7INB2eRGGQZcQ2QYQLjHs+KpsGyvCrlCnPDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714276306; c=relaxed/simple;
	bh=PGMPikjHnbcANWTcG8Vrkim6qsOHWFtNY23tclMmKC8=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=gG45mfo0/XUhw9IO4tj2Hnd1ccCBcW2BN+XdamKt+hpfFuCWIHJjKRQdHKZSE320AMbQDtzXwKd3JBL7FWYrgMTV7ivWKLII4KJ1ks+S7uPIuxec1pzI5aOyXeCvFdvn1i17bLOnKm3ogslzb23EwxBjcgvBqtTL69YO/nYxgCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPX/OVEP; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPX/OVEP"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-53fa455cd94so2624563a12.2
        for <linux-m68k@vger.kernel.org>; Sat, 27 Apr 2024 20:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714276304; x=1714881104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9HvdWFIYtWlTssNrqT255B97bQTlSI8N/9lQlcVLAg=;
        b=OPX/OVEP0oi0V1rHEhU5PGlqk1dnGKsYg1mYeg50H2G9Vx7hgD4K8zbR2Cw0DYEcCG
         d9KhakqQL+YaWJJoJLzuYU8JvLo5xNe+xdWm8PnyFDFohPOEs1EDyS7Kc96vY52/pnwy
         +83uV+yDIAizLFUgvraToCX1Z9e63KvW2RzoSZRKmw2ePgoCasi1UZUMOSLK1Q1ozkCw
         AEJvOza4dT+07rGyev+6dhdJdRB1KqmD/XvS599hqoWIkh9m1+/xHAOzrvxJUnucb4pj
         wxCfeauI4BnsVfwOGSIu8dLOnvc7KdVfc5rs6T1sjLuY9Vk8e/RAJ5142yiAgZk5jGyy
         26EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714276304; x=1714881104;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9HvdWFIYtWlTssNrqT255B97bQTlSI8N/9lQlcVLAg=;
        b=QwydFg5/UqvOIcf6M0HkzuuLiUbhG5X5RRp08H3mzjTLH6ZkzvouQJkzriWmJTiPVv
         RFGe2YA0r+3NYFYL2y7/Y0xRwD4BOMHLvH3B/+o84RQ95g29da0qk3M18B7IkLNZ0N+E
         NibjMVqCJui88WQ9pO5ZetL5c2SlS55aKxYzaU5WlEP6fIqL7y3cjCJa1kMJ3fBMnJ1J
         wU/iBfz3LXN+bUBHmNe3Zyy5G2VwBmQULKVKoIlXrJrBSsMztDR0bMyEZjAKJNWpEq8o
         F7JWJvC4xIbj6WQYtwFEIM1isOWE2Khymp+Y/ufINMmdUBdUfd+04vchwlU+zyRjHMwA
         r4iw==
X-Gm-Message-State: AOJu0YyLs2a+56d4gOwR/o2ufFfWtHoGS+nrX9topnI3LeyykfI8qrIo
	atodtMaoXw8XEePOLu/RfjmDzbkDOkfj1W0aHM52Jd5eE+m8N0eb2jXVCw==
X-Google-Smtp-Source: AGHT+IGB/wzquuhRGup1kkGdojVjD5maZ39iuJix+hljjZ/5iR/kqbmsoIl35ydbeiCLt95vD5jQnA==
X-Received: by 2002:a05:6a20:4e2a:b0:1a9:5a2a:7e51 with SMTP id gk42-20020a056a204e2a00b001a95a2a7e51mr6782486pzb.24.1714276304041;
        Sat, 27 Apr 2024 20:51:44 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id c11-20020a170902d48b00b001eb3dadacffsm2316514plg.219.2024.04.27.20.51.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Apr 2024 20:51:43 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] m68k: Handle __generic_copy_to_user faults more
 carefully
To: Finn Thain <fthain@linux-m68k.org>
References: <20240427084815.1449-1-schmitzmic@gmail.com>
 <20240427084815.1449-2-schmitzmic@gmail.com>
 <fdbe029b-1df0-3e8d-fced-64cc719397fa@linux-m68k.org>
 <f88ad8f7-4fd9-45b2-a52c-cee3217083bf@gmail.com>
 <95677826-e3cb-9c1d-7d03-253a88aff3eb@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org, gerg@linux-m68k.org,
 linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <314aaa18-e28c-851c-d746-10ecc46eed04@gmail.com>
Date: Sun, 28 Apr 2024 15:51:37 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <95677826-e3cb-9c1d-7d03-253a88aff3eb@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 28.04.2024 um 15:28 schrieb Finn Thain:
> On Sun, 28 Apr 2024, Michael Schmitz wrote:
>
>> In my tests, the fault seen there had been caused by the movesl in the
>> section above, hence the fixup at 20b.
>>
>
> Well, that was my point. A fault at MOVE.W should get fixed up at 20b, not
> 50b. So the patch is wrong, isn't it?

You are correct there - the fault may have happened while there still 
were longwords to transfer, even though the fault PC is after the loop. 
The residual from the loop must be taken into account. I'll fix that.

>>>
>>> Should we put a NOP here to avoid having the unknown next instruction
>>> (label 9) in the exception table? We can't actually fix up a fault
>>> there unless by chance it was the MOVES that caused it.
>>
>> ... As to the unknown instructions following the final exception label:
>> These functions, though they contain inline assembly code are not
>> further inlined, and the instructions following the inline assembly are
>> simple boilerplate register restore stack saves that ought not to fault
>> (an invalid stack pointer would have faulted on function entry, if at
>> all).
>>
>
> But that's just luck. IMHO, the asm is a foot-gun even if it has not gone
> off yet.

If the compiler were to inline the entire function, that could happen, 
yes. So for that reason, the NOP would be safer.

>
>> On balance, I am confident the code is correct as-is. You (and in
>> particular, Geert) may argue though that the NOP approach follows the
>> principle of least surprises, and can be considered safe to apply
>> without further testing on 68060 and Coldfire.
>>
>
> If you're saying that your patch addresses a different bug, fair enough.

Nah, I was just speculating that instead of bloating the exception table 
(and risking to miss a bad kernel address as source of the transfer), 
addition of NOPs might be considered the safer option.

>
> All I'm saying is that, since you're adding the NOP anyway, you could make
> better use of it.

I already am, in __generic_copy_to_user - there is no exception table 
entry for the jump label at the end, so no loop.

Since I have to fix patch 1 anyway, I'll add the NOP at the end of 
__clear_user and have the exception table end with that NOP.

> Anyway, like you, I am keen to hear from others regarding the API issue.

Too true ...

Cheers,

	Michael


