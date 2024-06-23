Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B669450E2
	for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Jun 2024 23:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719185872; cv=none; b=CzMAPvDHQgBfqdF1lShwwavHwJNPe10B8DjFvyQONDmkv0smTpomI6oj97fK56BnPRdn6jE1fxccC7xm+4RHqU4bZl/arQ7n7/3la2hYxg9j6ShC6uD+q+W9RLa0gQLmYl5/tyCIKvjCg+v5Yhrx5KHyeZmQCzcD136DhAk+pyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719185872; c=relaxed/simple;
	bh=hvO3uNn8Q66ktNcZDx61qazOgc/vU6vR9ZIHVusU6Xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAsAp7hAKKrwnh6gkuMClI8o4RDrtCA6VgphV9BeeAMHbPi3qIuKUJ8z9E4IHj/304bxeOX7Ms/1jUo/vp42rBIjYKXxMEYbuVNbBTsJRqQOTvNl3Gb6a/VKPwk4xlZ8b3/StazJEeA9GUgA79+zXBYLPd4e1h96EaKW2ODb38w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUzVO4ID; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUzVO4ID"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f9b523a15cso26633365ad.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Jun 2024 16:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719185870; x=1719790670; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tob1y+F5HxzaDHw9FRL6uzHX/CvrFsBXKWHkk+3lnXw=;
        b=EUzVO4IDtaAj4rMrD8NBfTc2b360d6AoRnBZluitmCe1bpDEbfOsFECNzgf2Bvb25R
         o64rSYn8ba5jURPQtBMnVMte3ho7+iDZOdrto3nyNTQ+W1wOypYSHT52NQx4sccPyws/
         fEOUOJ7qNlq38CDW7G2tZ29aS4QjbZGOjdYoMjsYR+vFg1JhMQhIgCZpEmuuT+INKy8j
         U7W4TwZpfzoPDMQcVdmMm0q+3HgRW4ig50k/mHZboECA7a7EMnXTYD4n4Ss0wMPWDONu
         p2/OALwvpiQcS5cjZaOV+Co0rFq9ZLgi+VFo7iQNxlZXh36pzoIVJnXAMKZH8a1db0Oj
         fYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719185870; x=1719790670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tob1y+F5HxzaDHw9FRL6uzHX/CvrFsBXKWHkk+3lnXw=;
        b=r2oWWEZU6rBxx14AKbModc7FIJuMR68IEpBZbPgM95pherOZXERlpabsO/cwK+b2p7
         dGgyCd+uRjRKvHoKDPsYOCnq+kC/mNLqSwpk8g6hVi4nst3h2n6V+l8VF+KtLYXBjD0o
         +2s29q3/NxV89pNlmQyJZGuETIFnrEwkWV1r6qcqYeDPEVquhEYyURtuERLiQnIor7Qj
         6mXymgxewmNpN6FIwySuE6q5jQF2VHZq1dabVCA0qljIoEAp98Hcbrz5jBj6C5ISnONJ
         i96y/WtCv1BTgOprnglYysd7He5U7cIEmuOLc7bRqIeggulDHI1KeYCWN5oQxdH6S/FA
         m2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWeeK416lxdJlx7c8wvt4fY3VnPdhH+V3db8XhnoGzirtbLAomcF+0b3dOCocXWUpofn9MZ1ttyMEKRnIcBQvlCPZIJw2Xca0XaivesVVwj
X-Gm-Message-State: AOJu0Yw+SY4EIkyHmxZsUB6/SVo3oQvh0RzqqsaZrtNyDLdfJdHkfdwj
	9YLR1oO4rDC4TOsdD10TT17NToGiH8XTacc1o4bD/CgZLMzz4EU/
X-Google-Smtp-Source: AGHT+IHeUfWZgNg5MQ6ihHm728eC4YfLiV6vonZwwQl2OX7kZd2bDU+k1kturJH9UbQbdjlpP2RWzw==
X-Received: by 2002:a17:903:41cf:b0:1f6:3580:65c9 with SMTP id d9443c01a7336-1fa102a07cdmr51686435ad.26.1719185870224;
        Sun, 23 Jun 2024 16:37:50 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:59f2:64c2:bfe2:faa2? ([2001:df0:0:200c:59f2:64c2:bfe2:faa2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb323ad0sm50271025ad.82.2024.06.23.16.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 16:37:49 -0700 (PDT)
Message-ID: <e30354cb-934c-46e1-abc5-1b6c4ae4909a@gmail.com>
Date: Mon, 24 Jun 2024 11:37:55 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: fix TT bootup freeze / unexpected (SCU) interrupt
 messages
To: Eero Tamminen <oak@helsinkinet.fi>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20240623232503.9445-1-oak@helsinkinet.fi>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <20240623232503.9445-1-oak@helsinkinet.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Eero,

thanks for your patch!

On 24/06/24 11:25, Eero Tamminen wrote:
> Avoid freeze on Atari TT / MegaSTe boot with continues messages of:
> 	unexpected interrupt from 112
>
> Which was due to VBL interrupt being enabled in SCU sys mask, but
> there being no handler for that any more.
>
> Fixes: 1fa0b29f3a43f9dd

Fixes: 1fa0b29f3a43f9dd ("fbdev: Kill Atari vblank cursor blinking")

Your Signed-off-by needed as well. And you might want to add:

Link: 
https://lore.kernel.org/all/9aa793d7-82ed-4fbd-bce5-60810d8a9119@helsinkinet.fi

before the signed-off tag.

With that addressed:

Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>

> Reported-By: Nicolas Pomarède and Christian Zietz
>
> (Bug and fix verified first on real Atari TT by Christian Zietz,
> this patch later on in Hatari emulator.)
> ---
>   arch/m68k/atari/ataints.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/m68k/atari/ataints.c b/arch/m68k/atari/ataints.c
> index 230203ffb..fa189eeb7 100644
> --- a/arch/m68k/atari/ataints.c
> +++ b/arch/m68k/atari/ataints.c
> @@ -303,11 +303,7 @@ void __init atari_init_IRQ(void)
>   
>   	if (ATARIHW_PRESENT(SCU)) {
>   		/* init the SCU if present */
> -		tt_scu.sys_mask = 0x10;		/* enable VBL (for the cursor) and
> -									 * disable HSYNC interrupts (who
> -									 * needs them?)  MFP and SCC are
> -									 * enabled in VME mask
> -									 */
> +		tt_scu.sys_mask = 0x0;		/* disable all interrupts */
>   		tt_scu.vme_mask = 0x60;		/* enable MFP and SCC ints */
>   	} else {
>   		/* If no SCU and no Hades, the HSYNC interrupt needs to be
