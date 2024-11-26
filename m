Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6AF3398E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Nov 2024 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732630637; cv=none; b=GYVop6L0DopDwPkpgsIokHeLtXxjeDI7nJ55nmCu38ojerbfqChKWtYkLnkd/nvZXibWNvvY9KtxHnfmdIacpjmQ5rJdxJyDQVVyB/M7TfdoG9OCKb6KHlBvrSfdJk3341MxENwShUX/WWcSCVIGC0JBX+I5DbVF5jm1cSXX7To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732630637; c=relaxed/simple;
	bh=Af8h1x2GkRXVSShLvaf0DhS8aMbO/cKYrKI0lw1igO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AfiHu9MEBeF6AvEU7JD3GgxWn8HRT+rwQ36jN+MWriQbUGb6Ml1HVTClXgwyVttd9Bb2ysSVXCtSqWsnTLysgqAttYETSC97WgEc3KzJHLxcZWxm5mECZyl10dc8SOcCmvsmWvUaM471g9hIE59lV1POw1OCce3mLI2jP14aV6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ef15421050so22303977b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Nov 2024 06:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732630634; x=1733235434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMlKAosx+8F5oQA944QEaviPdmzNr2nURUNr2vUH2Fg=;
        b=wAL7unYE0r+Hs6ixysGsv+tQtnNPAC6Sclo9+SNZCOkGGfrxGC5e443epTnaYFPCr5
         nKFEov/tgU/w7MsmMui/XOxTojIfZewNa8gOI0QxT+/uiK2DTZNWpLYdD3w4AjGkucoi
         m0JYKgLGw96J0vF6HDJFHXIn+jVmCDvdrtINoX+yA/bx7FvTGpFztXt+qlGWNwP7yLir
         UFp6n+muhWzBuu+XJh6LHqwo/2dyCPOPjMdEK1eXYSw7gy0z9f77u56ya/KceJQI3Wpz
         o6FW1INjMRlp6ffoQtoKQUDNE8Zk+2GY9BY1VXFXLLkeQYJEUUMk0UeTT4iybE8C1tS6
         lHJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbRkyPImfcRzoeYMHfvEOElxpFA9T4IPH8/pi4kuREJ3VMGHPWP8cGiuK51BfFMYbcfdpHI4Nvkx7B@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzbLKYPROMjQFNmy8FU6VssNmV2GGG/SnIUhktwhTJjXjOkzbrm
	3+SJw8mH7sgeJonDU7Q4FDJZhQc1wUdzzIBwE/wnl6yQ67C7qpEWbmcKl0Bu
X-Gm-Gg: ASbGnctPaukorNf9MVBHUJIe7+HttOqTINnooU0uv5G0Cz8jMWE5KKcvEwcWGvUIm4j
	tzH9BsptD5BVb7thtWNnhpt1XA6djdXNGgMnW0zfsZErhozo5SJH/eNEn+3reukP87dbzKbPl3j
	n7ldmeJ75Ag0bodc8i8j1A2ATLatH4nI3yaGeJcg0VDxylf1NMF3mnAOzTyoVPJJYAT+gwNwTqN
	SW61ty+HlL+RRVyB6CPhigjnrgms2ExNENOB8Dydt3UPp5pcca1gNVuy9oELPHsMmjb5xYAGGKM
	0sL7YLxg7283HLWn
X-Google-Smtp-Source: AGHT+IFWJHLSIRnI91+NVMU+tddNki1wpnmjLuGocOeP089oHMMsM6bXkZOjZZeePp30mwGdcjvRFg==
X-Received: by 2002:a05:690c:c18:b0:6ea:7b98:3a00 with SMTP id 00721157ae682-6eee08c3fe1mr171254327b3.16.1732630633693;
        Tue, 26 Nov 2024 06:17:13 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eee00afa57sm22684967b3.126.2024.11.26.06.17.12
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 06:17:12 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ee7a48377cso52524857b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Nov 2024 06:17:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTP3gdFgbAAWkopGV1x7sr1NWBHa/Nl0qZTG5lZQ6R66QxrG6lNEEat/BPC0Za0Ebi5EEeJWygy9Jz@lists.linux-m68k.org
X-Received: by 2002:a05:690c:3193:b0:6ee:f2fa:b8a3 with SMTP id
 00721157ae682-6eef2fab97emr74621687b3.5.1732630631703; Tue, 26 Nov 2024
 06:17:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022151838.26f9925fb959.Ia80b55e934bbfc45ce0df42a3233d34b35508046@changeid>
 <CAMuHMdWu_9-L2Te101w8hU7H_2yobJFPXSwwUmGHSJfaPWDKiQ@mail.gmail.com>
 <CAMuHMdXbnZc7rYc7ibRNWY6EfRLh-7g0yDeZ3Zk5OXCQ9Cr=cA@mail.gmail.com> <8221a4a01cb838159828961b6d8d99753ecc31b9.camel@sipsolutions.net>
In-Reply-To: <8221a4a01cb838159828961b6d8d99753ecc31b9.camel@sipsolutions.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Nov 2024 15:16:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbCaMBwjrb+ZJj+MMQvOm8Y=xKfaxVhYVb79WyO4Z-4Q@mail.gmail.com>
Message-ID: <CAMuHMdXbCaMBwjrb+ZJj+MMQvOm8Y=xKfaxVhYVb79WyO4Z-4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] debugfs: add small file operations for most files
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johannes,

On Tue, Nov 26, 2024 at 10:37=E2=80=AFAM Johannes Berg
<johannes@sipsolutions.net> wrote:
> On Tue, 2024-11-26 at 09:38 +0100, Geert Uytterhoeven wrote:
> > > Thanks for your patch, which is now commit 8dc6d81c6b2acc43 ("debugfs=
:
> > > add small file operations for most files") upstream.
>
> Or rather "no thanks" ;-)
>
> > > > +#define DEBUGFS_FSDATA_IS_SHORT_FOPS_BIT BIT(1)
> > >
> > > As the minimum alignment is 2 on m68k, you cannot use bit 1 in pointe=
rs
> > > for your own private use.
>
> D'oh. Sorry about that. Though honestly even if I _had_ seen such a
> comment deep in maple tree code, on that struct I'd probably have
> assumed it's because there's no pointer in it and thus no alignment
> anyway...
>
> But sounds like you're pointers don't need to be naturally aligned, and
> so 2-byte alignment is sufficient.
>
> I guess we _could_ solve that by __aligned(4) on the fops structs, but
> ... I'm not sure that makes sense.
>
> > Reverting commit 8dc6d81c6b2acc43 fixes the issue,
>
> Clearly. Though have to also revert the related patch in wireless :)
>
> > and reduces the
> > atari_defconfig kernel size by 447 bytes, according to bloat-o-meter.
>
> Well, fair point, but if we care about size then we can win back more
> than this by converting about a handful of debugfs files to short ops,
> and if there are no debugfs files then we wouldn't need debugfs either,
> I'd think.
>
> So I think in a way the size argument goes the other way (with a little
> bit of extra work), if that was meant to be an argument at all? :-)

Assuming non-wireless drivers can be converted, too?  As none of the
classical m68k machines support wireless, so far nothing is gained...

> From: Johannes Berg <johannes.berg@intel.com>
> Date: Tue, 26 Nov 2024 10:29:23 +0100
> Subject: [PATCH] fs: debugfs: differentiate short fops with proxy ops
>
> Geert reported that my previous short fops debugfs changes
> broke m68k, because it only has mandatory alignement of two,
> so we can't stash the "is it short" information into the
> pointer (as we already did with the "is it real" bit.)
>
> Instead, exploit the fact that debugfs_file_get() called on
> an already open file will already find that the fsdata is
> no longer the real fops but rather the allocated data that
> already distinguishes full/short ops, so only open() needs
> to be able to distinguish. We can achieve that by using two
> different open functions.
>
> Unfortunately this requires another set of full file ops,
> increasing the size by 536 bytes (x86-64), but that's still

226 on m68k.

> a reasonable trade-off given that only converting some of
> the wireless stack gained over 28k. This brings the total
> cost of this to around 1k, for wins of 28k (all x86-64).
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Link: https://lore.kernel.org/CAMuHMdWu_9-L2Te101w8hU7H_2yobJFPXSwwUmGHSJ=
faPWDKiQ@mail.gmail.com
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>

Thanks, that fixed the issue!
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
