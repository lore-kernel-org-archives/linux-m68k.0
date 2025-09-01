Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF761E3DF8
	for <linux-m68k@lists.linux-m68k.org>; Mon,  1 Sep 2025 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756716798; cv=none; b=N8F1381eW3lrAlBFbacSsS7/9kf3SAD6zbneGjFTpWt5IfptIME366jhDIG0vzWXskyUuDfi53whZ6x8fPfeXqFaK5Hc5Owjyize0iXchnWSNqkwJxHPG5gGE6g4ACqo+YiZwKCqQKYUTYsqs0a1AwbUUQB0ZLj99jdZ/N4zzvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756716798; c=relaxed/simple;
	bh=xkcIUqU1NHV0DJZXrd/onXacp9Mgwv91i/+bnnqT08M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DCHvAD9KNkNgmGUsAGSW6D5XKGfT18je24qTHN4+Jr6bFq+JOifE9W6U1M44O9vMzPKEdxWnL4UcNfhsuqSBk821O9gGVPal6gr0waHot47ianACY90WhohOnGbzdGryj2ETdn19NnK+amzPE2wIpZlQVr2Z7nfvR6BNfSFQZUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5255c24a07aso1480077137.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 Sep 2025 01:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756716795; x=1757321595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwV0ZxFlGA9LVCwpYAd/S0jSR5rIjW8cIxXeVwnFYUM=;
        b=ME4GLeIqZn1pbxQRU+XcabqeVxqZwWRWXvi+GeYDbJj21R4SX/z/FtWXjYT6kN8xxg
         WntN1o8Oi2smCu8PuHvIgN2S+bNsWqAEIj611c0+uzENdvqOD+/XKwiuv1cLqs8LLVu6
         nHVRJwWTfRmm4jKt4EbYyfGypTRfNmnPbUYQvyzPm2lflDPEAotSjEPq1Hu3kGU0IZ4S
         +nkPTB1LYP8ZAbFiObn4tF8YoaUKed+9XmSQMVYzcGD+eatc9NQbmRPuBmVAnkZk/65t
         Yw9EngwNAxDsMO9WpBSiFZK37Z+Kww+Vx/YxeZ4YPnDXXe/jGfFEUdiPdPDvdP920Lu3
         8ZXw==
X-Forwarded-Encrypted: i=1; AJvYcCWk94HEUbO1Uss5XOhKQg+vYnW6Or2Ndkd8IWevnP5H8wEDXBfj79SBUQSlNzhRhKU5LbBSOv0tpxqe@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yyk+rOrbRvWa5dQYJKkkZpTfvz1GJNFgtG0rl4jz9U1QfRhQiCf
	GdjfTgiwS1spJjL1oD4mr0PAHZxhJl9LkJSLDDdaZl9Gg7Q3yNjiCHXB5D1cSxeW
X-Gm-Gg: ASbGncvhilGVjkBt7tYBphgMgchCHhP7CFJZFV5TraMVQrS1i44G5hpFyts0M4eGGEq
	PNIYJmI1zJ9AHoMPPjR6tnFjnne6sbX1lxcBDR+8BwafQbbCemkkqGoK2a2oI3B8/LFwe0h0C0K
	OCm12k9W/GdzAE3ag22jXZQa1/XusyLhRokHWWaGTuSAuxUOw0d11AkPzdmHqEOnLi031dBcLIS
	nphillwIaZngTL4rS7fKxHm2fbjtlAhXItHwboJS8ZAZjBEYqZmceL18QIzOFioZ1gnlALWU+if
	YV7j7wQaYYw9Av55tydDNKzoHPXU3EhLgwUOCxQPPNYe4nLFA940JfP9qjvYJACkBKSIGRwoOnh
	7qooEuguS12xwFYAb3IyRTqH7WiRht1OaGrvmT7pQmXuqPDQl3NY8GcViaUc+
X-Google-Smtp-Source: AGHT+IHwNl8ZvMAq9t0jpgkmngmO3UuPtVfkEJNFCrzt7AJ94LPb70XfZOFi+yTtK4Gere3KHdAr3g==
X-Received: by 2002:a05:6102:d93:b0:518:9c6a:2c01 with SMTP id ada2fe7eead31-52b1c343a5emr1748585137.28.1756716795440;
        Mon, 01 Sep 2025 01:53:15 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8943bb744fasm3477989241.15.2025.09.01.01.53.14
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:53:15 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-89019079fbeso961034241.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 Sep 2025 01:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZrVPUIAX+UaEC+GS4j+5orYigt6Ry4RtMkxmxVK1Ed2SBNxrOPucIqxUq9c1AW//BJWK99OeCS88t@lists.linux-m68k.org
X-Received: by 2002:a05:6102:6889:b0:52a:4268:7618 with SMTP id
 ada2fe7eead31-52b1c246f01mr1657627137.27.1756716794630; Mon, 01 Sep 2025
 01:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822104208.751191-1-jirislaby@kernel.org>
In-Reply-To: <20250822104208.751191-1-jirislaby@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 10:53:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7e-QOjoWqsccvyBLOeoGgeLrE3ERuHv_o3PXBtKAoRg@mail.gmail.com>
X-Gm-Features: Ac12FXws79G7sfNDXlYCwBsnRL2gsroj-XTL_Qr7goYhu25uBKLks1ZnLnPmw9c
Message-ID: <CAMuHMdW7e-QOjoWqsccvyBLOeoGgeLrE3ERuHv_o3PXBtKAoRg@mail.gmail.com>
Subject: Re: [PATCH] m68k: make HPDCA and HPAPCI bools
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, Philip Blundell <philb@gnu.org>
Content-Type: text/plain; charset="UTF-8"

CC PhilB

On Fri, 22 Aug 2025 at 12:42, Jiri Slaby (SUSE) <jirislaby@kernel.org> wrote:
> The only user -- 8250_hp300 -- tests for CONFIG_HPDCA and CONFIG_HPAPCI.
> It does not test for *_MODULE variants. That means that if someone sets
> the configs to =m, the code is not compiled at all.
>
> There is actually no point having these as tristate. Switch them to
> bool.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> ---
>  arch/m68k/Kconfig.devices | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/m68k/Kconfig.devices b/arch/m68k/Kconfig.devices
> index e6e3efac1840..e277f1bd2de1 100644
> --- a/arch/m68k/Kconfig.devices
> +++ b/arch/m68k/Kconfig.devices
> @@ -105,14 +105,14 @@ config AMIGA_BUILTIN_SERIAL
>           To compile this driver as a module, choose M here.
>
>  config HPDCA
> -       tristate "HP DCA serial support"
> +       bool "HP DCA serial support"
>         depends on DIO && SERIAL_8250
>         help
>           If you want to use the internal "DCA" serial ports on an HP300
>           machine, say Y here.
>
>  config HPAPCI
> -       tristate "HP APCI serial support"
> +       bool "HP APCI serial support"
>         depends on HP300 && SERIAL_8250
>         help
>           If you want to use the internal "APCI" serial ports on an HP400
> --
> 2.51.0
