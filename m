Received: from mail-vs2-f21.google.com (mail-vs2-f21.google.com [74.125.227.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F6A3F4DE2
	for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517292; cv=none; b=OYlTfkKq9J2J5cSMUic8EJ4ueJ2N4KRH4m9bQSUBIBbLzTzZCqB5JrkVL4/vM/ivwHQjN8IlRx2iY7B2BIJ5f3vM42NNcapGzVa3Y0n9oKG48T8hVZh81NoXHRG7Fa2Dylz19NV6Rgl7KDOhEc+dPFCeAS1xfkOm6YFnZwecaSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517292; c=relaxed/simple;
	bh=aJ/3u2TDk1FwrMLTOiGsBvCmKGy0HVamF0zMgDHiRbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=loF4WzdahTtNz+aWbEz710x20u7cANmAGr7aFpeWLpXNFoyeqg681d7IrEt9J9gaf83mrKAxIWheEY6I1uGXB+YA2a0RaP3TgngPVx2KwyZBT39/T0pdub8O822t0QLyCe9+bAkFIh+wVJQZ8Vtr8IhAWhaYnvE6cdzZvqGopJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f21.google.com with SMTP id 71dfb90a1353d-5c83397eeeeso1605992e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 06:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790517287; x=1791122087;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L2OFp95iHCfRROl31Y+sf6zuVagn/RbGEuuvvri1wN8=;
        b=TtmbbqYO79u4v3oWSyWra1N2P0MrXrI+CtZBs7Ns2wVJFP02CJDj5RSVy+UAjhK/oG
         2XU8hLKumql8x17tbReNA1efSLzjbfV9ZxzOZoB6W06BCd8hXZd8y5TiBki5AgkW31Ja
         rJ8mvP+4Av1l9PMNps69dtpQXoNtz8DB/ykPJ+clzVUQOcGBgKyfxiOOonqaZWINIrQg
         mIUB+P1/J1I4FHmjZ3q03qefgl5pJMY2arjxWabicsT8dzC+e1ToRKB77aCiObM2e+nu
         r1iXgy2rB46M3YWbd5JcyR79z2ReZYa9SliU4Fs85dhG+oyDGpd3CJNkwgc1oSgsa8hm
         koHQ==
X-Gm-Message-State: AFq9FYIrIZUmWZVqMhywBz6qMo6Kvt7GeMhVorVuI8NlKLbxqppfkLIx
	EWYh3/hAkX08VYVFE1yChibyKcIKtv8R2uLzQjY89zRIV0PyvQHqE0l8roFOytkF
X-Gm-Gg: AYBFou06Pe0BYpzsPWPcitV3XVUjpoj9DcgKdWdCg7WXXvQ5KKTHuMKRl4/nWBNXsNK
	Oio27OZ2X0xbRjUcVuQRmQRox9Ll99Fjm6SWXIBUFy8cZiKUBd3FKVt5d7mPv4f4G/9wbzksESH
	I+8KT5ugUq3nMMI585xpBNrap6aVXUuSBWs7JUjsI30ri5MiX94BUN1/yIq/BBHC2sNjzRPRr96
	JbypsL3H4dSOyCZ7JaFmPV5ytXocKgHz5KmzXnu3uV1wAfGx7BL0yD19RkuzaJi0MnfCHEduPFY
	Nz2Ng5Rc+4dgarnfWyWzykaovKChKA9RF0SGtKbItVgxlzIzfBHnmcD+9SfyoXjsB24ncJP01HT
	bg+dwLP/+Y3Tut7c/gLoclFKuPvA/kGIIk6UXds8miBEwdTjo0AquwXEdJiQENWgE1KGh+TA8LX
	8kgFsdWm8UuF/YAPS4X8IjtApt5RUUib9WOjqY3p7c+OnwaoXZIrbI9YyHHy2YGx1ve7FVrerIV
	rH3RrZ1sQLBjQJgkprQF81/IPIwXFN7CiCk
X-Received: by 2002:a05:6102:162b:b0:7a4:fb71:25d1 with SMTP id ada2fe7eead31-7af1b96d484mr4602995137.7.1790517286947;
        Sun, 27 Sep 2026 06:54:46 -0700 (PDT)
Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com. [74.125.227.38])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b227ac2sm2767530241.13.2026.09.27.06.54.45
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 06:54:45 -0700 (PDT)
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b388ead5b1so419586137.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 06:54:45 -0700 (PDT)
X-Received: by 2002:a67:e703:0:b0:7a1:f7c3:3a42 with SMTP id
 ada2fe7eead31-7af1c17fd4amr4317636137.15.1790517284989; Sun, 27 Sep 2026
 06:54:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828094940.3882602-1-daniel@0x0f.com>
In-Reply-To: <20260828094940.3882602-1-daniel@0x0f.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 15:54:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXL34_aMC5pnTyX8BpiTrRNptNbqUkLj3VEX8UFaXp0jg@mail.gmail.com>
X-Gm-Features: AclHuK-W_2pkk78COKUsEJzd_bQ8Exi416vXDhPKEtXTioHarx1YejHcEFLpsas
Message-ID: <CAMuHMdXL34_aMC5pnTyX8BpiTrRNptNbqUkLj3VEX8UFaXp0jg@mail.gmail.com>
Subject: Re: [PATCH] m68k: apollo: Fix interrupt setup
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Fri, 28 Aug 2026 at 11:49, Daniel Palmer <daniel@0x0f.com> wrote:
> The user interrupt vector needs to be installed before the interrupts
> are unmasked otherwise the timer tick isn't handled and boot up gets
> stuck in calibrate_delay().
>
> Assisted-by: Claude:claude-fable-5 # Wrote Apollo DN3000 emulator using QEMU
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Thanks for your patch!

Fixes: 0aa78106c661cf6c ("[PATCH] m68k: convert apollo irq code")

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.4.

> Backstory: I have Claude creating a version of QEMU that can emulate
> every supported m68k machine. Its still working on getting Domain/OS
> booting but it found that Linux locked up on boot and I used gdb to
> find the cause.

IIRC, you need several of them. A single DN machine feels lonely,
and requires caretaking by the domain controller ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
