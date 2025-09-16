Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244692F7AB5
	for <linux-m68k@vger.kernel.org>; Tue, 16 Sep 2025 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017456; cv=none; b=BYcDUZF+1149VaVwBrt3mHxhOjlxMyHkA3jfGyvbaCEDEHHE2LiUjAlzf53gxGQCe1v7a0XKkzCJgPXgio2oSEcltNXoM2ZY8o8Ir9LTwz1ka00opzWLs582lPt//UDXZrLTSN4N6lJNFjGFUJ8SScC9o5ryWuh41ldAGBpYiC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017456; c=relaxed/simple;
	bh=/9wF0vy0tw5T0bKnAANkQEvrwPKBiKOdApMI1SEJeAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U9eXey9oiRm0l4ZTGPJ5I/EkSWHosmIcpbUunzlOAuVQq9lFle6kh6scZrxEJXNzvjtP0cqrPnmc1pKs4w4t4OuCckxJVLvKHLBVt4bu4IrNF9p9kgIShH0bkXliJ+M0i9LNzC9Okc+2vJWaqJ5MpFxjdDd8IzxxapY7hlhZLx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54a1bc43aacso1001817e0c.3
        for <linux-m68k@vger.kernel.org>; Tue, 16 Sep 2025 03:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017454; x=1758622254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1pUZdanyHlRQIc45clyhD7FxJZAK/SGkllVoia3idE=;
        b=RZKiTz7GKV3xOKa7cT7Wt6ipWcv0UZmbiUb+j7bcHa8KS9BFPvb8XG3uV3akcoffDU
         sl+mVSQQWGGw7ZxezdBukl4VcvxqrjXe1QUVjgZ7IsNS/4mjHooOaJnecC7jlE2pLaFp
         LzO14onqqov3F9FhgFMzTYoTerYu2/Pd+Hf/3zssRUWMzYEWqb/J+qRTqP0fNIX6Fjd4
         9ihdXo/8z5x0pnYrwCtqWy78eRctYV/9m/YCtPnJ0/WVn5rCLUkOs2NnpwOpueYkEqDw
         hAvgWjgoo9Lg/vQVMHM2dn+OWlpuNED5Qm3k5OC9V34Q9cOKOdppgd5F2zR6LVlfLtUy
         k3tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA2cpCThm/Fi2fN8Q9wr0Oqvu+udQn1Yckm2fWjOX9Xc79y17U/ok0L3fUQJO+znzHBtHstXU6IhqC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn7kM7KmEeonGW4JV6fQ0JymnBl++QKivyzAFWYggfSzrJ3gcU
	Wcdv4KtrUs010ZsnFiFGVpJmX0bIpKSjlINm0+ufFLtF/n+k3fn1h3LVEpgLIuh4
X-Gm-Gg: ASbGncvEE4zuMTZl6A1c21DWnlea917WMqvMHOAHMZ5SuBhH2uZwka+7/7Su+YNooZf
	HAP8OlKR/QwmEUgCaHPgKw4MgNTeK9Cwjo8vXAxIH38n6xHQ/5IqJZRiYix2YVWYTl2pm6RE5pH
	QwXgWAkuBvFTVYYLy7Ai34lVQiYweRjJh9ZYHGvC1oXLdRIVwwXkUc4cL+6d/PNdAsSG1CPhziA
	fEMjFOCs8u0hYvQGUUjPE+tXh4FBtQ9EdUfdENeg2/u3Z7qpn6MS2XO0owj7YQ7PkX5bdI0TnSL
	CVdV1cP1QsAZ/OMnvuWuTfTrYtJzHg5yZCkYo/if9y1HLHj55mV2A99lEcuhDaPrsi3UFfSPEJf
	3wBcnjOimWlsyTX5pYn5p7Rg7nfdzVC2pF4Tr3Feefz8vlK8qnX4YIL+EgaTx
X-Google-Smtp-Source: AGHT+IEEOhF5LdUNW2/Tq0aZLlkvHJNOnRqpgH/P0C8U7Ra4wh31OY21qoxMfa3Jr3IhbrxgfMvwBg==
X-Received: by 2002:a05:6122:168a:b0:539:1154:d149 with SMTP id 71dfb90a1353d-54a16c72a6bmr4570587e0c.9.1758017453664;
        Tue, 16 Sep 2025 03:10:53 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a34c12419sm1131913e0c.18.2025.09.16.03.10.53
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 03:10:53 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-89a89313bb7so1681520241.3
        for <linux-m68k@vger.kernel.org>; Tue, 16 Sep 2025 03:10:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUe9h4CON6O2IkcgrsiHOSGzbWNSUEGta5OG2nPm0ghUIFCTchXG7+EvdKXniOHwvpJVExa5+WbHfUS@vger.kernel.org
X-Received: by 2002:a05:6102:418c:b0:523:d987:2170 with SMTP id
 ada2fe7eead31-5560ecac853mr4460438137.21.1758017452861; Tue, 16 Sep 2025
 03:10:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1757810729.git.fthain@linux-m68k.org> <e5a38b0ccf2d37185964a69b6e8657c992966ff7.1757810729.git.fthain@linux-m68k.org>
 <20250915080054.GS3419281@noisy.programming.kicks-ass.net>
 <4b687706-a8f1-5f51-6e64-6eb09ae3eb5b@linux-m68k.org> <20250915100604.GZ3245006@noisy.programming.kicks-ass.net>
 <8247e3bd-13c2-e28c-87d8-5fd1bfed7104@linux-m68k.org> <57bca164-4e63-496d-9074-79fd89feb835@app.fastmail.com>
 <1c9095f5-df5c-2129-df11-877a03a205ab@linux-m68k.org>
In-Reply-To: <1c9095f5-df5c-2129-df11-877a03a205ab@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Sep 2025 12:10:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV92Lu646bJ3cmEoR5C4rfkFsaf0E_uYPbSiLwrTtMbTw@mail.gmail.com>
X-Gm-Features: AS18NWBQnqcmNaklvhAZCp1NFZT2CLc-AZ2UDUvO79JO3zIGXT7yGUxg2731AZo
Message-ID: <CAMuHMdV92Lu646bJ3cmEoR5C4rfkFsaf0E_uYPbSiLwrTtMbTw@mail.gmail.com>
Subject: Re: [RFC v2 3/3] atomic: Add alignment check to instrumented atomic operations
To: Finn Thain <fthain@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-m68k@vger.kernel.org, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

CC Adrian,

On Tue, 16 Sept 2025 at 02:16, Finn Thain <fthain@linux-m68k.org> wrote:
> On Mon, 15 Sep 2025, Arnd Bergmann wrote:
> > On Mon, Sep 15, 2025, at 12:37, Finn Thain wrote:
> > > On Mon, 15 Sep 2025, Peter Zijlstra wrote:
> > >>
> > >> > When you do atomic operations on atomic_t or atomic64_t, (sizeof(long)
> > >> > - 1) probably doesn't make much sense. But atomic operations get used on
> > >> > scalar types (aside from atomic_t and atomic64_t) that don't have natural
> > >> > alignment. Please refer to the other thread about this:
> > >> > https://lore.kernel.org/all/ed1e0896-fd85-5101-e136-e4a5a37ca5ff@linux-m68k.org/
> > >>
> > >> Perhaps set ARCH_SLAB_MINALIGN ?
> > >
> > > That's not going to help much. The 850 byte offset of task_works into
> > > struct task_struct and the 418 byte offset of exit_state in struct
> > > task_struct are already misaligned.
> >
> > Has there been any progress on building m68k kernels with -mint-align?
>
> Not that I know of.
>
> > IIRC there are only a small number of uapi structures that need
> > __packed annotations to maintain the existing syscall ABI.
>
> Packing uapi structures (and adopting -malign-int) sounds easier than the
> alternative, which might be to align certain internal kernel struct
> members, on a case-by-case basis, where doing so could be shown to improve
> performance on some architecture or other (while keeping -mno-align-int).

indeed.

> Well, it's easy to find all the structs that belong to the uapi, but it's
> not easy to find all the internal kernel structs that describe MMIO
> registers. For -malign-int, both kinds of structs are a problem.

For structures under arch/m68k/include/asm/, just create a single
C file that calculates sizeof() of each structure, and compare the
generated code with and without -malign-int.  Any differences should
be investigated, and attributed when needed.

For structures inside m68k-specific drivers, do something similar inside
those drivers ('git grep "struct\s*[a-zA-Z0-9_]*\s*{"' is your friend).

Most Amiga-specific drivers should be fine, as they were used on APUS
(PowerPC) before.  I guess the same is true for some of the Mac-specific
drivers that are shared with PowerPC.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
