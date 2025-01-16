Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E07F142E7C
	for <linux-m68k@vger.kernel.org>; Thu, 16 Jan 2025 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737023218; cv=none; b=Xh6MTxneiuYqhS+hD1Eq6kF5p4fsbSl/8cHX3M7HTcDsH/WLWw/8ZAIZEvlp5+WP/abSAOfBLFr3CW0iYM8YSr6F/40AVekg+BG0jubPpKFlUGLkN9M9S1cF4oz++2HH3ay25RID3kZQHCJUY94hN3MOf3ItZ4OFAInF0uwfGPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737023218; c=relaxed/simple;
	bh=5wDk0zPlydfCcSq56Mg3T9X8aNc+QeWo/yOhqIYE7SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYB6AtbkWS2QXXQRCu1+mtB4r/Kog1OyGnurgku7m3zHuTLueNyfSN8F/VGMnqlI90mwZZOfNH9IiydEs48ncVOgT0X3eyBhwMxd/yfYKTl6PlMdS+phl6EoFy3VARYopO5bUZdkntPpZznkjwNPFCLKSvwjMNKNLcaWxk/u7yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Di7RHSfB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Di7RHSfB"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43675b1155bso7239705e9.2
        for <linux-m68k@vger.kernel.org>; Thu, 16 Jan 2025 02:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737023215; x=1737628015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kx18UVboo3GjCjLRt+cNX9VKMz9VEmqONvoHFlulxsE=;
        b=Di7RHSfBt9AxwrRJxBoU8zuNwbtMrEt/uxbGHk/0VBgjLKgZoPtQzUWFyXV36OO5N1
         fSZLKEfHu6Vmj5mcn6KCtDDTH4PyH6VzkUQX7JuqD/yDTMZfYyr0CyZz6OhozQEtfKB7
         tOnlUp5ndCiJ7WqObFdvzHwu0GwsZcN8EvtFgUWI3GsHxb4qmv3NsEVF+/KopSdxjy3d
         wvM5E498az4aRWQcYqnw+5I09zHEM3psiiQr8XtVrOu7r+UXIuGIPwsPVmZHREgooJj6
         7+7MWbg1T8Yfx2bHnOHbe6pT1lDIkzaeAK56opDn2SGTfel/zLvqaHbD2lv5AgAFLV76
         SHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737023215; x=1737628015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kx18UVboo3GjCjLRt+cNX9VKMz9VEmqONvoHFlulxsE=;
        b=BNRskvUyBmlSZ0IAS/ulvLYrsBT0cVJfbW7jS5FZZ0rHmUhF7P1gbUlwnIJ1p+KPC5
         H5JiD8VYWbdWLP0H0NegLBbkc/Xf4oOPRaSZ84SW21/JjOAvyhZWmknQgtFyUanONSBY
         rsNNeL9A86WF3OnOMLoH1SGCDybZAN0LLngSY1BRcYPj/QwaePiXpzqJXAO91E+HnA1a
         CuEZTKN45q56VU701PsE/PvYS2B7tsQRiVhwS8cbwrv3+AKmHc0+q7Xfc0P8pwcIBCz3
         x7lDPA5Q9XsF2z3n9GcakS1Lv+c15qrLOHUGgztmbRMkDhFiT042woFZj+5tfzCaPsPB
         /kqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5ZsMtCzMTyRyoPOmylgAzWPput5mpsovtRDn+1Kgp/8/uFQHEy8PKptecccV3CdiKwSsmReM9/l0Z@vger.kernel.org
X-Gm-Message-State: AOJu0YyeEjTtAGdqdCcVWZLoMTD5RejSw7p4DkxR2s1wGlvXT0Oep2oD
	l6rhqPbRxXb6IoSBjUmU9mGi0WXx0E26j0BncDA0CqV4ZUBsBvfK
X-Gm-Gg: ASbGncs48WO5TYYOWFMVz8ckMyUaNKUlqPd7f1JasNq/vp3XHQl9FHQlbri3ycgj8kU
	9fW+jftNOaq7p/3N0Od5Eh/KTPaEIRm6+TDOK0/SXZ0cLy1EeDQdbuAsSCAnoZ8D4wxuBuG0Nzn
	f+sbRJ2vDn2y+ptVx11QOnUeUv3/IpKKMXg5LCUa0kUctCdNSA192N5O2JZUOv7HlRMJFg6Axnc
	TV9EX09ODHLm4Q7Wi7nqGEmCwyKaAgkuGEaTStlR/NYm6+ovVQSZ6w=
X-Google-Smtp-Source: AGHT+IGKMwlriloE3dU5MtRqO3SJ7BuitcZRsE/zE1IeSIiIvBgrMBJTHu0SwdddfJrCo0OoJmFCfw==
X-Received: by 2002:a05:600c:4f09:b0:434:a5d1:9905 with SMTP id 5b1f17b1804b1-436e27070bcmr263382445e9.26.1737023214914;
        Thu, 16 Jan 2025 02:26:54 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:87aa:d43d:2130:ac3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74e59ecsm55060485e9.35.2025.01.16.02.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 02:26:54 -0800 (PST)
Date: Thu, 16 Jan 2025 11:26:53 +0100
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paolo Pisati <p.pisati@gmail.com>,
	linux-m68k <linux-m68k@vger.kernel.org>,
	Kars de Jong <jongk@linux-m68k.org>
Subject: Re: [PATCH 0/1] [RFC] Commodore's Gayle pcmcia driver
Message-ID: <Z4je7T0zx0QmF9Dk@amaterasu.local>
References: <20250112150542.413179-1-p.pisati@gmail.com>
 <CAMuHMdUO0qms43yzQMA8hh1wd6VaDYV_0TYpggxE9S5ZVeoLVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUO0qms43yzQMA8hh1wd6VaDYV_0TYpggxE9S5ZVeoLVg@mail.gmail.com>

On Mon, Jan 13, 2025 at 09:04:01AM +0100, Geert Uytterhoeven wrote:
>
> > 1) i've forced the word and long I/O helpers to be little endian, and this is
> > clearly a big no (see io_mm.h).
> 
> Can't that be avoided by setting ISA_SEX/isa_sex appropriately?

Hi Geert,

i tried ISA_SEX to do the be->le flipping but it broke all drivers: it seems
like isa_insw()/isa_outsw()/isa_insl()/isa_outsl() must retain the host
endianess.

Looking into it.
-- 
bye,
p.
