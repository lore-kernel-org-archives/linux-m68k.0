Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A552C1DDF8
	for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 20:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716149385; cv=none; b=FAOiEYxxIH/qujT3q/Aryyc92QZlSLBA58l/xUX95kSMHMq50ytzZUqJ0VbsbKH8l50lcX8H4ds9LqFzBPB0XHsNnyBsKTK67vQrAsBx4msFbqEGsY2JtnTIV0YmSrr3zsjOboh0DRpntsnAQWyWFnZyT2HdWyxgv5e1mzbyckA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716149385; c=relaxed/simple;
	bh=iCiounYb2qM0frGZq6O1xMbmoLE/DaZQdZIhW6xU5is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4bjLFZ+uHaYnfVeTiybFKreN9fp6fxajsy7vfHvz7aZQxcmdFKi/5VQHF5/P8/WAi+xFGrrpO9JA9VPI5kS/2axrwsroPh7fRfpQ4YmrVmEipquBFaJNVCFKX9WXJLgzYedIiVunRLplmoqn0Lz/hTMthI5hbGr/Yvwv8ZBNZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-61bb219737dso19812347b3.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 13:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716149381; x=1716754181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qr08t9JmKkuXa7CNo0gms3HKY6UsdghjmyCBsfIDnbU=;
        b=pCI8sGV+ISSZolJAQV5ySNOg2pjziYh1Zi36uy/davY0oGpMIfwsvf9JfMLAsXxkd5
         BCIRuW+7gInOA1jQDl4ZoBv3iTnXApSuBYr95u8kBUAp6uJl5V+927jkarXe6CjDFkBA
         6YHFsSObhXhnXSKCJ7MQ/MFE/A9DC9bwRjn1obCABi2PKjyOp010BqVtMIQm4gJsMrTF
         /8A2wVz7qa3zYf2ZQ5vUftk7qCIz0XyuW3jz445HOSnbBwNry5rxzzOZ818R0dTCGCG5
         vScuSFix5xMMe6fgUCucEEjtgWYSBOhI45QhWSWhk5UGZwbHYwp7f2qgFszGnp0+loO1
         3rrw==
X-Forwarded-Encrypted: i=1; AJvYcCX5wMh2Q8Yj2xmAPRxZ2dz/Hqbw1ERoLWaaUqT1EF41dcMLK+nR5PpTZJfM3wVlfC0lTYsATy4h8W81o7VD3Lw9JV7rUlG/oyQ7ZwNorJs+
X-Gm-Message-State: AOJu0Yw3WXoQ7E3wU/AbOCxt54BnSy89IKlk4WHW/mnENzWEpx5n3E+m
	vwgJMKjQ1/qmZw07K8/EfjSW2OvQ7jrMXmkGVrgHkEclBk/C2F9uTbqxQhFl
X-Google-Smtp-Source: AGHT+IH3wkFaiH43xKZJVJtjDoIGe7IfvsUOH4SGlW6MyGh2oWHtZa073S18jUVwGyetMB1aEySAoA==
X-Received: by 2002:a05:690c:6407:b0:61a:e947:5518 with SMTP id 00721157ae682-622aff80725mr311698317b3.27.1716149381162;
        Sun, 19 May 2024 13:09:41 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e488e5csm46470217b3.104.2024.05.19.13.09.40
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 May 2024 13:09:40 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-61df496df01so9880047b3.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 13:09:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgfE3uh7T0HluMa+XZoRQ4mg6fl7ee0oBK2vxP4C4YuW2UF6B867O/LcJAZL5LyeVN7adYzp/+RfE0qlzhZGzri6fa68IB9FifQPZl6JU9
X-Received: by 2002:a05:690c:4382:b0:61b:8623:3718 with SMTP id
 00721157ae682-622affda7a7mr225137897b3.42.1716149379707; Sun, 19 May 2024
 13:09:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZkjwzVwYeQtyAPrL@amaterasu.local> <e9d97c04-73c2-e6dd-6d51-b9a4e3ef73b2@gmail.com>
 <CAMuHMdWL2S1OMS5ikKgQj2uohoiL6_a5FLwdCphUEBVtMOSFcA@mail.gmail.com> <6321b7d3-ee31-45eb-bb5f-28a2c74cb7fa@gmail.com>
In-Reply-To: <6321b7d3-ee31-45eb-bb5f-28a2c74cb7fa@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 19 May 2024 22:09:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWHQRGGeqVJ_DQEXP5ogRL=NqzStYQ92Tt8-TWw9ksTDA@mail.gmail.com>
Message-ID: <CAMuHMdWHQRGGeqVJ_DQEXP5ogRL=NqzStYQ92Tt8-TWw9ksTDA@mail.gmail.com>
Subject: Re: Amiga, serial and SYSRQ
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Paolo Pisati <p.pisati@gmail.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Sun, May 19, 2024 at 9:22=E2=80=AFPM Michael Schmitz <schmitzmic@gmail.c=
om> wrote:
> On 19/05/24 21:17, Geert Uytterhoeven wrote:
> > On Sun, May 19, 2024 at 9:37=E2=80=AFAM Michael Schmitz <schmitzmic@gma=
il.com> wrote:
> >> On a serial console, SysRq is BREAK:
> > s/serial console/virtual console/
> I meant to write 'serial console' there. You will note that I carefully
> avoided the topic of sysrq on the virtual consoles because I could find
> no information on the key combo,

Right, I got totally confused by your two lines starting with "On",
incorrectly assuming the first was for virtual consoles, and the second for
serial consoles...

> > Amiga keyboards do not have a SysRq key.  We used to implement it
> > using SHIFT+ALTGR+HELP in the old drivers/char/amikeyb.c, but that
> > feature was lost with the transition to drivers/input/keyboard/amikbd.c
>
> Thanks - same problem in atakbd.c. What key is 'KEY_102ND'? Does it even
> exists on our keyboards?

That is the keycode generated from raw Amiga keycode 0x30?
According to [1] it is present on some international layouts.

[1] https://wiki.amigaos.net/wiki/Keymap_Library#Keyboard_Layout

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
