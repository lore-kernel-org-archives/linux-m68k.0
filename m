Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672971632D1
	for <linux-m68k@vger.kernel.org>; Sat, 26 Oct 2024 10:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729939590; cv=none; b=M3cWiGQwhAzpn03rmzvnsTK/CKmrNSfHZv/oSYSqAZ4o86pZSZlw+/jXzaovqbkVP0+V7syoqWm1EHoc6BsPt5y98C/j3YzynC8oGcdEHRR1SkUSAb4u8kWlnQc6D97fzXpFYu2zOt+11G/96ANrteVTyKCLD9/fbPVn3WUSTt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729939590; c=relaxed/simple;
	bh=dloEx77QzWDvLN20c6Zk7nOFt/KB46v4mdREn+XfYnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2QP6LB3Eigp3Qw5CvPt/VXqxFuTii7bEwDotYaYOJ+jSCMQvdQGCLmINRiPwyTYsUilQgX+wHdv1lAqHMsyGbKDZydnsaweKxiTvmlicI1OOiQKYnklXIOx9NZwqf8JPHOTxloWVMO2VJ3AbwPfDGJjLIRefg75MzCW8IToqHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e35bf59cf6so38186507b3.0
        for <linux-m68k@vger.kernel.org>; Sat, 26 Oct 2024 03:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729939585; x=1730544385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=db/67dZAtffr2fqu1c2Lrf8ne3KOQ+6X28MROv/bERo=;
        b=gMlfc2kpTzbb9YZuIMKbf9c8+zzYN5QyF3qpD5lwLU4Z1w+4MXMqDo+rjScpS0m0hJ
         wQ0yGBSC2cDmNu2lt+9tSMqN0PoC0sm2WyCpFmgV0z6587OFxUeW7so3+eNz7cREqQjU
         Sw+SrRY3zyq2pHe3D56+rAnAbAyTpktDmKJPZc88D8yKEPrWgGMUMZS2hFnNju0cfoGB
         W88ulq9B/mcLu2I2YKo/wVteHyJPy/FER86TJ27NrPf7tE0U7N+BSreWJcxHezjb1XtC
         0hQZ3kdhHjeKDIEa3DzGc7ynnWDTK1KQWmZ9pMSaZlG66Vr4iXSjCdLsVR3Dy2ml5zjd
         35uw==
X-Forwarded-Encrypted: i=1; AJvYcCV6qIjFNeb7r9+Kyf7+O7SnAp14q7ieKMMFYMA7cM8ODhDvSvaPU0Q3pCXvyFwe8eZF68Aif4hIVMIG@vger.kernel.org
X-Gm-Message-State: AOJu0YzLwXsiMaDeiQtHVieiIkcy87RyjPoxqVlhUydOAqKaJ1rNdGrK
	lhj/d9BSpD2WsxP6rAWzyKJKB9J1gaiPUwaxnv2uzZ0TFq7ofkEHW76VWV4P
X-Google-Smtp-Source: AGHT+IGjUqsbPP4qmdZ3j6ABB8teROd6WFMsbM/iAW75cOznpsg6XDZsbfHaiJBmMiyEsDaysgi5kA==
X-Received: by 2002:a05:690c:74c5:b0:6e2:1eaa:1c90 with SMTP id 00721157ae682-6e857fe6e2cmr70985827b3.18.1729939585070;
        Sat, 26 Oct 2024 03:46:25 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6cae7f4sm6077977b3.143.2024.10.26.03.46.24
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 03:46:24 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e29218d34f8so2223854276.1
        for <linux-m68k@vger.kernel.org>; Sat, 26 Oct 2024 03:46:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqhvph56zZJWGGWR0poM15c6my7a5+fFfbf5NZhBN8MUdCNNjcUsVRykPegoav96A355cnZ34mqWnQ@vger.kernel.org
X-Received: by 2002:a25:ae59:0:b0:e29:3bc:9a89 with SMTP id
 3f1490d57ef6-e2ec73d8daemr7098714276.27.1729939584112; Sat, 26 Oct 2024
 03:46:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com> <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
 <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de>
In-Reply-To: <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 26 Oct 2024 12:46:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUL3YEW=UNtb4NNstejFFkguZd0LQ9V9xkgwAg74EQ=-Q@mail.gmail.com>
Message-ID: <CAMuHMdUL3YEW=UNtb4NNstejFFkguZd0LQ9V9xkgwAg74EQ=-Q@mail.gmail.com>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
To: Thorsten Glaser <tg@debian.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Arnd Bergmann <arnd@arndb.de>, 
	linux-m68k <linux-m68k@vger.kernel.org>, debian-68k <debian-68k@lists.debian.org>, 
	James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
	Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Fri, Oct 25, 2024 at 11:38=E2=80=AFPM Thorsten Glaser <tg@debian.org> wr=
ote:
> Additionally=E2=80=A6 has anyone done the simple =E2=80=9Cenable -malign-=
int
> in GCC, begin rebuilding stuff, first glibc, then others,
> see what breaks=E2=80=9D? Is there sufficient effect that we cannot
> incrementally change over?

I guess there is code out there that checks for e.g. __mc68000__
and will start doing the wrong thing...

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
