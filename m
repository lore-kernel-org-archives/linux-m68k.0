Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA2230C35E
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 13:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887738; cv=none; b=O8M9eWJPENzdGv/HKtDDjg12R+mfvhr0YObo4C0LaO0ck1adaIAF6YVKfwLeO66ZPWpDEfVqMeT42+WPgJsx34LqucPzvMYD5mkWqzoXEo/+nlExXk3tesC9MKt1uB7WMb2vvgzHQBhelaBFRAngIDGStvz70OQERwyw0HW36Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887738; c=relaxed/simple;
	bh=L4LMy3/5PcD6JOd8qFsTzkz6YlTgBQwkJtsYILkNLkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0Py3zNDO3p7HYDG9mF5msZh0BmTa8bWTd0uqCm+yBqMJhbSEs/z1IhWHwnHcsCJHmws/O0AkorincsP+Hhg1MDi7BAlQKLEZso5hYQrXh+evxhChGwlXxVX0VFRv6lfsNgMrnkIrXaZVm6F8Jfgb16Wjm62UaFgSeKSxcsLo1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56f70865797so7335497e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779887736; x=1780492536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhuosztxaYqV9SvM0bBA8kuIl21DSYO1vCjtfXxvD04=;
        b=EdmDQFxN1xbXvNpGt2pKlNPVKNzwdJSagSEZz4m6r87XGRt1Z75TjCXa5D/XpQqjoV
         p3RxblCsO0eHcKWfoAgwhmZmuNbO2pYGfDK9TJ+GAy+syD95N6JjXl+B4Ep2O2WgTN3J
         Nm05VULfXxj/RgGxHWnUbQX/5rGzWr2ssl2fFPBYNaUFMMUGVUqzqPOfMKZGE2GSEWQF
         TnM9KawIkPsEvsdbNPNUZUNgB4b7qxDEVWjLOMVY9CGMWa72odr13+Bs90KHEdkhoTVg
         fOeVbJqfzzvzqDNrvPKHbLn1l6O6UlA4C8ZTtUOepEepWyJhixWWy1lP4CNhbVyEvKSu
         +xOA==
X-Forwarded-Encrypted: i=1; AFNElJ/9S+INqYhPDKKfwmPpBclX1ey3XGjQcsXIcVbk7TuYzkZ5X0RMGDXsRz3kPtAjiFzia6cgglFxwTYe@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx3zWRXyouOA7ce9mBVY0aXbtLGwBXQZpTA3UCw6zYkcDl9idY8
	e9lIC8b8szSROjIRvmhwLxiM2U/EZWnHzfS+Q9l3b1vYvCnh8lUbQznA3+YXoCzJCvs=
X-Gm-Gg: Acq92OFrF+SJdzfadXWfxWeAillQhl4oLN4uCPGJtO6ye+hDHfgysGIZaLy1gs2s6tc
	n2TNMshdrtoPLz50tYQ1aQlJUjihB1TyaRymisdIF3M/MNgT2R8g5OJlAvnrpKfHp75bbtMw8ee
	NJ61iihFwvtoNk5JkzYYRhktI1PtdRKtrEcE/CyvmL3+ujM4Xsbva2ukmiZyktPtwmLQakiEUBe
	7yEbQoHJnQalvPvPeT2WI2SxcmxBibLI2i8YkKH14Qtk1tCI/7SV09nFwl6Wdn5wpcwDvMfiOWv
	npiOBDf5Knx+o4afZYO2FCaoPd8Xb3YFh+qOHC59qVnECONB7pX0koKI6O16Hoimgcw/ht67r6V
	VFpjVjtqq+c1UsAuH4zmI9ne8Wvg0KhmOj/dFF3+SczV/ch8acmhOStBdgGd4FwcX1fdg96rBc+
	turrAGZdhcB/BnXEQbaqJcXLDxEkXbdOt8iNfVhZaSmThcz+tU7rEIEm2St3GX75i3VBa0Z5rH3
	j8=
X-Received: by 2002:a05:6122:469d:b0:56f:6b46:28be with SMTP id 71dfb90a1353d-58661b20011mr12164629e0c.8.1779887736527;
        Wed, 27 May 2026 06:15:36 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961737bbf42sm16820419241.2.2026.05.27.06.15.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:15:35 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-57512a429d1so9575250e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:15:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9pP3FgqEYiP0AUONNy5rij5GgKc33ayruB/psM7CEAWkXWg/KheuBLrvm5pAKj96TtyrJ/QCF5bypc@lists.linux-m68k.org
X-Received: by 2002:a05:6122:1310:b0:56b:1eb:d396 with SMTP id
 71dfb90a1353d-58664ddc313mr12044467e0c.14.1779887734873; Wed, 27 May 2026
 06:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779803053.git.u.kleine-koenig@baylibre.com> <9602004a447b474b15ca1e110d6d3c277f669e20.1779803053.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <9602004a447b474b15ca1e110d6d3c277f669e20.1779803053.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 15:15:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWUHRBT-MmHv6bKH5arNZu7MvpxykkHs2Y_VFY=YUnUg@mail.gmail.com>
X-Gm-Features: AVHnY4LQIVhtSrsik3alzJbVavFB4QDxiPF_aBdmr6zoiQVhz2g6cNLGL9_4zEw
Message-ID: <CAMuHMdUWUHRBT-MmHv6bKH5arNZu7MvpxykkHs2Y_VFY=YUnUg@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] scsi: Use named initializer for zorro_device_id
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, "Christian A. Ehrhardt" <lk@c--e.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 May 2026 at 16:18, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> Using named initializers is more explicit and thus easier to parse for a
> human.
>
> It's also more robust to changes in the struct definition. This robustnes=
s
> is relevant for a planned change to struct zorro_device_id that replaces
> .driver_data by an anonymous union.
>
> While touching these arrays, drop explicit zeros from the list terminator=
.
>
> This change doesn't introduce changes to the compiled zorro_device_id
> arrays.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
