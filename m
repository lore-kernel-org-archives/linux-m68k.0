Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794178732;
	b=aHLQCs1QBga626aqObp7idxfevZLvjra4zm93SdJHExqMLcv+sLIv5NGq0vXD+jKtlRG
	 O8c8SR2nEg+eVmX/aDxAF4cdgvCjugcUwrkstNLhp/PImtJRjp8jN556N6OPr9NvIP+ia
	 0P6qTNPkHBvOgwa2S+YyxEhRFTKoYc8+uLdbS41vaEUr56FYqfVpPGEJSgm8N1+Aps/Pc
	 Ab10w4wCaE55vB6PXma2VuzP0YJ2GXeS4qUrNW8Scnf612LCJRJ5l8Q5d4GFVWMKPiSIc
	 EbDbab2vSiC+HMh3sUOZb3VzxFM59ju3bwnbUQKpPwqm06EXeOqTdJsD1Pc3xmxTncg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794178732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DxTzr5aT1f8Lw8XRh0X2JPM4X2Bt5RifhAKn6+Pv/lQ=;
	b=IBWcrqkI7BD44NLmZ3UpDuKIhUebmGE+Bj1Loa8qXTwy2W2ZFyNdubRUk1p6FA8S92dN
	 vhsrL+bNXk7xJBnRTRxIiMHiGLQIdXaIRrGAL9Q4YzFVbVcdTMo5hLbp/+mGCdGaqU+fN
	 mS6nfTI0hx+C5KyIXzDQqcLoUiS4SbBjjO4y2UzKlINMwpG91a5Bjo9f+9ZpiprZucXGF
	 V6gx7I129F4dMY6Pp8OkVfRQsq/XW2FKuiuK59EXEnyybS2m1tCHf0/8fqrNPDzDHGqfF
	 UTsPg+6ldF0nzRw6pC7odi0DaTmkae6z01Il60WOtIBXSKcG4fE3cAgQkjQ1Ap1HnLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUjVrFGW;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F102A606A31C
	for <linux-m68k@lists.linux-m68k.org>; Sun,  8 Nov 2026 22:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F102A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUjVrFGW
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso1768855e9.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 08 Nov 2026 14:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794178730; x=1794783530; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DxTzr5aT1f8Lw8XRh0X2JPM4X2Bt5RifhAKn6+Pv/lQ=;
        b=oUjVrFGWpoKDZ/TiyBfo68NsIabKIGOT/rz+I5e3Hx+ize8s4uDm2Igcg3yGMhK7i1
         BvsUOIr7KEYGts9jya1/9a5ZbKXveqv0g/W500S+pdQE/PI5cN3RMy2ofrBbV/U/wnQ/
         pPfjeFmZDJmmyua3gAT8N4UaSaluFpN/aEBT6LKozxyPCbLcXw0E2vTP74dviH7c097U
         ks7YeFtPsZ1yTFFjOi9yQb1p5vKw5tjP9hTh2FOw2w76ldX9pmUVEJN6XIDiI5IvNf1Y
         bBWG3b3A3DCEjRgEwEkjU2iBVqQzOoLhEg5N88JYRFchEPtp+kkTPwsqXDIXYj/5oAsE
         pEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794178730; x=1794783530;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxTzr5aT1f8Lw8XRh0X2JPM4X2Bt5RifhAKn6+Pv/lQ=;
        b=Johw47vmVW2/p/9Zrt8J0W/xBLXDj4Y++p/iVFrfrsjC7VZY6oO4r3uGjumOKG2k09
         rvpc+eCfkN/1ZPHH490b2qIcAZP1CyLvzofofnV2FXdQ9An26xiGwOshRyz/8LpdFl19
         9x2B7sPI12aq0VriUJWVnEStFYbucyZRRD/QK+3dpWB+UnmDMR54rSdeWpdaFJV0fy7V
         hyVtRUo3nffc8pvhYOC1+wdvqn7iecunjxXrKYxEB80rPFo5L4xnv3qU8gPHdjB3IJvv
         mSRgvHNVxyN2MKk7DypKCdxU6R7LSF4/pIrKLdS0n2hbj0YBUE4o+QcHHI7W//AikTOa
         ykLQ==
X-Forwarded-Encrypted: i=1; AL+hErHXYMeu210bkiKNx1U8sgvFHlY4C0sTvnRFYg49lE1xs3lb8a1nTz2rJ2TtIoPz0ISc9OgsAg509LNZ@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8MoS9NRMI64YnQz3Jl4lYxb4k4HSSeAhwXmWxjrowDE62DsugC
	3jtIHoObeTR39DaVf8rsG2YJzeYhQhcY8FjB+whrd2dWQ2HLClQTyTCu
X-Gm-Gg: AYBFou2SNE4yNf9MSgmx6Ry/+KsDVOjrX2fYSMe2peBI16wfLlsXLyA0bzQHgW6EBEZ
	Xy2fHEM5OJhlTcoH9/wy7mhhEikC4s0pYiIC+v68dUa+WN+xm9Efy7Q7WJnrMRsbyq6lm7r4xKi
	aDNRB29GUamjfsFqb/px6DTZvcwwiTJoEOvDAEn4efnBjP8E5Gstf34UQbw//o2a11dloqKYVZ+
	zqkluWXZqpkumrMzd+8wyL/S4uu/89WvSYfj3K1zGonRYCglT4UY+XqU1Z9AkM54IiLy8aGhF/I
	KFJjAmYVay00/iYI9SzKl7WtOcxTwwVtWNdlipcuPAyv0tHPUI8+cW8LFMFi6j2iO/CyjyDg4sT
	qEeJZF51aG9QRK+lz/kKJOF6u7XaimmQqpbP0v8K7eh+aLFaO4OsgN70wBYFCiJSmuYYetzTE8u
	QNgX/SSFa7ysiesLQXlqfn9Q2Io0ztoYo2MPE/1kNfqfSrDS9Dfuw5DGTPLtHqlvConvL+mGGB9
	tI53uytckq7h0Ge86j0xvRJ9pFqTObeGC0MRCXE2QGyy663iIiIfXxo8IPMpeAlwt4vf6Kebamy
	4bfc6veMIBiBVYXTe0rj8rJjXv37RwgjWgqHwU0kRUdGaypICAyZD9IiImaOtL0W
X-Received: by 2002:a05:600c:46d1:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4b960d9c486mr48668035e9.5.1794178730212;
        Sun, 08 Nov 2026 14:58:50 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f119af9sm88390475e9.14.2026.11.08.14.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:58:49 -0800 (PST)
Date: Sun, 8 Nov 2026 22:58:48 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] m68k: amiga: Use clamp() in amiga_mksound()
Message-ID: <20261108225848.2b643170@pumpkin>
In-Reply-To: <20261108134501.404852-4-blum@kernel.org>
References: <20261108134501.404852-3-blum@kernel.org>
	<20261108134501.404852-4-blum@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  8 Nov 2026 14:45:01 +0100
Thorsten Blum <blum@kernel.org> wrote:

> Replace the open-coded period bounds checks with clamp() and remove the
> redundant comment.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/m68k/amiga/amisound.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/m68k/amiga/amisound.c b/arch/m68k/amiga/amisound.c
> index 5ae1f017b39b..5b9d265b2cac 100644
> --- a/arch/m68k/amiga/amisound.c
> +++ b/arch/m68k/amiga/amisound.c
> @@ -12,6 +12,7 @@
>  #include <linux/timer.h>
>  #include <linux/init.h>
>  #include <linux/string.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  
>  #include <asm/amigahw.h>
> @@ -81,17 +82,10 @@ void amiga_mksound( unsigned int hz, unsigned int ticks )
>  	timer_delete(&sound_timer);
>  
>  	if (hz > 20 && hz < 32767) {
> -		unsigned long period = (clock_constant / hz);
> -
> -		if (period < amiga_audio_min_period)
> -			period = amiga_audio_min_period;
> -		if (period > MAX_PERIOD)
> -			period = MAX_PERIOD;
> -
> -		/* setup pointer to data, period, length and volume */
>  		custom.aud[2].audlc = snd_data;
>  		custom.aud[2].audlen = sizeof(sine_data)/2;
> -		custom.aud[2].audper = (unsigned short)period;
> +		custom.aud[2].audper = clamp(clock_constant / hz,
> +					     amiga_audio_min_period, MAX_PERIOD);

That requires that amiga_audio_min_period be less than MAX_PERIOD.
The order clamp() does the compares in is undefined.
I think it currently does high then low. (IIRC it got swapped a few years
back by a commit that said it didn't change anything!)

I've thought about proposing swapping the order and then allowing:
	clamp(int_var, 0, unsigned_limit);

David

>  		custom.aud[2].audvol = 32; /* 50% of maxvol */
>  
>  		if (ticks) {
> 

