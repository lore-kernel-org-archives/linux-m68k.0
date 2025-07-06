Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B01B1EA7D2
	for <linux-m68k@lists.linux-m68k.org>; Sun,  6 Jul 2025 09:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751792906; cv=none; b=RJiGCj1jQjxBWVAPowTuKVklkXcy469q3yL0p+3sCu2d0ReX9fgtbPOrG7QhjrlMXrGXW/TYmk7/pFW3vHQAQPXh3So8a+wzjck8ggksv120VUgO1Kz5ucvZDsuoQelhnubf26BIUohuwCAZIsa5wu8FHJ39d55LTY6qXqz0+kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751792906; c=relaxed/simple;
	bh=YeSqhPGOCSEzC/m1idgMdrl239XEwVQUOkljmT/rhbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hp5ipxLSgiRXKrwfmyY6hzAuLih1Vb3t0q2S65c7yGYWIPcwYsFgJJYP2HQgfRO/pcHiT52+hHnbkEz0Hj0m2Bugn/mKdCb40HlrdnFTQcayuTzo2HH4h6OWLRfxw59b/ZVUAwUAdezuR178uOTInvNeJLufikpbthxjNy6WycY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-532de49b7e2so702034e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 02:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751792903; x=1752397703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKNWfzLihse4/vZiPvnOVJrcOayLdn1DUR/G7sfcSvI=;
        b=mS/jXJBa/nl/u5ASajKLYohBd9CU/ybMlMFczNfD9XysNyeyr/2BQ6cbnTc283iZIu
         /cRHRhGd4b/uXV+urafTAKN+AHhTLJFdU7e1Sx64djNMUuVjwOKty33GF1WNfzIg1di2
         01dx3a/DWUE9JfKbXp9Zf4pF0PZZOFuFPtgHTIOpQBpNwndsltWNwUZWu/GM40LlcRrJ
         u+GLFstKbRvw9pJl96HDYjMvnSHmHKYDTRMKN5PAveY7ou6ya5O9dNodt+dwdElXisnD
         uTf22vGORXVYWEbO74y90hvRmI95gE3+kCGiKXI7j+9jU5D2JD+6ynqz8Cy0g3AE3J9E
         RsBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWOaai0vWIoemY6zau+HFq3IQQF06jlVtnG+LE+npEDe1P9fKBVxUOV/2yHU+V8C2PvWx//0UvbX5W@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwLJZ6YKaEXxgu4UcfrNEdzKGOcdAB6iY5lNuXhEBSs4mNxSrYv
	NKCedLki1B58n0M3vnE+b6RCV4D2oP6sqoYhPCeGYFmB3qf8+JHHFUqIU8Z8nJBX
X-Gm-Gg: ASbGncvF73Qfr4lvNRw0PNy6K2wRiOYkH6iKkumBKB0Xbp6FjKCy7x2774bJGz+m+Qy
	PpiUD1qZNlroadaxohaOWnymb9KAjr+9XNS7/N+QJ9gu+zTaNgF8vQVC9aM83DUbGvvnnMy8Ygo
	94UDJzaCL8C+5eDF+7sdoCmZBgHzimZpfu3JjAifmYdduah7cyueDEBUnbJwq9h925WTKuE+Apy
	w2F7H0cVLb5poO7ZjeYYcFo4aVukAP4fIvINlxLcmWR2xaw5SJ2oLgf0T59myTBQmGtyeD5+s+D
	mahU19xsI5FV90owofZ1JrQSTkCdNBQpy5YdmFe4S8M7CnCrJebiUrrsFd0wF8PZsAO7JqdmDub
	CPYOIe932kpPE36OQqCDu3PXdJbypLYoVaAs=
X-Google-Smtp-Source: AGHT+IG4GgTRFSUBv+P6+QK9yESRE7UxHjUgcasux4Uq+EnaKdquTzrAovk6styIP3N0A7HAUQl6fw==
X-Received: by 2002:a05:6102:1609:b0:4da:fc9d:f0c with SMTP id ada2fe7eead31-4f2ee1d3d77mr5599398137.12.1751792903172;
        Sun, 06 Jul 2025 02:08:23 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-886e922f9d6sm976756241.3.2025.07.06.02.08.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 02:08:22 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-884f2b3bc2eso300114241.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 02:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiySlg2yL9PvV8E8+7+9dsAA59ozhMZ9oTxHxprJfkqe0keugWbbZopdjNNFa0vK9LcBwOt0eTWerc@lists.linux-m68k.org
X-Received: by 2002:a05:6102:5489:b0:4eb:e04c:f5ed with SMTP id
 ada2fe7eead31-4f2edff096emr5969957137.2.1751792902713; Sun, 06 Jul 2025
 02:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f7b4c02a1c8ed74ccceb5535d7e1e202deada8ce.1750739568.git.fthain@linux-m68k.org>
In-Reply-To: <f7b4c02a1c8ed74ccceb5535d7e1e202deada8ce.1750739568.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 11:08:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmxV03tza_4M3+YJg9TT6yJKuvmNh9=JvdM7r-r-kR7A@mail.gmail.com>
X-Gm-Features: Ac12FXxXbSZrezpm03lRHY3251vjUFPmaJuue3zNaD3M3TNEGWEHUr-PZeSeB6A
Message-ID: <CAMuHMdXmxV03tza_4M3+YJg9TT6yJKuvmNh9=JvdM7r-r-kR7A@mail.gmail.com>
Subject: Re: [PATCH v2] m68k/mac: Improve clocksource driver commentary
To: Finn Thain <fthain@linux-m68k.org>
Cc: Joshua Thompson <funaho@jurai.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 06:36, Finn Thain <fthain@linux-m68k.org> wrote:
> qemu-system-m68k -M q800 has an old bug that causes the kernel to
> occasionally complain about a soft lockup:
>
>     watchdog: BUG: soft lockup - CPU#0 stuck for 5107s!
>
> There isn't any actual lockup. The via1 clocksource produced a large
> jump in jiffies, causing the watchdog to detect a stale timestamp.
>
> The 32-bit clocksource counter runs at 783360 Hz and its period is
> about 5482 seconds. Applying the "nanosecond" approximation used in
> get_timestamp() in kernel/watchdog.c then yields the duration reported
> in the log message above (always 5107 or 5108 in my tests):
>
> 0xffffffff / VIA_CLOCK_FREQ * 10**9 / 2**30 = 5106.209 seconds
>
> It is notoriously difficult to correctly emulate a MOS6522 VIA chip. So
> it seems wise to document the VIA clocksource driver better, especially
> those hardware behaviours which the kernel relies upon.
>
> Cc: Joshua Thompson <funaho@jurai.org>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> Changed since v1:
>  - The letters A through E could be mistaken for hex digits so number the
>    states using roman numerals instead.

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
