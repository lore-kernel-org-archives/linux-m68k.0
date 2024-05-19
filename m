Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008AB48CDD
	for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 14:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716130714; cv=none; b=JMAO9DDrqS9Gsmqfvk9i9R9Db7KkSjPZDczacjONIQ01EpjC/VuX+ja6wcmo+r+vYBp8/sHSMo+nHCwNcADCAKkTi7fPtx2LSg9RFHnECQUKuYsER4wFyT96BfR4srmwZXjOpfU+e9RM89BP6oXuxnZEpRm1qQegH6UDIpKgm9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716130714; c=relaxed/simple;
	bh=Uqqcnkn32T30IZXt8e61+Jq6ia3suFI6IyQbBwjRk+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cu7ReafSkUfO0x+l+g3V+CeL4orkkJnXslsAN7w2k7AMhXkZt60UqN41YDRVZOiN2t1VOFAXc2EzCOiX7tsHumN8epbWxZn5RBIWUXYIlR9idzV0osNKXgiFZBc5D+1fWwPQaExz8QEqnBTFdZlwYgPDWOUe9N3K6nsstcYdoxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-61af74a010aso16826827b3.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 07:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716130710; x=1716735510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ieRUP+dmXOSsklxsuERBBFiv8i4qYadO5HezdI4kQ4=;
        b=KcLA5USapGHvlxOkw47JzPYjCS4yKL5B/9fJJSi0aLC/PbpRYiJZIJSnADFCRVpgkq
         yiTOX0BRKmbcxOLmvV66T5cP87S4aMJqRGZb+W9e38fwymTGNl05MxqmYrA3iZ6vP9Y7
         XK/ChF1d5gcLnpAGWCLOU7XXGxnbyCj7MhnfgmEpaUv2iIpfWDyQGxSSKg4N7/UndgAf
         76nntKeo/RWMHAzavAw8qgkRHoEWPqcDjss2ewd6wrbN8TPCo5BLPTiPKEoq84VokRIO
         gk1nNK1mrYBiQXkuhV3Z/cUtrhIqVgnu8+51RYG2OzNDqMRWlCoGLn8mivvM2VWRgkzz
         R4Kg==
X-Gm-Message-State: AOJu0Yz3KCRAYJNi6BpXeqtBpuLhh2GEkiTVYZgAA20ktAMKtH6kPgHo
	+0bMA4pD4cKIE9yG3GhcCTn+MWrX7ksVwfOx+SlM2Cdwxb9O+ACRRlP1shVS
X-Google-Smtp-Source: AGHT+IFgr6Tq/i+B3dPmK0cMW7/KiASyqcSDwr16VPmHXaC7zdFyB6OzN/zzv0HQC11aKrqxuBFS7A==
X-Received: by 2002:a05:690c:b1b:b0:61b:e62e:8fad with SMTP id 00721157ae682-622affb59b1mr309910257b3.21.1716130710394;
        Sun, 19 May 2024 07:58:30 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e3793b0sm45747257b3.109.2024.05.19.07.58.30
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 May 2024 07:58:30 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dee52317cbdso1584850276.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 07:58:30 -0700 (PDT)
X-Received: by 2002:a25:8c09:0:b0:df4:9a10:4e12 with SMTP id
 3f1490d57ef6-df49a104fcdmr2333622276.57.1716130709865; Sun, 19 May 2024
 07:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZkjwzVwYeQtyAPrL@amaterasu.local>
In-Reply-To: <ZkjwzVwYeQtyAPrL@amaterasu.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 19 May 2024 16:58:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnsXk+MuGUCnPcQVbOdSGJAHiK6TBZE2r5_h15qs_azg@mail.gmail.com>
Message-ID: <CAMuHMdXnsXk+MuGUCnPcQVbOdSGJAHiK6TBZE2r5_h15qs_azg@mail.gmail.com>
Subject: Re: Amiga, serial and SYSRQ
To: Paolo Pisati <p.pisati@gmail.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Sat, May 18, 2024 at 8:17=E2=80=AFPM Paolo Pisati <p.pisati@gmail.com> w=
rote:
> Some context: i'm trying to collect a backtrace from my Amiga 1200 + Warp
> 1260[1] + flicker fixer that refuses to boot and shows a solid grey scree=
n.

> I've added some printk around init/main.c::start_kernel() and it *appears=
* to be
> hanging in "local_irq_enable();".

Doh, I missed this part. So it never gets to initcall_debug.

Probably some of the Warp 1260 on-board hardware has its interrupt line
asserted, causing an interrupt storm when Linux enables interrupts.
Amiboot knows how to reset several boards to prevent this, but it
doesn't support Warp 1260 yet.

https://github.com/geertu/m68kboot/blob/master/common/amiga/linuxboot.c#L19=
5

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
