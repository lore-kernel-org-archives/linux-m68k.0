Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E14C16D30B
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Nov 2024 11:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805380; cv=none; b=shk8r91FMdqtUVo4P/pMYFzGyXK4Hieqqhe2ykfVuC9H/JyVYqCabr3oJUCom//+GX88NzdGyXXgAJ1NU7sgryWVa0RWaDNQiOwtSm47gsb2CnkwUEkGy5OZaJWUl8FKphgEBQ+xreFDadywLlosVCIHrxfR3HYra8IfxrchE6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805380; c=relaxed/simple;
	bh=RQPh1D947TKzLE1f4ASFKIoCc3le035rVvblBWeTovs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDn0QcAbSq7K4T2xTOoh5HsKcIo2cVvkC3mw0bqA8Hp+FfC9WLYfvx0KTUosJzJUjOL1brGtYVshRy5+iCJoxXAOBDOCgE20miePYtoW7/xhOJs2+W+JXqpA0r1+dD0GcNVjlkEPpswMNSvtH6dF3CCjL5GB6QAEpb0SHmNH+gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e291cbbf05bso5072189276.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 03:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730805377; x=1731410177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3/fy7sgqquY1ABbaxJy+CpHhoUy/FOlWc4sY7atYCE=;
        b=NgfOrsakb3hR9Aov0XqVb+gmzC719ttCF55gbgAdCZlSBT9r/3BPeHZTzOHg3FXSZn
         03KG46AViD6pXX5znqsYOFuYRexZ0W83jzYF5Ko6VVomkviye9eRlacsfHz4bw5L64I3
         J5Txjbd5z6L+J5fv25HjhmRVl2vGdT9nmmwFbYh1QCu4Xiq7OgnhC7U29ATz1xUZNpFL
         kXETWWVjkkaB4iugka5YpzTp75VJHqp9l3jmuHO8Bb3PjtJ3+92NVWA6gxpOsJI12v9P
         mo80CN5nkF0645qjvrRSF5AVZQf2HwHvfWmEYHQsW4G2sl8TJ6FtqfY7Uchp5bQ8R971
         3lZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmK4WalLFW+hu3BKDLUviyXXchQRfagCEY4xH5MSI+miHsg/3cIo7G0Y8bjtOVIKirFo7t8ly2bx0A@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxF2syyONpj/uCFkjh9ZJHiGcMKIzrgqSSe25oULW8XSNxN4ZlC
	Ja94NAZDhzXScMk/7ncIrngWW3wGY3UowgHRQB/rdfeF7JXrM6LmS/t3DQ0L
X-Google-Smtp-Source: AGHT+IEIKr4TYX1FGmRTDwI2Z1Fd7XI2P/S4GwP57LH4uuaadJd6PAJbfBE2+FAbhhhtwULF5/SxKA==
X-Received: by 2002:a05:690c:ec3:b0:6e2:413:f19 with SMTP id 00721157ae682-6ea524dd2cbmr195610907b3.27.1730805376850;
        Tue, 05 Nov 2024 03:16:16 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c85514sm21780887b3.117.2024.11.05.03.16.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 03:16:16 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e291cbbf05bso5072147276.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 03:16:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkzegI4VYoYvHiKMy7ZYaoMfmdT80Gm4RoJ6jzmRCk8Y+WvfiwHIPtup3bJaQ4NLMEanTwRyKsaTZB@lists.linux-m68k.org
X-Received: by 2002:a05:690c:3512:b0:6b3:a6ff:7676 with SMTP id
 00721157ae682-6ea523295b1mr189170117b3.3.1730805375773; Tue, 05 Nov 2024
 03:16:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030195638.22542-1-arnd@kernel.org> <20241030195638.22542-2-arnd@kernel.org>
In-Reply-To: <20241030195638.22542-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Nov 2024 12:16:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1Z7QoZa4RtAMzQaM+WZ=JtrEGPpHvfuOb3YVm8m2K+w@mail.gmail.com>
Message-ID: <CAMuHMdW1Z7QoZa4RtAMzQaM+WZ=JtrEGPpHvfuOb3YVm8m2K+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k: select 68020 as fallback for classic
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 8:57=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Building without a CPU selected does not work.
>
> Change the Kconfig logic slightly to make sure we always pick
> 68020 if nothing else is enabled. There are still some
> intentional warnings for builds with all platforms disabled.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.13.

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
