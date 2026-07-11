Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FD53603C9
	for <linux-m68k@lists.linux-m68k.org>; Sat, 11 Jul 2026 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755268; cv=none; b=pfKo6um/rKk8hHrL6eAirU8ourMgi776MIzUJXUDRJbqhXSV0TaFvqAD1AevW640kg/FMSZa/ybWhOb+WXPBzernd1cR7QXYpOzWKdPTrbZ7MPkCzDGr1MOhuWFUktwh24XuRpxeH7qes588lfrtaNtARkp4ZYLu2vsAG88M1So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755268; c=relaxed/simple;
	bh=gUnPJvqa+6hCH/9HCtTO8STc6X6BWHZ70c5H6AKWsOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tYrLNKk/T4z785UMJLC/Idu5DHXo/5GlML9FO3vW7bbL0wjY3/k0M/ucM2Q/JhVkF15nIwcHvHQSbDzBOJbLgJChitjXILJ5X+JBJWNkB+rVTZz+AdRho7jLtwa12EUuUGMGqI4vDaYA22sXEyFWuQffgV9trJ0KzvsLenrSCtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnTsRKxl; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnTsRKxl"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c9bb9d2fbso9755701fa.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 11 Jul 2026 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783755265; x=1784360065; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBafLctpeA1AoyzErbEa9EGgxzwRbfKFWoPKc6c7bv4=;
        b=KnTsRKxlMXyRvN2+glZyNNlSbOupZy3G2JIUE7Od8QQ5h7imgdt0kKJlS+UA9MJF8k
         FSy+m+HFZjMqkXcyUkYPAAy93kF67ekxi308u1UYaO04cudCtQs7F3bZAdR3T0Hw6W/r
         n5B/SXhly2FQtrgLLZ4vfifk4OINcSYx0J+uoTAJ1FeHnoEHBsWJl3bzhgNvJeTb2kAd
         qM3rF4xKL6vGog6/ENhqDETSozwcs95907CSYxVEQkcxvhycQ0DWCfIj7zquAz2whJ9t
         1NuIvQwJ/drsTcAFPP2WY+sFNoI5Qaug69RTCTzkf0W2isY+pd8iTbuhEI6kWMk+XXwx
         CrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783755265; x=1784360065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBafLctpeA1AoyzErbEa9EGgxzwRbfKFWoPKc6c7bv4=;
        b=N+vkstErPfPKewrvy0Zn8NupWez65EDiaTsQpvwIsGcAsQiw5bicFX1SAtvFIZtCVa
         Kqu/tIMOlSGHzxB5HpFQUlhnmvAWs2+aQBFE5Vbk7XZCIQA2GMJTpmISUnCleQqrGctC
         5OwP/EuDzKOEedJJmWg7EPZaXmY/hCj2l9jsMtvSCcIyWaVD0if3hkdD+a3lRlcxAvVV
         NDDIm2Ccq2UlOTGSxm4Qd7UMArHrK5bbp/vOfgx3YLdf9ijiKqQ3ZK2UcNqa/rFKofKn
         XgJGbqGpbQeFQx5Rc4h0dqsfTP8NS0woYmJz9/wTU0hiwtgcB2wGEzgvH6yswt56B+hi
         79wA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/YFmkpmioQ6arHvlcLfzG7DUsio8qc+sFq9C+tL1TYUCO6LNoZ5Alp3aK4iB1dJBJ35Ac6C7uD/oq@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxqyfo34vRLhUPo4opU93aUpbYp0YXbcOF6yhQsSdQiavOxD9O7
	4NDcH+3f4mOZ+aytNKLb9wv56FS3XkZBNCcygMvgCp8vyuiJ6E2N286s
X-Gm-Gg: AfdE7cl2DWhgibBJ1qsx01S76CzWU7PCStV6BjfDLKyTRn2CJU97pqlOQjLF/ICEx0o
	OCU33v1sYyyHFV9/hU8FA6itnZ6iGyqm050NmHZCEb6hUZleChD6qVGuEvDt/LTZPTfbFeOIWtt
	SH0z+iEaxh4IrzRFUhchcJX7ZSON8Ls3Uo8D37XRcug61vOVXTRvGQMcvCKXZmPR2GWuYvMEpG9
	KZ8OUkjJy296T+6nEJlaa/uPDcAN0jM1kEU0dlIP9XDKPuPmMXn+x9J4nt5uNA/UK+HAF0CTx+c
	Vc5n8yjofgyHfx5hahIvWxtEdwTXZ5eRjKa2ryy7EP9cduKDv1xG+qZbM2gcbOyg188ZcOzb/N5
	01v/uBLr2PklzVaUNdFfUB6i6Ockndc2jCEEKxefYMEBVCYKmBod+Vhz8jOWRUdZweHmRhFveep
	NmKKq1IHw3XC8P5gi60xIUuvZ7pBX9BE7XwLFQSEFRA9HqGCXBgfgO3LdZzJ/xhSBioY5jJw==
X-Received: by 2002:a05:6512:3f8:b0:5ae:bf45:e3be with SMTP id 2adb3069b0e04-5b0236689cdmr321070e87.21.1783755264967;
        Sat, 11 Jul 2026 00:34:24 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:4322:18e2:4e2b:60a6:4ce2:33fb? ([2a00:1fa0:4322:18e2:4e2b:60a6:4ce2:33fb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9dd41sm1117527e87.48.2026.07.11.00.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 00:34:23 -0700 (PDT)
Message-ID: <de1d491e-159e-41c2-b145-4d09db091031@gmail.com>
Date: Sat, 11 Jul 2026 10:34:19 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] ASoC: replace linux/gpio.h inclusions
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260710211954.1373336-1-arnd@kernel.org>
 <20260710211954.1373336-7-arnd@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260710211954.1373336-7-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/11/26 12:19 AM, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h is going away,s o use linux/gpio/consumer.h instead.

   s/s o/ so/?

> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>[...]

MBR, Sergey

