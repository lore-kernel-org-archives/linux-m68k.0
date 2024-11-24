Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304EB1F95A
	for <linux-m68k@lists.linux-m68k.org>; Sun, 24 Nov 2024 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732441365; cv=none; b=ZiKVh8sxrBQnfxFjgCipG2EFciKxwOxq+EZNB96HyLTtPpmHJwE3bF2MauklZN4jSLx4OeJbPa6CaN7xl8RMe/6I/iHXYcRvvMgzkMON8AgjBLwspsxWf+NeoqvLc+BxHBVPMSMzSWPc8J5SQbL+mjsd56SdmBYuN4IeMOeMwRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732441365; c=relaxed/simple;
	bh=czEKvwebo6N0ybZpopI8XXJ6AJO1Z1m1j7/C9FhcEzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTmvUplcBlwR2rM5m2Kt2mpftah5Mi1YDfpHMD3xdzRHNi89JAZmCLz6URVYAPV8X/+9id0jfRvzoB6lncUYY4X3C0Tn6E9jZFPFRgzcnuF78NYGL+Y6apw39XHhFU48WqwblnCLPmyitVqWRHQfOJ5YX9CJ11OEhGW77FRhVT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea339a41f1so30758167b3.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 24 Nov 2024 01:42:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732441361; x=1733046161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aw291P4QQp2xc52w4erCu+NMtXgYhXO+meOEucMjW4Q=;
        b=UnoefYQeXXbvLcmyQFjwScAQLWH2lcIH8b5Ie1ZEZpijCoDRqo6A2NT9AgS336UCp9
         F6/yDS76yGSfC3oQEaxy6ga7ls7QD6qFT3V2ewp3P5oojkMcXfcuMR1MiMFLmIXKtRm6
         8rTKbjeY7EOVVcvq3ZNh6t3P2svbJFgsyxDm15LkpE7R2Nq5inWAKT13zHBlLrAtFb1N
         M0E26bcSu9xt4alCb7PUC0ovC1fmoUO+9Jr4tww7DY6ORj4VR9EkIHawaPYyRpy2l+OU
         XfupyfMJlJYnKWtc5lPon5avDWIGmbDANJf596YwtHQ+DJS9ieslT7aqNVd8vL7SvzJa
         n9Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVbq9yAwb+7kltfXiZjpyJWVbPZXPOpZ1+LDKttp7U92PP8qGbOmjCYbneLm1uFNyMnttM4SWc4Dwp7@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyVX5EbjUMGn0UjyNvAlBdsDuAQ0z2n6sKYvBO/29ygUlo1En5z
	54AVUGyuVuEXtmT7GZQ8Q+2UsUD7prQjHZlQlyRKXMQ1RI3A22xjrDjs1fQ7
X-Gm-Gg: ASbGncsXw7BrFpd/gWyhC9jZ3aTMNLUgyftH+XtkSjZjhEaUBa+BiL2XHP8waMm/Ipb
	G8pBIQ5BllbkDQwMCYp2BoV4XVPdveI69e6ylhMXjn50ftuJ1BWH0mvVbwy7p6GvvmPiCdgBcej
	D1BnDjphDJxPGIdqod/42cjHCJ9WtEwCqa5qVf/KYqKtMsPW2A0wSqhbxbcUmjqwXjv6xSHDLTq
	7FYBGY0ZOOeL/Rl0DdEJDO9yvC4K/DEzWArR5khQusgoLaZgcXD5RlpOihh6ZwcJkIe2ohOWuaI
	w9hVsDGxCq7i6L8k
X-Google-Smtp-Source: AGHT+IFadTTlO/j28/BmgQTiZCn72l7zc+lgNzV2vrn9gvf+QYEwBj1QccvQAbX7FLyiuMyf3VDj2A==
X-Received: by 2002:a05:690c:338c:b0:6ec:b74d:a013 with SMTP id 00721157ae682-6eee08b7ef8mr88650747b3.19.1732441361404;
        Sun, 24 Nov 2024 01:42:41 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe2a484sm12516157b3.39.2024.11.24.01.42.40
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Nov 2024 01:42:40 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6eeba477fcaso36834097b3.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 24 Nov 2024 01:42:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXky2QQ1HFwTt/EEo7JYTes0RaGxgSS2kDTHWBIB90GpzgQ325/yXjYTpC1D5L3zAAV6Q6sA47jzGy@lists.linux-m68k.org
X-Received: by 2002:a05:690c:881:b0:6ee:b38c:b6e1 with SMTP id
 00721157ae682-6eee089e833mr98777127b3.14.1732441359840; Sun, 24 Nov 2024
 01:42:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1731450735.git.fthain@linux-m68k.org> <19a16bcc94c42ea9c5397b37b1918c2937e3faab.1731450735.git.fthain@linux-m68k.org>
 <CAMuHMdVuv7wRud4jNt=t4Ac_s4ze6YYguUKLRt0hQ4gTqEWpEg@mail.gmail.com> <20241122230329128df024@mail.local>
In-Reply-To: <20241122230329128df024@mail.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 24 Nov 2024 10:42:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjTgssYR0RAsxpejRcUnPb7biT0kuq+Xc5T2TcPsahiw@mail.gmail.com>
Message-ID: <CAMuHMdVjTgssYR0RAsxpejRcUnPb7biT0kuq+Xc5T2TcPsahiw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform driver
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Finn Thain <fthain@linux-m68k.org>, Daniel Palmer <daniel@0x0f.com>, 
	Michael Pavone <pavone@retrodev.com>, linux-m68k@lists.linux-m68k.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Sat, Nov 23, 2024 at 12:03=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 22/11/2024 15:44:33+0100, Geert Uytterhoeven wrote:
> > On Tue, Nov 12, 2024 at 11:51=E2=80=AFPM Finn Thain <fthain@linux-m68k.=
org> wrote:
> > > Both mvme147 and mvme16x platforms have their own RTC driver
> > > implementations that duplicate functionality provided by the rtc-m48t=
59
> > > driver. Adopt the rtc-m48t59 driver and remove the other ones.
> > >
> > > Tested-by: Daniel Palmer <daniel@0x0f.com>
> > > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > > This patch depends upon the m48t59 driver changes in the preceding pa=
tch.
> > >
> > > Changed since v1:
> > >  - Initialize yy_offset in struct m48t59_plat_data.
> > >
> > > Changed Since v3:
> > >  - Re-ordered defconfig symbols.
> > >  - Added reviewed-by tag from arch maintainer.
> >
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > so it still can make it into v6.13-rc1 via RTC?
>
> It is now applied, it is going to conflict with your tree as it didn't
> cleanly apply. I don't think this is going to cause issues but I'll let
> it sit in linux-next for a few days before sending to Linus.

Thanks! It indeed conflicts with what I sent to Linus, and thus with
Linus' current tree, due to nearby changes. If you think the conflict
is too serious, feel free to drop the commit, and I'll pick it up
for v6.14-rc1.

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
