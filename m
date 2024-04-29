Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32517E0F6
	for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Apr 2024 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714401456; cv=none; b=WN2O3ecRuywHDWk9ap9EXNkS8VgIxoVRNFUpFEzOoT03ScfG6kWI5f6X09eO+PqkB9at6Wa+X8foFQzd6uJsS5WS7Gi25HKx4ufoHeCR1yGeqnlK+MGEH0ThpHAnb0t1mK2yZygapfw4xi0dyU+jNMDTQApcJY6gyzyxmsOaz4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714401456; c=relaxed/simple;
	bh=o76I6uYyuIHYHMcSkzurzNhgHFDpP4E7YAUzENMyBn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wp4LlIWBA2qpA0YpdrAKGpGm6+czKmH6VzoMAY05vVZQK9ZZfhQnP8bxDLtPa8vyeTPthrxZpuuXYfFKm4OPPQCI/82q84XAS26zqqabbByNP3mKVNT9+6mhLJICMT/6vwRkLkCLBuAP3R3qSrMOjHV8c0UnkUqyhpwSlxplkJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-61bb638697aso21565897b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Apr 2024 07:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714401452; x=1715006252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1B8TUxX3GMUuuf6X9eCvF4beZUOUbPqjMpWnhsqSxGE=;
        b=sYzZ1FAvAELk66zMslggfd8ncGDG1lId8OgqCmoeQ5YB8tb+xXLYccPM1l1jJ0lh8e
         CoDt+K7GiEo1MWVaLZMxAhsjjo4Kiry+7wMJ6tQyOIuHPXtc6CYOYdj/7tly5Sv49qoY
         wzGeINbTTS1PzLYDBPfboMKLbd8EbC6bbknApFQaimWi3BdzZk4Ovk5sT5+hw7YM5Rxq
         3qg7sf3C39eURQmTkMGSLPDnqM9epOCQ/vi6cTZ3/ysiJpDi90SV01wpczobxaPVnas9
         a8y42DXOj0H+IHLp6FsZDS4swAlj+FBAnjviZn2iO9wpsrrujkegFWQucsBtYuLAq355
         SfuA==
X-Forwarded-Encrypted: i=1; AJvYcCWD5XtrsK1sTrYK0jPzD+54qL00RzJFYIcXB6ePYsovXkrkMQna3MTZJVtm1UAgVUfgTfYiZmqMxqsptGVc9ZAMYi90OPJQoamfsRguXV4+
X-Gm-Message-State: AOJu0Yy8rOYhk7B5MQKj8tgqEYNpahCP+nVm00BJBl9SUcDEKIpSfFdb
	KbGWM1vNBrKJoG86VIAObWKQSmKO0vCJ2LFYRhr7PnUAuiLmJ4dSCzUTfrn+
X-Google-Smtp-Source: AGHT+IHKMZRLdC0B6cD4yc/s4+BnmKgaaAtpmR5l/UpaM28G0HzRfwv0MCgtsSIRUcYq564OXeLq6A==
X-Received: by 2002:a05:690c:b0c:b0:611:26e0:f24b with SMTP id cj12-20020a05690c0b0c00b0061126e0f24bmr13831ywb.9.1714401452385;
        Mon, 29 Apr 2024 07:37:32 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id v6-20020a81b706000000b0061ad87eaf80sm4793857ywh.0.2024.04.29.07.37.32
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 07:37:32 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-de54cb87998so4876737276.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Apr 2024 07:37:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwO/A7LLH2UXkgYL4xErXvJiZ5YHTAlWPSQnVOZHYhoSMkUtrbJUj+6GvCNVuqmGiKYGE1SpHioL+1L/Sf1r5c9nlJYEV2Q2eBhqjsZ5yw
X-Received: by 2002:a05:6902:2187:b0:dcf:a52d:6134 with SMTP id
 dl7-20020a056902218700b00dcfa52d6134mr13962181ybb.26.1714401451935; Mon, 29
 Apr 2024 07:37:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <419fcc09d0e563b425c419053d02236b044d86b0.1710298421.git.fthain@linux-m68k.org>
In-Reply-To: <419fcc09d0e563b425c419053d02236b044d86b0.1710298421.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Apr 2024 16:37:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGAAqJsget--=ZZ9CejfPt5kLPkXFJkh5hfZrzhs8hzQ@mail.gmail.com>
Message-ID: <CAMuHMdUGAAqJsget--=ZZ9CejfPt5kLPkXFJkh5hfZrzhs8hzQ@mail.gmail.com>
Subject: Re: [PATCH] macintosh/via-macii: Fix "BUG: sleeping function called
 from invalid context"
To: Finn Thain <fthain@linux-m68k.org>
Cc: Joshua Thompson <funaho@jurai.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 3:55=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> =
wrote:
> The via-macii ADB driver calls request_irq() after disabling hard
> interrupts. But disabling interrupts isn't necessary here because the
> VIA shift register interrupt was masked during VIA1 initialization.
>
> Cc: Joshua Thompson <funaho@jurai.org>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.10.

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
