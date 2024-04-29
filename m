Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293D117BD5
	for <linux-m68k@vger.kernel.org>; Mon, 29 Apr 2024 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714378113; cv=none; b=a3egm5IpV76xdhvcWdqzY7U5rENxNY5zoWw2Kv4aV/DtkvFCkvqVCViijZ0QbsEqe+uyV6Ru3l8cBE9P/X58cxcVngLohgfPdDmmPW58GSi/Q4QT40HIKTP31LKBeSe2cfLEjm1dcMtAMDjQF3xk7rZhrWWPIRfrEH3Z5wlHV/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714378113; c=relaxed/simple;
	bh=EP0pLZoQBFf6BMFiGE+aFt84nYCXhUS/QtPgZBpHZXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPpoKlxUHMMUut7LORtuGt027EEAFy/FnK6Aw/T8/5UYpxQvzKxk2M3YNJEdANqlfDe0H8X8F+91KvB4n11oDfAOGA1goG1pPZCqdfbl9pWlSGfGX6p5Ovwh887WCWwWkldmxvJf8fsmBK3wjGUfW8IWoMoxHNTvgxhlhDOqstc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-de60380c04aso368276.2
        for <linux-m68k@vger.kernel.org>; Mon, 29 Apr 2024 01:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714378109; x=1714982909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Rdzjq0aSeo3rlGAPOdCyeOVU5SoYMbQbeg00ToXscs=;
        b=lKI0hOXpJVUKNKNkMlN7L4V5Wgr3PmK3NRGhEUADPzFXHUFuvM0nA/5hrQAqsh/TQB
         XYnD8Moa2kIL1kxhFaLoywjSmbS0x8TIQFt4Vj5fMttEPkRST8OHEVhBKOF3VkN2N5oA
         4oBI6zsCLZlluC/ZlJZl7kxuaeuITJDrcy7vTXA4zkqgQ3zCHPQKjhx+8s/EaMnhyhoU
         /Tmd4NzcH4frtN5el6F7qvEnjqlJF0N/qXRjSS2ZilXhX5XNLWbSCfIv/wxX8993Mvxl
         FRQMTOqh8c8QxWMSZN3el9CcPsLXy0KZxYGwZ08OY9M78MLwFC6Wq+0vbAFFltBEdQ0m
         r49w==
X-Forwarded-Encrypted: i=1; AJvYcCWE7+nes4aVTyDPK+hGkGukCraCT/xJM/pdS6C55IK2b23FJ9MpY9D53alJxFzlacmez4ScqJhU5KTSX9Fdor5X+ii4J4qNGzuagg==
X-Gm-Message-State: AOJu0Yxc1MoLiHDKlHTthMWO0t4we0X20UAQUEuboS5bhLtRKCcIl3iU
	2P7Q6AR5G9LYf/e5nP0hUA8jWV5m6LYCOIOE+4ktK0oauq4WckyU727ClY2A
X-Google-Smtp-Source: AGHT+IH+sE6f8pBjvUCTVL5ODRNulyuX1INKcUeyzd+ukjqxXxtHo4wk/mOxRU1l+/IxuYHeYLxStQ==
X-Received: by 2002:a25:84c3:0:b0:dcf:6122:ccec with SMTP id x3-20020a2584c3000000b00dcf6122ccecmr10499824ybm.36.1714378109498;
        Mon, 29 Apr 2024 01:08:29 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id g19-20020a25ae53000000b00de6036e9abdsm1779ybe.38.2024.04.29.01.08.29
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 01:08:29 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-617e42a3f94so45760517b3.2
        for <linux-m68k@vger.kernel.org>; Mon, 29 Apr 2024 01:08:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQm4rsWJfmQaiSbeyrlKXyD7kvr2RaqQ7+2Eqpupa69nCoA465d37h6vixHVVM0oGzVOxGKBL27/6Cr/s3a4QPhW80uxTU9a9QWg==
X-Received: by 2002:a05:690c:7204:b0:618:8bc1:ad9f with SMTP id
 jl4-20020a05690c720400b006188bc1ad9fmr10473622ywb.13.1714378108129; Mon, 29
 Apr 2024 01:08:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429030945.22451-1-schmitzmic@gmail.com> <5d72bdb5-a98e-4b2a-99d0-73b592fe0993@linux-m68k.org>
In-Reply-To: <5d72bdb5-a98e-4b2a-99d0-73b592fe0993@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Apr 2024 10:08:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrOnOQwCxk42YCjEkbfL-YDSvpf_xTaouv9hUs2bO+qg@mail.gmail.com>
Message-ID: <CAMuHMdVrOnOQwCxk42YCjEkbfL-YDSvpf_xTaouv9hUs2bO+qg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] m68k uaccess fault handling fixes
To: Greg Ungerer <gerg@linux-m68k.org>, Angelo Dureghello <adureghello@baylibre.com>
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 9:58=E2=80=AFAM Greg Ungerer <gerg@linux-m68k.org> =
wrote:
> On 29/4/24 13:09, Michael Schmitz wrote:
> > (Actually now) version 4 of fixes for uaccess fault handling
> > on 68030, tested on 68030 and 68040.
> >
> > Patch 1 has one exception table entry fixed (residual
> > calculated in __generic_copy_to_user did not take into
> > account the number of longword transfers omitted due to a
> > fault) si as well as a final NOP added in __clear_user.
> >
> > Patch 2 is unchanged from v3 (actually since RFC v1), now
> > has Tested-by tag by Finn Thain added.
> >
> > These patches would still benefit from testing on 68060
> > and Coldfire.
>
> I would very much like to test them on ColdFire. Unfortunately my only
> ColdFire with MMU board (a M547xEVB) failed a couple of months back.
> I am trying to find a replacement, but so far have not been able to get
> my hands on one.
>
> Maybe someone else out there has one they can test with?

Angelo?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
