Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57797202976
	for <linux-m68k@vger.kernel.org>; Mon, 15 Sep 2025 07:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757920424; cv=none; b=l4QBn6uWtZikq+1uByuN2btA/dn/RiTTxsG8PXnhcF9iPF3X+evJT73Y/64BQ2nBExTYj7PKGRRm1ZtFGRqaveuegVDjMYRHBv6hejC0kThgoqZ7gWNBUcher5TkdoWRKo5ZmuVeJmirphYDLe8id8RDFIBbc5PBABqK2fii3tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757920424; c=relaxed/simple;
	bh=dfvyAXJ+q2P35fAgIjXMmhc4HlVtSk3Mc3VBrceUE6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dlPn8at0nEK3+BV9UmM4hegeUJyoBXlhVt0/3vhYddJQM6pYskV/h6rsp4MbTqyl3AHHvbhUA4KviG7+5nhPWmsi2v5nP7gqq47PNJ4I8+ZHqc3GAS1FgwYtj+Ue6QOITUc/gGbMbNvstybMSoa6xQs7UmO/+DwYk711mdM4dFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-528d8aa2f3bso1372696137.2
        for <linux-m68k@vger.kernel.org>; Mon, 15 Sep 2025 00:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757920421; x=1758525221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLMuvQvb9Q0HlgP3n0zmCAk2FLf3hZGDFhVwbi0PK4A=;
        b=V9pdpEpNb5y9vYeTNtqbgEcrM7sBXL1qS/zw7eqGax0mpSUkIZgGZkLjUuV3+jmsAR
         3ieG8IpX/PKDfdEmhlZ7bTKwS7NPrsmDak06GFP1qZnj95g91jHZTOD8rSsUlDUJGrLO
         tWNBCd/FTXnp8XI+uagATFFUziiJ8M1s9Alit9Fr7nQXqENUbbdmWaj+Wis5zf80REcp
         JQ2GoMBe4hCoJOOi9CkBYnMVV6zSLsJEm7hBPg4bEwZXw9LDjhDDm+QDfu0irOjOjBcN
         hVwG7CGGfIo+jxbHo3NP3l6rvKr9tvaQl61rgd/64K/gD5i0UT+cqBoe2HFz699WCt9q
         r1gw==
X-Forwarded-Encrypted: i=1; AJvYcCUd701fs/TnC5onrGwzCQ4XBnNNR0sdf/yqIDKMAsiDtI2xK6IeooRJfb8PBTjnlByxf6XiIZq3DQwZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwdIYje5nqJH3u82I6KYAgVT91aNJa+iYFSpJpfH31bEXIdzz1u
	GNm8qd/Y8aeLA9uisid6wOZeNZrVjIrFRzppt1d04rO0WcNsqRMdpZTkhKcHh4QK
X-Gm-Gg: ASbGncsNnXBkjluJloMSzEUuu6Ozh1XE4QN32zLMUxiFZt92NxRJ16GSumSCRZF1tn6
	B5TATM4zkgW2+fdumfNxLOWz5kALnFx+hzdzzUjo9/eh4b4zHK+N3KKoyCZDJYb8gnxeqMoMRv/
	ipS5tTMx93UhagBpwjlObZds4iKb2vI6N06a4p/r75Q34fNet5n+eQ8bbmt2igz+OcNeSQ/jPOr
	/tAbLN7U9gG9Dc581TF6aHC6ePYjcS6YfQAjU7jVXU/DrxZDbNemHG+F2JrvOgMCTtIdyd6VtnF
	8UIOA23yk5bmUa9XJPOETh2oBs/cF5FNh8ZbXP5++lzz+7GBFpeUd2wAaF1UejkPZSAXyrOWXGm
	2Rp/A/YE4gmd/sxp7RXfNAWZlGYzfC4j5gdKlgCq3xa6kdkoeP5T6yA2JAqBcT21en7S1zbs=
X-Google-Smtp-Source: AGHT+IEpz+EVc4tTUi1/FARi7G7Ecnt8Um1IKuEHuMdPQ1eRhmhA3YWRjyLyTPSsl69AV8UZZAteGw==
X-Received: by 2002:a05:6102:3e12:b0:537:f1db:7695 with SMTP id ada2fe7eead31-5560fb43c96mr3233345137.26.1757920421058;
        Mon, 15 Sep 2025 00:13:41 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8ccd640cb5csm2118101241.21.2025.09.15.00.13.40
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 00:13:40 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-890190da557so522534241.3
        for <linux-m68k@vger.kernel.org>; Mon, 15 Sep 2025 00:13:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+Gi4Qr1CE50Tp7XdvMbmMNpIXTONEpiaOxLR+wizgCW0kdR/aHep6o0+iYAHnJoYc2D0JXM6Lm41p@vger.kernel.org
X-Received: by 2002:a05:6102:a53:b0:538:f3d5:fc12 with SMTP id
 ada2fe7eead31-55610dc0d40mr3363566137.32.1757920419553; Mon, 15 Sep 2025
 00:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1757810729.git.fthain@linux-m68k.org> <abf2bf114abfc171294895b63cd00af475350dba.1757810729.git.fthain@linux-m68k.org>
In-Reply-To: <abf2bf114abfc171294895b63cd00af475350dba.1757810729.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Sep 2025 09:13:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOnUXJbhifdyYY50fo5zoG=FH6Rvp64mQHBB9yQRyiVA@mail.gmail.com>
X-Gm-Features: AS18NWBvIvDo2gS7rnEu0r9EhvBtLAuRYWpDZeLRfT5zdiYtp2SXSdMjVN81nKo
Message-ID: <CAMuHMdXOnUXJbhifdyYY50fo5zoG=FH6Rvp64mQHBB9yQRyiVA@mail.gmail.com>
Subject: Re: [RFC v2 2/3] atomic: Specify alignment for atomic_t and atomic64_t
To: Finn Thain <fthain@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-m68k@vger.kernel.org, Lance Yang <lance.yang@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

Thanks for your patch!

On Sun, 14 Sept 2025 at 02:59, Finn Thain <fthain@linux-m68k.org> wrote:
> Some recent commits incorrectly assumed 4-byte alignment of locks.
> That assumption fails on Linux/m68k (and, interestingly, would have
> failed on Linux/cris also). Specify the minimum alignment of atomic
> variables for fewer surprises and (hopefully) better performance.
>
> Consistent with i386, atomic64_t is not given natural alignment here.

You forgot to drop this line.

>
> Cc: Lance Yang <lance.yang@linux.dev>
> Link: https://lore.kernel.org/lkml/CAMuHMdW7Ab13DdGs2acMQcix5ObJK0O2dG_Fxzr8_g58Rc1_0g@mail.gmail.com/
> ---
> Changed since v1:
>  - atomic64_t now gets an __aligned attribute too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
