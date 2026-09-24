Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74F23B5306
	for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Sep 2026 02:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790217195; cv=none; b=H8HVKYKO2BZqspNornkMZkrN3NYoZjkD+npM7RAQkMNEgdApAR5D3ZMi/rHc3vAHptJKQmk0a+nkt4Kc9yTl+rfK1PITCw9NqI4sIxD1Nx8qmzlCk8IJTjC6TUb90vZS+gN53ScJ9VAJqJ5i04JcYxI8QjTbG7Z1NQh9N++slyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790217195; c=relaxed/simple;
	bh=0jewx94Aol1IKcOojWLEYdfUZw5SFvsaq76oQocjly4=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=o0P4nd/tmJsSuGzY/tfUkVvP0ts2DFbv4NsRKYg+i7X+zgESuWwbGHJ0PyZvCn/uz8NlvTr5fYP4ZF32lWHoMxQiew+3HtElshUiS7XUjaRXehR59uU819wLO5P4kZXp/YEopUmALojQ0U8wrO0ydSJvjHBR2ZWaCd2GIIjwxd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8soPyNX; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8soPyNX"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so896961a12.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Sep 2026 19:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790217192; x=1790821992; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z/L1hXpzWJJQOqyHxMdxo06cE7DFt8m14lGkwmdYDss=;
        b=G8soPyNXB4QjI7VwiorTj/3JR3CPPhG6vZ4+G7LIqiT6n/UgLRldUXKqn/R8DzYE1Y
         pq4hwUAiSI9SGUi7RPQZa2qUvtptOfArcHfYKDqHW0RxWM66j+wiBrqHtDvSEd4TC9GI
         S5N9F3n1Gm6f00aZbe+LOI0UHv7N06z6YOPZKdVJIY7NKZjlvLsY/8ublaDn7jNUiECE
         nbb3gfwZ15R2YSJGlN7A1ef8vMCdljFGqxciaomrUOkN2saW6SSCm7WGX3bTP6WLwHFC
         mhiHh0U5mVaHvRKXiPEkg3raKrwGoIGjRCUXwoNggo3DnGz2M9Mm+u0ZJnNi+hBhj3zx
         WeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790217192; x=1790821992;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/L1hXpzWJJQOqyHxMdxo06cE7DFt8m14lGkwmdYDss=;
        b=lPODGB87PCiOfxrNke4/1QVRV/Pp12G54f9Bo+1pcRljnikSF6TOd3rGHNr12BekT8
         LeakkanPeG07/xCQ2KD1iAEnasH4uNd33g4RA4yjS48bZaJC0eoKSwbiQ8TTDL+o5g5k
         ReITQwvGh76sRZkIoNcgLcmOm94pzbClRwu6gcPO5yTBhQ8tM3qWRF3LtuIW3Klwie6M
         QLhblUpIdM67W/JeYm+RKF3JJv1wKY3FK44+C/nKbE5IZAGAd2tYCxBVB08iBfJay26A
         D6HbDR4HLgJj5KFmLSUgPArdYpjHzg8z0gTooRYTeO+kU7MxaDFUycyg2eWYOsZOG9Vq
         UX3g==
X-Gm-Message-State: AFuF++n4fa4CxHcr7zOJzp2AGzEWiuDpFuK35WCSALT2my9IwMCnqGge
	blvVBM7xd4gqeSsIINrxJKxBI2igqk+c3+O49jTI4Ejoq8plBWMpxXyo
X-Gm-Gg: AYBFou3Wlmiy2IbRwmBo2O73uJWGFQv1QTMxE4+yQAbDFlr0obQV3Fh0f31uxXF4pyB
	TlDk8mbEJrRGp0JJYtaAWf6urSTRa5w/QGuKOELzExFIOQW3OygICX/fQljyE+buqD34DdRLLpE
	JdKm2Y+rVpAPyNIO4ULSwUk6OLlGaBV38Q/Octr+4nvoAzMSxaP4GCtntUQf0Kr1bBZnTD4VZDg
	PVcwkEsyftdKg82keNBke4UIejPnjKnwIfGwrTKvoQ3jTCzliohk7pGdwwihFfVccNtXTdl6TtI
	+CmACrRWeg4w5NEciKdHbkfYK8rKJ+SMa40cTdEmFApgu+pSTmB5/g4QcmNWohsqy/tZZw2rvd0
	90vdC919JBMx4oWLYyPCzh45H+ACHu3Ctx6wIkh5B+RlmI3I+516sKxzSM5B+vA/p0Zet1LdDCc
	FheShVPX6czi85r1IZeqDkFqQ4t+6Z1OEkyy/U2PVQExRp2Pw/cLoMTtWTmVo6cwNwO3StqjnPi
	+NWTdV+hkkgR3mp0xESIpDjds0L1b2wJCzyNqUz
X-Received: by 2002:a05:6300:68c1:20b0:3de:1526:4602 with SMTP id adf61e73a8af0-3de15264efamr5628637.59.1790217192226;
        Wed, 23 Sep 2026 19:33:12 -0700 (PDT)
Received: from [10.1.1.24] (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dad4e06sm2075342b3a.41.2026.09.23.19.32.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Sep 2026 19:33:11 -0700 (PDT)
Subject: Re: [PATCHv3 1/3] net: fec: do not use readl()/writel() for ColdFire
To: Andrew Lunn <andrew@lunn.ch>, Greg Ungerer <gerg@linux-m68k.org>
References: <20260907134037.1855408-1-gerg@linux-m68k.org>
 <20260907134037.1855408-2-gerg@linux-m68k.org>
 <42ad1525-fceb-43d6-aa03-d17e844a9ad9@linux-m68k.org>
 <eb987eb9-f368-4d28-bdd0-c289c3039c3b@lunn.ch>
 <46246a5b-3e95-4ecb-bc52-e374dc136514@linux-m68k.org>
 <fe8a632a-80a8-45da-ba64-31158af7c987@lunn.ch>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 arnd@kernel.org, wei.fang@nxp.com, frank.li@nxp.com, shenwei.wang@nxp.com,
 imx@lists.linux.dev, netdev@vger.kernel.org, nico@fluxnic.net,
 linux-can@vger.kernel.org, linux-spi@vger.kernel.org, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <3cc86de9-9007-42af-7291-70e52f6b0dd7@gmail.com>
Date: Thu, 24 Sep 2026 14:32:54 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <fe8a632a-80a8-45da-ba64-31158af7c987@lunn.ch>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

Am 24.09.2026 um 02:15 schrieb Andrew Lunn:
>> The driver will always need to support big and little endian hardware, so I
>> am not sure how to avoid some abstraction like this.
>
> I was wondering if there is a linux standard set of macros which is
> supposed to handle this big/little difference, the macro knows the
> architecture and does the correct thing?

Knowing the architecture may not be enough - there may be multiple 
platforms within one architecture that need different address 
translation, different endianness, access quirks, the lot.

We'd need a 'bus' parameter in all these macros to avoid what's in 
current use in arch specific code (take a look at 
arch/m68k/include/asm/io_mm.h for what may be the worst case example. 
Don't do that on an empty stomach though...).

Like, use arch supplied functions if needed, fall through to the 
standard macros if no special handling required.

Cheers,

	Michael
