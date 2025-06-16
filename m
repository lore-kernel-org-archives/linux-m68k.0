Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4581C2EAD1E
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074905; cv=none; b=Y80OieogG9jZL4aH+N75FyBDqaBjJbdMHuSVwp1hZl8AHnkQeX+Wsnto/mxRFR5nxvw4SBGlEBmbJrAOQ/w9oc5OgO9rzAhfhT6XGSjb9lf29RFKrYUoqLMThcBjF1g1bnXQCCL9uggC1vaPpAkqCLZgga1kh7IvxtyFLdfgVi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074905; c=relaxed/simple;
	bh=oAw41ZGNX2R04TMhroOmIIyfvsBplVK9hTRcSXMKJKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vC28yFYv/U+7jOXO9GKt1unLrX67tWIpmlYbqP2gl/uw7TLYdxpi8OrAYeSueZfSFTVSG9tmfnESMBnunkvFIvb3A5xwql7c5nI90z9WsAqEOISX+IQORkFBd4ANNiPmPpi51QBprsWfIoII0JMJkkUvq6puFwL8Wxu0djzbtm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-87f2a0825e1so67150241.2
        for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 04:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074899; x=1750679699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEWQGimw1GFh7++4y/E2DWc4FMBwF/H4zGa6pF/Jdq0=;
        b=HERAvL/jY76WDToY/TquaLukOhrKDcyHi47FB+Yr8Wkokxl+ZFcMZDmGCKMY+CH8Wo
         t91idnQmGkt28a2UeaI57JpXNON/Nlj088A6FjBpBNG+/cHWAKivMMNZOnEpa0wbjhXM
         dXx3eJeL3peFDsF8Jo7/RGoyEg8xCQsKu6q3WNlc4qbrYYKM7U8sPGXgeKyyi71vcW3l
         MGrnxzN+/RJljD63nmGkL4Mff4oUqc0ZCkH53Nww5fXap8p+yxEHBGEj3IvEbQRiOecY
         sScc7x90aMjOmbGSlGh6BZsxBQGgV6um9fXGv+01/OPLhrU9vwibm4fje4WwuvbwsHbZ
         ut9A==
X-Forwarded-Encrypted: i=1; AJvYcCUbYqeryBfRDpyUYI7Lpw+HO3WNe9Sf6FpUdOMZyJZiOhyly+thTK4mqgSXbLMmWBtEKUAE5dEtYv3n@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnb4htOCrWs8uED83fQB8jE7ek9SXVWXwhQozh3uGVwwxENa65
	/iPSD0FIfO470UmGahWILoiZSKiG/Bqn2xfg0bt5G8/WZxL3ZnRxsNxRwLsZK5gc
X-Gm-Gg: ASbGncsTE17u/cGLwWZ/hNH1ndrCQQnCZnFz5S0UZTIg0pymILd7pbSuO4VcQExd4BF
	eoL6n+BRikAjRSDRxcpa8dUvUHdq2M0lUBoLf0CBer3lN5Wq+8wVpNMk08fSlp7NZ8LGzxyqAvu
	fHdExhl9Birii33uuCgQJ9DaVWzh93xgGuczd9IHjZCUhnCjmj4AuH8cfEm/3f5NIFhK/Dg/PNm
	rMs5NB2C027MXXfQN7RpqpDhbgDraeDo7EJwFguIwUtSHD6IlWMEu+YIns2giV27/bnCBaUo+3P
	PJeHmX7z0WU2C1ngeyBIlaYRy+CHjLFCUSELG+cXVWgeEOOzk/U71t5ocATEtkJqjJjL+vtYUN6
	fmkX2tDmcGl5Q6IB3CaMAVBDuEXFtVgxvf6k=
X-Google-Smtp-Source: AGHT+IFeV/SkJof89ZX/nJzylB/Zbn9uQHjRtA7Uxf3+i1txXaYwveR3U40ZPFVQ+JHlm4FXICGbew==
X-Received: by 2002:a05:6102:4b0c:b0:4e7:dffe:887e with SMTP id ada2fe7eead31-4e7f6015e46mr5496429137.0.1750074898724;
        Mon, 16 Jun 2025 04:54:58 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f1c761eabsm968403241.8.2025.06.16.04.54.57
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:54:57 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e7fb730078so580560137.1
        for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 04:54:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwIoqUFIPSDD7skTyznBHrJkDWiFTmZamuDD3Rw6RZHWZUFUky5KM0vpvnqlS5Epbe+4PVpy7BtqBG@vger.kernel.org
X-Received: by 2002:a05:6102:4a98:b0:4e6:a338:a421 with SMTP id
 ada2fe7eead31-4e7f61b1f1bmr4784500137.6.1750074896719; Mon, 16 Jun 2025
 04:54:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org> <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com> <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
 <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org> <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
 <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
 <c4f086207e68843ea154b5d41950957fa11c6837.camel@physik.fu-berlin.de>
In-Reply-To: <c4f086207e68843ea154b5d41950957fa11c6837.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jun 2025 13:54:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com>
X-Gm-Features: AX0GCFsBgKQoqAhhcR0Sbi_h1E5mL17RY4mVoM_2hTTtSHfw3mV_CfAxFFJAOk4
Message-ID: <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: =?UTF-8?B?QWRtaW5pc3RyYXRvciBAIFLCt1bCt0U=?= <admin@r-v-e.co>, 
	"stefan.k.reinauer@gmail.com" <stefan.k.reinauer@gmail.com>, 
	"fthain@linux-m68k.org" <fthain@linux-m68k.org>, "userm57@yahoo.com" <userm57@yahoo.com>, 
	"jeanmichel.hautbois@yoseli.org" <jeanmichel.hautbois@yoseli.org>, 
	"port-m68k@netbsd.org" <port-m68k@netbsd.org>, 
	"debian-68k@lists.debian.org" <debian-68k@lists.debian.org>, 
	"linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

On Mon, 16 Jun 2025 at 13:48, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Thu, 2025-06-12 at 08:25 +0000, Administrator @ R=C2=B7V=C2=B7E wrote:
> > Thanks for your great hard work and efforts to mantain the various and =
now
> > considered exotic architectures running Debian, Adrian!
>
> Thanks, and you're welcome. Unfortunately, some people like Finn and Eero=
 don't
> appreciate these efforts and seem to think that this all comes at zero co=
sts.

Please calm down...
Thanks!

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
