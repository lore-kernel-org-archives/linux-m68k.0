Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916032D0603
	for <linux-m68k@lists.linux-m68k.org>; Sat, 11 Jul 2026 04:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783745379; cv=none; b=SgvB95Ymzjppv3jvKcUk68TlPbmktLxBlMaeVATW0wZteuypVWmcTpICbxBc/tuenxD9HmKlxP/OXoffXB/IbsqPFo+km8G1rT/JfixHq/nW5A2ycstq2l0kr3YNIi3nRTez2qlsE23NUbuKReyTEKval0DEWzkPK1ePlVSD3ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783745379; c=relaxed/simple;
	bh=S7g5HdrobVHgSI3y7yFITx6ZdgODEA0xXX0TnH33v6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKo/vA+6WTstE+vnzUghLcHTXcTXYPCwwhPESQfaHLcPen3oPqXkgxENGG2qu+1Vmncv1lT3rOYUltgW7PEJBuH627upHnWElzaiC1hkE6xPhMPEeemXh3hytACfwoIFsIoLiCH2BPuBLV2KZb53nvnOG3DtHtv7KcIsompaZ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8ejST+q; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8ejST+q"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc61541f8cso33046995ad.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jul 2026 21:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783745377; x=1784350177; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qesMdHKmyxw3NJ4a67qnIHpz73OEBeBHn6uWkzO1uyM=;
        b=m8ejST+qUFfa8WFFkQhxITBgt7Css2U8NjAvvpc5OIS3u9ZVUxJyu1CXBjNYeKPPEH
         J7oiu+AKT1cwXCBo8o5TMMHPwpYyM/atyMj7RBhqqEj86pkCaN6kRzED3OoYjIM70e7y
         Tnzx600ogRJJr4bNAgbxMTXkTaEyDoIkDWyd3uXAuK26jsluhYwq3LRea0YnvOMnLIV0
         2urUmuZ4bRFXxgtqD6KavaH1SukxBUsgL7W5qfo7DTPCrU9ZYRCHfluBp8tlVpMuIeEw
         ZN6RSH55kXMQiaKCLLrFSAzNkz6rXAyNkN6vsMDOMevY2LDwVXUKrinVRKk25nH5dxyT
         xIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783745377; x=1784350177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qesMdHKmyxw3NJ4a67qnIHpz73OEBeBHn6uWkzO1uyM=;
        b=b8tAE5vU/aAR0zTx2HbM+G57PEmyFONbCJPNHyNyLFZfMMQcgloIPMPbv+opbTUQM3
         qsTeY+lMtGWMxAUU1kTY+S9pT4IE0QfP6nquOFePSBtQUrQ6WBzFgci/HhtlcKMS1UTF
         TAXDWoOwEdddpXjmMLoFBK8XX1pUjLHzihPJh3lMR3jhRGiQi3UXeH87GJhcdxrJdCXx
         4HBGW7kSX59oqCGWO7LViPbHqEGT9VE+TldCTxq6Mw2gNg4LCss5DawZM4LJX6/Gc9G4
         cdINT/siA5crqXA8uscuKqMSuGSwWXh3RREm2UDRChZQU07xM2cMHwGObhNHw9RMJ7vg
         RwDg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4bez/g6iu2Jocp6Lpm8tHujyu3GiDQdzxFybHKwZ7fjexLIfdgpFUXqT6kX8yO810RK4ZZ83vlmq+@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwzVl5536XFyFc8YSAQblGcLizjaTDo5/fVNn0kvfys6RAfXnlK
	pN+GrpagxiwmtM8FSvyoUmFxApmV8OySKSibUtkFKns0MaTNzTNgZxab
X-Gm-Gg: AfdE7clz06+tPckvCNV3r59KRdDKS787j0E4u9FckpUpExYW2BWHqAnbhcvcF4inaQ6
	76Rf7s6+LQvV43uDJuW93+9RD/EiOV06uQilqqW4Uvcgji3kkjrPaMkeQ3vMoHBHx3JzzvHE4Y2
	aUgIoerCSrO9h7L1siF8I5Qtg7/LgdG3e95+/vSc8U72i1CaY5c9bl+OY43MUlhLJ/7gCU6Z1gK
	yQCR45tfY1Z3WkiCm+dkW8MQRKFk80WT11CDDEytD6nwFjr6ydClJ3z+pQYTgaUA3n1zuDCqnVQ
	fHlfUTasgB2F6tRdlExcEg2mzzJc7MqpT0LAfLZZQ2LooZd2zzi3Vl6T2Uy0PQcwMaKI0CYgebL
	pmoMqGIKFqho8c5c60wo4Zd1y935bYMB/owKtF5KgxhAnQix5X4yj6wUICbQwdBVBdAQ/6AAKnC
	NNliNkTk+o9NTqnGpfH+2xQrYJE1Es5QIzS4RxczT/0GB/TdJNuX2D8g==
X-Received: by 2002:a05:6a20:734f:b0:3bf:6763:f0d0 with SMTP id adf61e73a8af0-3c0f085657fmr7458822637.4.1783745377459;
        Fri, 10 Jul 2026 21:49:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d42f:71b6:335c:aceb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm25970082eec.22.2026.07.10.21.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 21:49:36 -0700 (PDT)
Date: Fri, 10 Jul 2026 21:49:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dominik Brodowski <linux@dominikbrodowski.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 09/10] Input: matrix_keyboard - replace linux/gpio.h
 inclusion
Message-ID: <alHLK4O77khiKwtW@google.com>
References: <20260710211954.1373336-1-arnd@kernel.org>
 <20260710211954.1373336-10-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710211954.1373336-10-arnd@kernel.org>

On Fri, Jul 10, 2026 at 11:19:54PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h is going away, so remove that since the driver already
> includes linux/gpio/consumer.h.
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Adjusted the subject (s/replace/remove) and applied, thank you.

Thanks.

-- 
Dmitry
