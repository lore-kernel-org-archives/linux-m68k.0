Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505E32DA77A
	for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Aug 2025 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754917841; cv=none; b=kW/+b3nvFLzTkNNxUkrQYqiE5rebpkYXQP/SirwnYI2uVfn2/8Q4p9exTPZpo3HejQ1mOI9deLLji4lHpoGFqQx5YZEop4YgEsE9vhNyuM2ckwE52yDX3cxICbV3gVOZwj36Uv9esBrbmpan2Ngr3w6F5wcdIavkuZ1noyytVrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754917841; c=relaxed/simple;
	bh=YdcvZYKwitUcECgcbI2UhLZ6metpTwEak9n/5y6m0SA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9fe2p2pz/HYOGFuUnfRKWDPPVa6G8mxd8trT4lhQzsICm3Nf1hE4ad2ON0dfZ0iOv+CcBh+TjEDhms6UiyJp/yrFwR2xZoBkO9fyCwrSZ8qwQUD1tf/HUY9ZxOUhtD9W4X3WsmqY++rh9fPiZjvvxVa1/aqf9EHGMMnZjlVM+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Vv2Kuclj; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Vv2Kuclj"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24099fade34so30103245ad.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Aug 2025 06:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754917837; x=1755522637; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YdcvZYKwitUcECgcbI2UhLZ6metpTwEak9n/5y6m0SA=;
        b=Vv2KucljVmyLmk0sP+6eJbbuKHAUtgE97+bj+xXGFvk86PhsCx/+w+5cHKi7B+ZjBT
         CQhdSAudS60yezFz3R64XodF4kbqKllcP0Ux1FR1CfMS24Lnqs+EFS5spc1zyMRI+LkA
         k9yPQs9TDN/QPVBbfW8LNjrRHA3B/PKBuNdaj38smeNjRfvny76JMmjKz5vZLIguPT5U
         1SaSLY+2d7P0Xzu9cmwYvxdQ6jknBryvDyS/iXqqn42h6F1IjByukZABQIy9IADyjU4a
         TW4NUVvWFvJj2ZIFqhouXxEY46FcjhnIMXfi2WGjGPMvFAWIbZnCV8Dg/haxyQEWqTFJ
         aq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754917837; x=1755522637;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YdcvZYKwitUcECgcbI2UhLZ6metpTwEak9n/5y6m0SA=;
        b=ZXmEn6fXPrxnxsemG6EHTkF7XrnMt0roGhYxLjjzMgc7UyXmk6y+Xn5LfuV6eynIoN
         neP7mR4GGVMx8OKAxRf1XAiMETq03EvPEHhCXgKhZYqkIKUbSVyfphJX64tB0FjsbSCo
         ZuIf5RuKB7L7PUaDxXHJKSu15zRuv2KMOH3RqLXbuC2g60V9tIknrw9BXUJN2wSWO7Y2
         6lHxu2zh2rRt0WTsT3DNbTl2Sx6jbgj8FrwtZVUP+Xc9joyT8bwOGTd/b+Y6HGpfJlaI
         /3gw+JOZmgdkNmol95eqmsoFiW+iBPookGwzT6N9UTAWZDp+gIcfkNs1BNPPp01DYqdy
         HR6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwZXLVbCW2LhCpx/hZGQqQ0XRsvHd2zZkwHil4+CR1IXZT8oUDSdfETP5zyK42wzQjwWRyWW4trdZ7@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwT8MopjJk9iqcYOwnzwHYUt9iatGK0R2LfG4XOClCi8yjofw0r
	GdqEZTNiW7QffDjjLaeMNoN56IUuAKZPGRpe2C2HlFbCN+e+UDl6rZv32Szto26ia6AjBxppDGW
	7y9Z/Jbgp2aG7SVfZ9h9y4W3cyIsgTIoGr4q/ORCVZA==
X-Gm-Gg: ASbGncvwKUBdV/SDPZK6e3490LWsLrhzZwE89mCTpbrRrp5JQuIoGsY+Vhqpf6Lcrwn
	PhvGJia5VUUELVsmGJajHivDxqKkAlz1EFfzNlpx+sM/VJws5mcsclw+KVGFCKngc6iUlhP/8Ul
	DzBK4ZpK462T81w5UqCVeiPizrkLBbtYhBqjVo5xBG0QH6fnrMxYqn2O7NeJitsU9iqbkPRIkKq
	CZqKCz/ZI91+67+h7YhFeqF/3M3DP7pJBXbjH4=
X-Google-Smtp-Source: AGHT+IEgMvtsNpCEbzm+bQO3Dq6oVeggGu7qnt+f1HYUPfLnzNmxpfjIx2ohdBUK5XJ+fhQGIjFsq0lNMPvywZaOZwE=
X-Received: by 2002:a17:903:32cb:b0:240:96a:b812 with SMTP id
 d9443c01a7336-242c203d030mr203994295ad.24.1754917837398; Mon, 11 Aug 2025
 06:10:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Aug 2025 06:10:31 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Aug 2025 06:10:31 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808151822.536879-1-arnd@kernel.org>
Date: Mon, 11 Aug 2025 06:10:31 -0700
X-Gm-Features: Ac12FXxi-t7kK_6HIDwsxWJsHZcp5BcOM26Y8X32Zi2av6pcVu6UuipKim4OtEQ
Message-ID: <CAMRc=MeyW8gtG_hsLWytCpufQRmg3s5QZenxCvP3MNGmaoo2cA@mail.gmail.com>
Subject: Re: [PATCH 00/21] gpiolib: fence off legacy interfaces
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
	patches@opensource.cirrus.com, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-sound@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Aug 2025 17:17:44 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Commit 678bae2eaa81 ("gpiolib: make legacy interfaces optional") was
> merged for linux-6.17, so now it is possible to use the legacy interfaces
> conditionally and eventually have the support left out of the kernel
> whenever it is not needed.
>
> I created six patches to force-enable CONFIG_GPIOLIB_LEGACY on the
> few (mostly ancient) platforms that still require this, plus a set of
> patches to either add the corresponding Kconfig dependencies that make
> the device drivers conditional on that symbol, or change them to no
> longer require it.
>
> The final patch ends up turning the Kconfig symbol off by default,
> which of course depends on everything else getting merged first to avoid
> build errors.
>
> I would suggest that patches 1-20 can just get merged through the
> respective maintainer trees independently when they are deemed ready,
> and the final patch can wait another merge window.
>

Oh, not at all, I'm fine sending a second PR late into the merge window to
get that done in a single cycle.

Thanks for doing this, awesome work!

Bartosz
