Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737A8623
	for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Mar 2024 00:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710288994; cv=none; b=dmZzUesSAKmcfm1Y2KlL5eqQaj4GmU0bn+RkXRrIjm/w5OI4dqK01EoloLh0Q/FoahqgxcKmeYTV0DicWCQjWdfR2ijeVKi3E12Ts6NbavHmgY8rlP65LevL6g4U+B52hAIGJyY2ZYgMcUXeInw6jvOwUzLkhUUO48Yjmnbg/gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710288994; c=relaxed/simple;
	bh=WXDumr1atQgSPuiOsWIFcNh2IbEgw0/YCVo2LCTB8Lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UP9p876wYClWm8FY3XkyYIqfpg4PSi0215/slb22xjO/M3vuPs6vzlNHj6g4c4ublN1DJvolqXEctiSW1KzRJuGJ5EG8Td2J3uJgHjJt8ydTbew5c2mFwKqTUemPZ5S0en9ScyoQqiI06FCnl8DphMKrouCHCsKXi6bGbR3P9y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYfCzfhS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYfCzfhS"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ddc7e45c47so3461435ad.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Mar 2024 17:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710288993; x=1710893793; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOKBneqSWrfwIWiuvn+g4DZxlfF4PRCDZEgO/ExYUsY=;
        b=iYfCzfhSX6aOTgm9dcNxvatsi1Xa1B+sTdrUYno1pqPE0Shg/CVy0rEJ64Ioy4PUi6
         dqScfbA0gO1h/qqbhO/KL/mk6ZH6IaeQ2Uwj9Ekv8GWFbEsPR0WSx9XOUrJpIxG57kCS
         VegDYk07WONFbZfa6SEX0updikdW6l3NQj5+ZS0edPi+QV3EicrOYIefK9gODurA7Y4d
         5Z3XXKAa+1iukoZ8L29i1+kkc8qJmxjObsxJ5crJOXz4sIgeF8bb1E9/GCYjp+nXhfeD
         AkmF1OHzxO3C0SxciP1KY8hjlQSMrsft56P1ed7thmNk19U9CZKkZ5SlAzn112CeNspr
         Dphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710288993; x=1710893793;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WOKBneqSWrfwIWiuvn+g4DZxlfF4PRCDZEgO/ExYUsY=;
        b=Bv2Tqv/vYLS+jA7Idk+jcAqxKQZ3pAhA6XCCXaZYDH+vLqcZS8IAZRUv0nMY2kXu/x
         FylyNazO0JGpT7Hwyarzz6cuPRpGy1QGHOzO2BY70ZYKiQ0pW/zz8HEe8/jzY4OPbuKZ
         svTVE2oB2qCkCABX85WjLygQD9Q9+iYc+7EUDoGCMATxhFx2B1UGzb7ZtOztm3cC9SON
         lvXA+sM7J7sesnwIOaBbr3QYolw+2CmX8TvgAaqqsavKSNYhnMjDWrvsjYY3hofFDOEM
         Dgig8ibAd+Pz3l5bu5dzGhb356/WWdFxn5jasqIInrJMqDjlm9+JMs22sT0CtCwE3BFN
         GuIw==
X-Forwarded-Encrypted: i=1; AJvYcCVEN7LRoslLEHajooF4AEfnc910eeAnUs+nqo0nam3lv2X+EZ7E6M9MyIMdWSToYC1B/fqUIFX+nhUUQeYSqJV3+JrQJj0xyI80EcpNmklV
X-Gm-Message-State: AOJu0YyUkCq2Ng3/vZzgFT/fkYCxl/0PJZpIkzZGlvKns4dc79YQ1KYd
	nr3Gnovii86xaBG5ahyMisxO5MUpzv+tUSs9T+KGW7aPpcP4Ux0u
X-Google-Smtp-Source: AGHT+IFDG4uYBDao1zALIpolZnvQ33hrFtC4Ztzz6l10x+uAcB7Jz5n8oU+oV+AhfvxfxTD98RphJA==
X-Received: by 2002:a17:903:2452:b0:1dc:b531:82d with SMTP id l18-20020a170903245200b001dcb531082dmr1938057pls.5.1710288992553;
        Tue, 12 Mar 2024 17:16:32 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id r12-20020a170902c60c00b001dcf7c2939csm7343951plr.105.2024.03.12.17.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 17:16:32 -0700 (PDT)
Message-ID: <0c7b96d2-1cf1-4fc1-876e-8e3bc859a1c5@gmail.com>
Date: Wed, 13 Mar 2024 13:16:28 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spinlock recursion when running q800 emulation in qemu
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-m68k@lists.linux-m68k.org
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
 <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org>
 <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com>
 <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com>
 <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org>
 <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org>
 <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com>
 <fbc5d581-dcad-8627-3a19-6e2d10614870@linux-m68k.org>
 <2465c81d-d2dd-320e-cb4c-1c23fd485aed@gmail.com>
 <9e5ce055-8af4-4cca-3505-a3186b86926d@linux-m68k.org>
 <ad9a7be6-e2f4-f17b-04fe-393a409e523d@gmail.com>
 <745f844f-a100-5f38-99b3-97ace157b2a2@linux-m68k.org>
 <afcd0605-49e4-49c6-90a3-2d5b6a2cbf78@gmail.com>
 <CAMuHMdX-4kPgg99k7VJhnHNKp2F2w9+gStyvKnrDwB0NTm5EqA@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdX-4kPgg99k7VJhnHNKp2F2w9+gStyvKnrDwB0NTm5EqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

On 12/03/24 20:59, Geert Uytterhoeven wrote:
> On Tue, Mar 12, 2024 at 1:51 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 11/03/24 21:35, Finn Thain wrote:
>>> I think spin_lock() reduces to preempt_disable() on UP.
>>> In include/linux/spinlock_api_up.h it says,
>>>
>>> /*
>>>    * In the UP-nondebug case there's no real locking going on, so the
>>>    * only thing we have to do is to keep the preempt counts and irq
>>>    * flags straight, to suppress compiler warnings of unused lock
>>>    * variables, and to add the proper checker annotations:
>>>    */
>> That's only true in the debug case - there, preempt_disable() is used
>> inside the spin loop. But m68k is one of the last CONFIG_PREEMPT_NONE
>> archs AFAIR, and preempt_disable() reduces to barrier() on those.
> M68k does have experimental preempt support. I have been running
> that for the last 5 months. Works fine most of the time, except for
> the one BUG[1] that happens every 10 boots or so.
>
> [1] https://lore.kernel.org/all/CAMuHMdUQ72KOPw5vxNfhjoTR-SsaELeKneBmyQPYEWa_o5OZZA@mail.gmail.com

NB: the Kconfig hunk no longer applies, it now should look like this:

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 4b3e93cac723..0c4b5180df1d 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -10,7 +10,6 @@ config M68K
         select ARCH_HAS_SYNC_DMA_FOR_DEVICE if M68K_NONCOHERENT_DMA
         select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
         select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
-       select ARCH_NO_PREEMPT if !COLDFIRE
         select ARCH_USE_MEMTEST if MMU_MOTOROLA
         select ARCH_WANT_IPC_PARSE_VERSION
         select BINFMT_FLAT_ARGVP_ENVP_ON_STACK

(HAS_DMA -> M68K_NONCOHERENT_DMA)

Runs fine on ARAnyM with a bit of VM stress testing using 
PREEMPT_VOLUNTARY. After a bit of looping (init=/sbin/reboot), fails 
spectacularly with not finding any root filesystem to mount when using 
full preempt.

Trying to boot a full system, I see the 'table already freed' panic on 
the first go.

Running a stack-ng stack-fill stressor triggered the panic, too. I'll 
see how reliable that is.

Cheers,

     Michael


>
> Gr{oetje,eeting}s,
>
>                          Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
