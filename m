Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A136F2D0602
	for <linux-m68k@vger.kernel.org>; Mon,  6 Oct 2025 13:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759756869; cv=none; b=Op0Z4DJG3YpT2vUhjF5dH9vmPzHr55bKoPPhFs7mEqP8Bidn5o+EIfPQAlI9KBv7dHdgu0Y5+U1H+RHgvdjpRfKPE+mtykGAJLJ3nWU0yaUZCGc6Vlbje05mMR7P51vq6f3RPFvHAof4jaD/v93z4jYjxroZHwEBUx8alXG7HaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759756869; c=relaxed/simple;
	bh=KMVP6+NUbnV92gLmdFQjNvr3c1BiPckine2kLw4OB/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bVQkerOZWvsW3YazVoZNOuajNy2lv6oSGyTj/3zCaGdj2h8UXiR7wzhCCsOM0g98yYS/8iiq1/jCwCE/axV6lBcOGZRVFsGEgfcOxGCgBbJhTA1ZC5ffu2+wc+3UKF2cNefkumUMudUZEYcD0YLrXlHJK/eLVNo56zZccGY91ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-55784771e9dso2795778137.1
        for <linux-m68k@vger.kernel.org>; Mon, 06 Oct 2025 06:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759756866; x=1760361666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xuRqoxklPAOlbd1RPrmnGLCYcdAv9gdZsGWxssDdsVg=;
        b=eH6dZVtPFZVpVyuD0c93eX8XtQdl931MilxWHBM63EnC/4ic2kYxGTZNNkURQV1mlI
         w0Jt5+Vf1qbKMJS+847t//D6pTI7t9ccT1YFhfsDAN6ofSgmx9CFmr65OyU4eGKfuNzK
         rKL9lZXFAEVwqAKCzIZnvLrEqUL7B1BBM1IvyGkBjy3F0ZuAYk24n88ulPanoFpdLeTn
         +0b4Z/D3KQMGwIFy+GPLAErZJpOwQvT6tibCcTGSkvb/U9vfaEAsv3wlumoioppyZ5wI
         IQYi7egO8YyKtDGcX/RFeZnRHyX5cnoe2cP7/DJeW0aAu7LLx6fMdYV/wb3N0WfXxjCW
         ZPMA==
X-Forwarded-Encrypted: i=1; AJvYcCVbQ7THJV2YWn0FUfzt8IHY4yF2WSyLVj5lbeGY6slec1kfbHzHbbexow3dTGMJxEGG3mmrt6K+nwG3@vger.kernel.org
X-Gm-Message-State: AOJu0YynvdQ1f5RXP/aavYFetcdQ1lwSQ4THBjcIaaVhrzATzYYljShZ
	Q2JO6RsGtGoE8mvxqI0c7us5DvRXfYZmCg1yw19PLZh2qREfg3acFlt4YGB7LhQh
X-Gm-Gg: ASbGncuM3OSmX3yqIN5376Z1VC+OlC3qOl44sNmguKjK3aYlVfYwx5OkZIyI94U9Usa
	1+NlaOLjSOLDU5J51IYiIS2T3R/pqlSYLCdOrrvTihCUAc7blrIVCmW7H/Z2YueKKyegi9etwFx
	jkQn3E2/zEEPELc56EdviNcXmQdkjgw37WuXdDq1E2fAnk2XrF29DT2GvgPM82KBoWsAT+GXOiy
	xpWja4x02SzwEeGD99mLSp+2HIjnwLHmBJwTju8NmTACQR6KBIZzNn66vyDfG7NFibLZaFUCdPB
	34hZfUEYV0JaKQPhMXUz+BJM9ZMn3bQJFftdRCn4Bvq/itIxz3FAusH4Z+J89S4Myzcg0G4E/Zk
	6xDwPhHaEgGCkuavbCu7jr9QzvtEPSydHULJvyEaSdidQFhduoFBZ6Gx5gyArp7Sf4kCmKZTK07
	FaRSdEZSTytztRvgeDgLQ=
X-Google-Smtp-Source: AGHT+IFb8oBWqOkUjiOm07Nb+s+c2tio/uOIB/faDPpm2wTK15xafM3npk8+DoETfmsIxaX31ztB+g==
X-Received: by 2002:a05:6102:c47:b0:586:a135:746e with SMTP id ada2fe7eead31-5d41d148748mr3902978137.28.1759756864720;
        Mon, 06 Oct 2025 06:21:04 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4da21c3sm2937436241.7.2025.10.06.06.21.03
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 06:21:03 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-55784771e9dso2795748137.1
        for <linux-m68k@vger.kernel.org>; Mon, 06 Oct 2025 06:21:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXb/zr+vXzRfU7oksouNiJwrsThBR0ywHG7n5kgIkf1eZCQ4kX8EWM9G78pqBOxZPxgu7Bolf+GrHk4@vger.kernel.org
X-Received: by 2002:a05:6102:442c:b0:529:fc9e:84a0 with SMTP id
 ada2fe7eead31-5d41d17bfd3mr4212837137.32.1759756863544; Mon, 06 Oct 2025
 06:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <949f096337e28d50510e970ae3ba3ec9c1342ec0.1759753998.git.geert@linux-m68k.org>
 <mvm347wjj90.fsf@linux-m68k.org>
In-Reply-To: <mvm347wjj90.fsf@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 15:20:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdeJ6Bq=zA7QcN82YNaZW3R8ebeXpGzqHus-KPkSj5XA@mail.gmail.com>
X-Gm-Features: AS18NWBaXdKwIk39XXp--4bSlHAuBircfzV6tgtSqOZ0QwIv2ppBEo2LZ9edH4Q
Message-ID: <CAMuHMdXdeJ6Bq=zA7QcN82YNaZW3R8ebeXpGzqHus-KPkSj5XA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: uapi: Strip comments before size type check
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kbuild@vger.kernel.org, linux-m68k@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andreas,

On Mon, 6 Oct 2025 at 14:40, Andreas Schwab <schwab@linux-m68k.org> wrote:
> On Okt 06 2025, Geert Uytterhoeven wrote:
> > --- a/usr/include/headers_check.pl
> > +++ b/usr/include/headers_check.pl
> > @@ -155,6 +155,8 @@ sub check_sizetypes
> >       if (my $included = ($line =~ /^\s*#\s*include\s+[<"](\S+)[>"]/)[0]) {
> >               check_include_typesh($included);
> >       }
> > +     # strip comments (single-line only)
> > +     $line =~ s@\/\*.*?\*\/@@;
>
> I don't think you need to quote the forward slashes in the regexp.

Thanks, you are right!

So far for not just following my instinct, but looking for similar functionality
in other scripts like scripts/kernel-doc.pl...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
