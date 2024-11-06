Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5D81D271D
	for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Nov 2024 08:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881081; cv=none; b=q8I6S46Jkhm0olTNMQ50/0/F6ZnzI6uGHkbf4BL5qNOesiDgxRr3opFZ7h89EYWozvRYFEJH5rA0cPdqTCQjjoyR6t/705ZmYoMB1nHVhbBsd5GAdzEK78LgUE4XOT48fjPd0ia8iAa8xP+/shCGCo86UdPfP7rTm/RC+z6j4ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881081; c=relaxed/simple;
	bh=asbKfRtbqRz/dhxSc48q6tIrUjwCS8/yvOVZ5GkNLQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3Q8y9rt0K84gvri5Io3mCw+MHjsmKrVGij3550hKU4zj5Wgdtt2tBknioq3SAfo8fVUn8bXwIM4Lr0HqX2rcDYavvPdiwrYFEDqOEckilwfrVFJ9oJ7+IRZFQiYRKW+OCnIMdIf59DGu8ySAelSeg+/W0lx3ylt3w3Gsy/QXoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e2e3e4f65dso17668607b3.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Nov 2024 00:17:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881078; x=1731485878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kR2eScfyPIgGoKSiUmUzFN5G+h2FTQtl3KMTeFBL3X4=;
        b=byVZSiDq/hIqCxhSdA4kQoOE/iYdCPPI46p9tnuCmmqr/vi89GCWjSZ6EwibZQPxab
         sLU+857tHcMiOPmYhG6z6RhXpeCvOKmaZdtpK4JKXI7IjZdBlz/USTBbs3H6Vebh6ze5
         LzPSdHVEkcoFmwHbZLMwZ9GHVPFwxjYcCKCvz2/F6101S6IBuVQ8QS9uc84zpg6o+Nvh
         y3KN+JJXL0cCj25X2+EYTLX2WM7chaABIDuJnZsxrssOSfx4tb72gWyu/Gw8/ryMXn/F
         QK3qR0SCbphZK8vIYRjMpDjuc/udrZdoIXL9SKERSg9h6QDvJvZJgP+GzXsSsN+gP1qF
         URVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKAmBpAF0kXDH8pt3xrOoZXquxVf0qQwE7iQPneGdpeD+20QKMfUk1UCi/g8/JBi+8wTZtNApiirlH@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw1PsOH9zPN6XFY/+wQJhuY0+ac/xkQ/MKB+mvmo7m9PsfVnS56
	dwjHYIaux/6mDaQ9yoWvsbghRVYlYrw4/8CRMU5awy6NVOEa+aYtS8CKpCsE
X-Google-Smtp-Source: AGHT+IFSNg+j5VvePkniUukhvozlxwPWn43b0KUaXs6ZaJg2Y4Te/TuGjbbb71rpDpbuVV2pAqX0Hg==
X-Received: by 2002:a05:690c:7201:b0:652:5838:54ef with SMTP id 00721157ae682-6e9d8b5144fmr415240557b3.37.1730881076772;
        Wed, 06 Nov 2024 00:17:56 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea690df029sm22771977b3.40.2024.11.06.00.17.56
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 00:17:56 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e30d1d97d20so5557480276.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Nov 2024 00:17:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX07HLKGwuZOf25l6pi27pYj8qHJasvsbzgaTx6A2Wi8KsfvooBaTIoGbXpY/ReiD/XJOtZ7H+VHTDS@lists.linux-m68k.org
X-Received: by 2002:a05:690c:6312:b0:6ea:95f5:2608 with SMTP id
 00721157ae682-6ea95f52ff2mr103721337b3.7.1730881075844; Wed, 06 Nov 2024
 00:17:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a82e8f0068a8722996a0ccfe666abb5e0a5c120d.1730850684.git.fthain@linux-m68k.org>
In-Reply-To: <a82e8f0068a8722996a0ccfe666abb5e0a5c120d.1730850684.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Nov 2024 09:17:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX2WxBg-909sDRWmMWqGHL+PC63JU+mQ7z7uz2YR_ZRpw@mail.gmail.com>
Message-ID: <CAMuHMdX2WxBg-909sDRWmMWqGHL+PC63JU+mQ7z7uz2YR_ZRpw@mail.gmail.com>
Subject: Re: [PATCH] m68k: mvme147: Reinstate early console
To: Finn Thain <fthain@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, stable@kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 12:58=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> =
wrote:
> From: Daniel Palmer <daniel@0x0f.com>
>
> Commit a38eaa07a0ce ("m68k/mvme147: config.c - Remove unused functions"),
> removed the console functionality for the mvme147 instead of wiring it
> up to an early console. Put the console write function back and wire it u=
p
> like mvme16x does so it's possible to see Linux boot on this fine hardwar=
e
> once more.
>
> Cc: Daniel Palmer <daniel@0x0f.com>
> Cc: stable@kernel.org
> Fixes: a38eaa07a0ce ("m68k/mvme147: config.c - Remove unused functions")
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> Co-developed-by: Finn Thain <fthain@linux-m68k.org>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks, will queue in the m68k tree for v6.13.

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
