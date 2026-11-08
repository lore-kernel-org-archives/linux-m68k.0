Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794180176;
	b=w/WMDyjfrscTdyAhwrGSo9qdU1putPWuuAwGO7Lqk6sQ8nJSOZ6VC0a860/xRkI0XU0y
	 MYoZZqWs7slbcKVxsfPS5LhU5uMSbIXnEJ9Fq1/uZ/qJrmsVRDOQ9LLQf5BvKOfE5uIDN
	 fWQdJds9IdVC2gvMduaQ1jQKzbaiIV1xa6qSg9PHi/QB/sfoNP9IqSmbsGajmZDT8aZU3
	 aLO1FSeOAKlYs7MKO6mNbJcn3S+SYGuGY3niOs4LFUdk2mNQQ815ZWgZV6O+YIX+HW5jQ
	 hsk32wpXVj57YWK86bxpfptLp3J+j12dfhyA7HB7YC/IV0I7wAMZYmtT35tIRv/0ewg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794180176;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=MQQcfGC2Ilc1OespVBhWEoaBQ+gETSQ+qh9Dq7aOk9c=;
	b=41+F63k+yUft/NvwuD1rFwIzrDAl9qFE/rHAehMEq8RBhRY9rl7CsEgqUFcUIu0duAFI
	 bTHia9h3gKSREVM9gNbH2gme0/m3ZnOCQ+QsKPcqckg/ooVmdqPGGbuVG9jbBIefTVX1S
	 rkyUXXxvdAsH4U3U8JckR5mqjohFDFHH9jtETemnMCvUT9NfLIbMQODQhe7MC9lt//2L9
	 naxqH7cF8jJ1v8Acc4roZ+RT8XOY7ZLsCl9OrwX/MQBejrZhTYXrhYlVcqLy/f+Z9G7gt
	 K2Ib94y39baDK2N7mK4x9W7EhNHkKmjcRwrcMQWpX8h2nmlp3ixreqPEc7WCNDEgJKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCY3HloE;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB464606A323
	for <linux-m68k@lists.linux-m68k.org>; Sun,  8 Nov 2026 23:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB464606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCY3HloE
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 33C2541919;
	Sun,  8 Nov 2026 23:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037BF1F0089F;
	Sun,  8 Nov 2026 23:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794180175;
	bh=MQQcfGC2Ilc1OespVBhWEoaBQ+gETSQ+qh9Dq7aOk9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YCY3HloETMR2yXdlnOtAUJMolpXg11mKKpg+3w3g21Nfob53ThwiQz7kebC8/FXTi
	 8jdWEEjgLrYQnyCiSiBwWmnlWKn5G5n6IqomnFRQlW/JrDREh0rkCGndsWFhbULIDN
	 ir+/MZxl4edQ6Omh81NdGovT2V60pVP4IvEtXslbmc0xfNjYmVzwUkFDPjlP5PpdN6
	 5ORqo8ex569GG1RLi8f/ytR8PgN0q6nTI1iUSy5Ixsg2J31tHxZkar10LbaK2/l7rm
	 kE3/HBqlKpIlKRLjYW5B3VJyW1UZGxpq5KJAaulF8ROGxNgoxf3RnrRINFYk53F46U
	 KoMT2d6wVRENg==
Date: Mon, 9 Nov 2026 00:22:51 +0100
From: Thorsten Blum <blum@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] m68k: amiga: Use clamp() in amiga_mksound()
Message-ID: <avEES-c4bUBUFtUf@kernel.org>
References: <20261108134501.404852-3-blum@kernel.org>
 <20261108134501.404852-4-blum@kernel.org>
 <20261108225848.2b643170@pumpkin>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108225848.2b643170@pumpkin>

On Sun, Nov 08, 2026 at 10:58:48PM +0000, David Laight wrote:
> On Sun,  8 Nov 2026 14:45:01 +0100
> Thorsten Blum <blum@kernel.org> wrote:
> 
> > Replace the open-coded period bounds checks with clamp() and remove the
> > redundant comment.
> > 
> > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > ---
> >  arch/m68k/amiga/amisound.c | 12 +++---------
> >  1 file changed, 3 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/m68k/amiga/amisound.c b/arch/m68k/amiga/amisound.c
> > index 5ae1f017b39b..5b9d265b2cac 100644
> > --- a/arch/m68k/amiga/amisound.c
> > +++ b/arch/m68k/amiga/amisound.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/timer.h>
> >  #include <linux/init.h>
> >  #include <linux/string.h>
> > +#include <linux/minmax.h>
> >  #include <linux/module.h>
> >  
> >  #include <asm/amigahw.h>
> > @@ -81,17 +82,10 @@ void amiga_mksound( unsigned int hz, unsigned int ticks )
> >  	timer_delete(&sound_timer);
> >  
> >  	if (hz > 20 && hz < 32767) {
> > -		unsigned long period = (clock_constant / hz);
> > -
> > -		if (period < amiga_audio_min_period)
> > -			period = amiga_audio_min_period;
> > -		if (period > MAX_PERIOD)
> > -			period = MAX_PERIOD;
> > -
> > -		/* setup pointer to data, period, length and volume */
> >  		custom.aud[2].audlc = snd_data;
> >  		custom.aud[2].audlen = sizeof(sine_data)/2;
> > -		custom.aud[2].audper = (unsigned short)period;
> > +		custom.aud[2].audper = clamp(clock_constant / hz,
> > +					     amiga_audio_min_period, MAX_PERIOD);
> 
> That requires that amiga_audio_min_period be less than MAX_PERIOD.

amiga_audio_min_period is an unsigned short and can't exceed MAX_PERIOD,
which is defined as 65535.
