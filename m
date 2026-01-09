Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0844A3382D7
	for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jan 2026 10:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767955899; cv=none; b=LXAV+880W5to6vN+zyi1PQYt0e6Z+P2Rc+1krakmO6SJKh4Ibpc9Puhac65ojtgUfL6Uda96uAJhBDehNCGXo4BEunqJ0NM+0YgneYhrJ+hVKsfS2VWYcrFCww3J9KXAYUVm6ReV8S4IsYc1R/B60g7Ks8danLvAhfiDYXIlxWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767955899; c=relaxed/simple;
	bh=KdToO14tef5GSir+chabd8B6NEOIpxi61cdldG3NByg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKkDOjglD+uab6cl8vSqva1qbkmXUcNCzTj2BLHzgvB4OjleSab88JY3EZgDqaFRDWeqA4rs5C0STYr2UmDmsyaXg+CA65/r844Wpi3H5zp/K7fj5icLXp0Ht/57CWzcD7T9uSoS7bUGxErt1BAFUhhvRBHI0ymaEWFoxKiq/h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-563610de035so879113e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jan 2026 02:51:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767955897; x=1768560697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+PrHggOm39VeVydYN6TMkB/guB5c9Xengt3pqY0OQgA=;
        b=UgOEBDG+912U8ByThmPQVJm4t11c1eA4NGPLAQcFw0qHTr2pyHoWrgCCmoxBvt85t9
         JSpVjGfBM7jlfRB2/O6JPNVJbXHO+9rJQb0KdtPNgmqBfFvpatq260wgnxq40tvkmI2I
         ELonZ5r80N94Mw65vRyy4YhQWMDq/ZhQFDOzGvuvPX4GEMgfluqZDWKWMbhmi4F7ph2Z
         +BtzjPU7xaKRjjays0l0OSdiLalsdjiOK8PiS+3XNhL6EqKUda9esgBP2G8e8gICu/AJ
         L9RJ5kY3mYj0sYJVKyFdTHyfs57ZmBf7MCAtITcXPbfAx8T1/TKA1aFAuaK+0o49iq0R
         Xbkg==
X-Forwarded-Encrypted: i=1; AJvYcCUxIEgI5rwdr5dpYIKYhFKUNaMomep3O5YUDqt9K6X3hnjFiKkjaK8RQxDxnlffOOi6w6bvJL7SL6St@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzPFCZjYidx8PwDtzSefiDyJF7lH7P1SenzrTL5xUl7YZmkq7V9
	80ADyc+QFf8d1xtihAh5LecS9D+RwLuqRAMnNU753UOR3gTU8SRPmJ+gWPae252x
X-Gm-Gg: AY/fxX5AUXkc4DCnQHBRx5mDvxkn4eCOSUCcsKDGLcaM6ix9z0TurnKMQrjwMrsOts0
	LgzqMDC3lBX6nOLas9R2W533KCiKEW/8E+9OBq2RHO2RS80gulLrN9HwNaMCsNyjtT42G6zaC8/
	N8H8OKd5gkt/MS6IX7g+ANmOv+Zu2ZMHKO7aovpfWWUw4RwfXSv6WEnfGglxst5kGfaX9+tkHxM
	foDAxsYHVbkMQF+q7MP1Q/BcleToBvkRxqmKmSRp7OE88FJT/La5dYIF577z6QR66hAF4hm7EWu
	wgHbE+dPeniQKidJ5nMvqP83cWlaOrZIWL3xjmJbFQF6pAyNrA8sFpKOFPcgEhLaEo0AfcV5km0
	mISFAOxrA5PSlczOgHdW/ao8/8QlQOscmsssIgvQ1dO9MGzM6UpCosU/zRo0jCsNgY2PNbbix9I
	L08lS9KjbUYbh54VBsU/wHwgoWfLT3qT/v1unGjzWfrnuyM2jU3JZW
X-Google-Smtp-Source: AGHT+IF2AqGHXL9sLeNno18EK4rPjdYkGSvsYQif3e55B0N6cLpTjuB+7i5LVkaHZ4KVttL/260v2Q==
X-Received: by 2002:a05:6122:4593:b0:54a:9fe8:171e with SMTP id 71dfb90a1353d-56347d8330amr3738436e0c.7.1767955896856;
        Fri, 09 Jan 2026 02:51:36 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a3f78d8sm8910017e0c.10.2026.01.09.02.51.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 02:51:36 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5636470c344so585182e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jan 2026 02:51:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJKeQSnK2KN2lxB21iKmugij4RgT0+47R9ZNaKfVNnBvs79RVKu4wNwCdSEFw4vc9hTDkBM6l8c8jV@lists.linux-m68k.org
X-Received: by 2002:a05:6122:18b5:b0:563:4a88:6ebd with SMTP id
 71dfb90a1353d-5634a887159mr2995245e0c.3.1767955895564; Fri, 09 Jan 2026
 02:51:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
 <20260108-custom-logo-v3-1-5a7aada7a6d4@kernel.org> <CAMuHMdX04g+BfEuBt_0iCvmZiyCLp58d0QwnFtu3bM1Cv59TzQ@mail.gmail.com>
 <4e75acf9-2e04-4ad4-9241-d8fd36462404@kernel.org>
In-Reply-To: <4e75acf9-2e04-4ad4-9241-d8fd36462404@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 11:51:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUM3JfgDCri0=rq8L8e+bvhZ0EhMvyFD_0v7NJ-Z7v6og@mail.gmail.com>
X-Gm-Features: AZwV_QjshkTYtV04MygmILu94BM_s12nNFHOxgxtfb9evPWzSLQreqflAdgzCzQ
Message-ID: <CAMuHMdUM3JfgDCri0=rq8L8e+bvhZ0EhMvyFD_0v7NJ-Z7v6og@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] video/logo: remove orphan .pgm Makefile rule
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Helge Deller <deller@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vincent,

On Fri, 9 Jan 2026 at 11:48, Vincent Mailhol <mailhol@kernel.org> wrote:
> On 09/01/2026 =C3=A0 09:40, Geert Uytterhoeven wrote:
> > On Thu, 8 Jan 2026 at 20:06, Vincent Mailhol <mailhol@kernel.org> wrote=
:
> >> The kernel has no actual grey-scale logos. And looking at the git
> >> history, it seems that there never was one (or maybe there was in the
> >> pre-git history? I did not check that far=E2=80=A6)
> >>
> >> Remove the Makefile rule for the .pgm grey scale images.
> >>
> >> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> >
> > Thanks for your patch!
> >
> > There newer were grey-scale logos. Linux also never supported
> > drawing them.
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Thanks. Just to clarify, is your Reviewed-by tag only for this patch or
> for the full series?

For this patch.

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
