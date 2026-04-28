Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9510947CC9C
	for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2026 16:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392388; cv=none; b=d7Rl7uaiAFkpNydHjVdOBTRAiMwQbQDv/O25kAQoYvw78oBmU3XJbVRqjzupn11AADbQXATRMfBtjga3YkspciEX+qdelywGZ2PPF2jHchd3/I+XdJcnLKEmsvwRo/3+Cenccl0yglbGxOmXanHsVhDPu+VcaQLQVRa4wd/CUI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392388; c=relaxed/simple;
	bh=u44CNsq+HsXNvoQ7TTz+Rln6IYTiPOUNWXBwk3PI8Dw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pn3sy5ytz53KLMTsXobHR/Fe1py1zR9pK9Tt4OBXvMpSYh6FhmRK9jTot1GY7MT4wUKYQ2f+udPSxi3K2EfWDM5rTMPyxDviYWmZZDaSMP71T+2dF2jk2dnTaGCPAVq4+DiagvB3g6SefNc3JGdjNDgJfRsZrQPbqSZUmoTYDjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56eee0ba462so7054499e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2026 09:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777392384; x=1777997184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vDFH3Rke6oTAGwGvqkoH6zWo9F4usIGXnZ74R1IDuY=;
        b=cT60r6i9XZ1WcTkJBca4SIgpD6PEcRrcsB4JvwRGIluqP4uWg2/2t4pcLnYvfjKXBQ
         +jmlKJO0x9TS5Ja1b7FmSVWlk1jxwqZ/KgRNJZWM1PHo64lvUQG11/QgYioHx1GpEfv1
         raKk+fzfEVGU5tJQCiRtZvocNymXyLondk7v3+9L+B++dupnFnZgKV5/bc52RDmOZJfi
         WPbBnvZ6hSWjFMPAqsV2gT0crZu8JPsq7NQ5BqInDQSNtawN/Xoi57VQJG2Ml82TCsrb
         h8GCHPRAhaykStWzQaSyYIB8BGVRWlYYN7GNILUZh2URkgTmpAUE+Z5Ad8XKoVjapQa6
         2MsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Yb/yzm11GUuzSHFrn3dZwFTdji3OFTccQjVmiyuWAaDiDGFh5Z9hUOiqekLGB0GJ66vtTNAHTVeQJ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyPoMtu1qs1YFu4zvEgewpQQci5GQvOgZMX4dzSmKri2hKMP5U8
	VuFetB6HkqXcNhTGN3bw7KJOSobPhrtz+BXq5QpnZwOLSs+OFkUla9aIa2Pbvz1jK1s=
X-Gm-Gg: AeBDieulmes9gqCvOsNi6LFFZ64Afk318YKN9Msi3T6zJF+CoCGa8hMROKDYDqMm56+
	4UWYr6J3Ya3l6pA5mDTwpteeFYujKMmmyBxOoL82vtDYe6iTdKIoFfl6DEy+3DexAswBWoHsdj2
	rSu+2HEOZDNsheFkXkncMTuwPa39GFVBMpz2LhVmGsl6qwGGPKReVMBoCPMj2kSJR3FX81MfG7X
	95PBdL4khpWyK9FPhC+0Vmmi+jyzwPxKmctHIIR6xzMaw80UbJv+Rpc0TNrcOkD23XsGz17siX8
	pfxPcUp5mXygcizl78z3g1zB5plL0u6x1XQ7g0BymU7RQT5mmkmXUigjYF3xVXJVQuVMlwI4f1R
	g/+t2Xuih3W8Eljp5udQObJCtkbYdW7rGANVQVs73UIfvH5glkjXZE6ltmI/E1R+0maAAW9MCpg
	ZhZnLR5vyAuLg+cNhJ+tLXEdRizMZMQ4ZmEdULXpXiQ/rb+prX3rQMMSYdcZaH0IUDf31TKaI=
X-Received: by 2002:a05:6122:da7:b0:56d:3451:4cc0 with SMTP id 71dfb90a1353d-573a5af424amr1443336e0c.7.1777392384266;
        Tue, 28 Apr 2026 09:06:24 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573a433630fsm1859436e0c.2.2026.04.28.09.06.23
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:06:23 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6058a955e04so7445857137.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2026 09:06:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/+HKUvd403wNJmW90vqTES5+vG1iTWGn/USCOEJ6YNBXOZZM9+hWWASTvfWIzaXdge4SuNJrIEBpgO@lists.linux-m68k.org
X-Received: by 2002:a05:6102:809a:b0:602:8894:b76c with SMTP id
 ada2fe7eead31-628060be74dmr1337471137.5.1777392383058; Tue, 28 Apr 2026
 09:06:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428155729.3278685-1-arnd@kernel.org>
In-Reply-To: <20260428155729.3278685-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 18:06:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVgMtps2gAsx1RQ3Q8NkdqyzNuPTNeqHVC-EwJM3HK3Bw@mail.gmail.com>
X-Gm-Features: AVHnY4IdeIt9o9au0VQBhgu5jxODDXjwiJHrzOv1nNKAkPpgLmOAPuG60I0oOJ0
Message-ID: <CAMuHMdVgMtps2gAsx1RQ3Q8NkdqyzNuPTNeqHVC-EwJM3HK3Bw@mail.gmail.com>
Subject: Re: [PATCH] m68k: coldfire: select legacy gpiolib interface for mcfqspi
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

CC Greg

On Tue, 28 Apr 2026 at 17:57, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The common coldfire code uses the old GPIO number based interfaces for
> at least the QSPI chipselect lines. Select the required Kconfig symbol
> to keep it building when that becomes optional.
>
> Apparently there are no devices attached to a QSPI controller in any of
> the coldfire boards, so this is not actually used in upstream kernels.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/m68k/Kconfig.cpu | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index c9a7e602d8a4..148f8a79d206 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -30,6 +30,7 @@ config COLDFIRE
>         select CPU_HAS_NO_MULDIV64
>         select GENERIC_CSUM
>         select GPIOLIB
> +       select GPIOLIB_LEGACY if SPI_COLDFIRE_QSPI
>         select HAVE_LEGACY_CLK
>         select HAVE_PAGE_SIZE_8KB if !MMU
>
> --
> 2.39.5
