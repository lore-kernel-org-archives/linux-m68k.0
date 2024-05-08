Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B78823BF
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 May 2024 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715168811; cv=none; b=kT/N0Ot/ZeXn2drqCRLiDxOr4ilUZ3jkkNRLvF5iAOoy78QMxw+I6zzvKXNHqVfSWm5ToE41TNa8Iab49iGS5XrTNsrVVawchcPyoZoMA5dzLMuQ7eiq7cUte8Tg+RC4Eh6lKmqiRahtD4hnrN9i2zs/Vt782O53q654d5TlJRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715168811; c=relaxed/simple;
	bh=SAlKIWE//lHoA+nc7JO13tI8bPAbZw4MA+BMyr36N8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e3BM6AFP3m8GDdlbVU/miRjlh2YXstflBalEeDFOcdIJcLscljWFOw4HYFsodSq+k4YJ+tmA1BNjPqRgw6iR1yknaypm8MYKutptfugiXVyhSdv5248PfxElug4e9Fa1IiNHPAhkLCqVNqLBVs/cvDUNV6FmAWGWfiJW7oF4X34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-61bed738438so45181647b3.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 May 2024 04:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715168808; x=1715773608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UIM/QXFLV/zOyVSdM/iHxl0eTqhK78DGC/2DFVqdW8=;
        b=QKP0zScRMl1sbYeBSfVPyV0U1CU531xktZ5cFlx9ZgfvUdMdcAibQle5YJiXmv0pVX
         EUkdLda7qes/p5Tw65nXlghCm0968RARF5jBXSMOlaIdL+JSDwPYpptCF8V5ClwdWjtV
         1rYUeXWIMf/EN2p2XIwZCnm8DNxwRWRBi43BYU/xyHVVc4JXMzJwR6obJhtARHY+ntlj
         +k74itgYeewgMLG+U8Gs2WJVqFxwmq6p3SBTiGVy6+PQW8w/UnApLlDEUZx79lYDpGM9
         ip6xE2qMb4rvVrV265bixFLd0FAfr4e3qCnFLl9lPnpg/6w0AXOBrJogej1te2iiAPAM
         cZgw==
X-Forwarded-Encrypted: i=1; AJvYcCXNAIBz2KgI9aM8UoSmE3bWPAQenvf08k1LtOilaWDFdQUTGElrHg1C/fqGGOuVEMroaL2LmwJCVkumSfH3uXtZG+b96IdX6gEiz2TrCmfa
X-Gm-Message-State: AOJu0YzH3N2IlVnggtU4M9QW0K3LEc91wpLzF7Hxyst/T8BIfigYGYMx
	BYbQdvbSCA/C9SswzljTRjitn95R9Fu0F46f7OihSR4+CgosLldhZNSfpge7uQA=
X-Google-Smtp-Source: AGHT+IFwSQoKkDF72YIwKj8hc/WmiytBhojwVXuoLzrh8Z20Qej3E4TYvFA3S1rLGv1cC3GfdNyF5g==
X-Received: by 2002:a0d:f205:0:b0:614:8185:2946 with SMTP id 00721157ae682-620862e3d5emr23176497b3.42.1715168808109;
        Wed, 08 May 2024 04:46:48 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id hi11-20020a05690c610b00b00617c218f6a4sm3133464ywb.107.2024.05.08.04.46.47
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 04:46:47 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6181d032bf9so40838267b3.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 May 2024 04:46:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWK6tnikjx0ZRwBFMrhT7Xl+jiGsu6zuWeaO/H2zvGpstQwTPBrFapbdhT/4r/ik3EPSJR+BqVeuRWKYfaAa6zzRbzwExWGveYNw95HCE9t
X-Received: by 2002:a25:8050:0:b0:de5:53c0:b9e5 with SMTP id
 3f1490d57ef6-debb9d96d92mr2346115276.40.1715168806721; Wed, 08 May 2024
 04:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <480ebd1249d229c6dc1f3f1c6d599b8505483fd8.1714797072.git.fthain@linux-m68k.org>
In-Reply-To: <480ebd1249d229c6dc1f3f1c6d599b8505483fd8.1714797072.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 May 2024 13:46:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUWZcP1E-T7mu7txYODhRK0vmBRXXTs51vuBewZQj_kA@mail.gmail.com>
Message-ID: <CAMuHMdVUWZcP1E-T7mu7txYODhRK0vmBRXXTs51vuBewZQj_kA@mail.gmail.com>
Subject: Re: [PATCH] m68k/mac: Fix reboot hang on Mac IIci
To: Finn Thain <fthain@linux-m68k.org>
Cc: Joshua Thompson <funaho@jurai.org>, Stan Johnson <userm57@yahoo.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2024 at 6:43=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> w=
rote:
> Calling mac_reset() on a Mac IIci does reset the system, but what
> follows is a POST failure that requires a manual reset to resolve.
> Avoid that by using the 68030 asm implementation instead of the C
> implementation.
>
> Apparently the SE/30 has a similar problem as it has used the asm
> implementation since before git. This patch extends that solution to
> other systems with a similar ROM.
>
> After this patch, the only systems still using the C implementation are
> 68040 systems where adb_type is either MAC_ADB_IOP or MAC_ADB_II. This
> implies a 1 MiB Quadra ROM.
>
> This now includes the Quadra 900/950, which previously fell through to
> the "should never get here" catch-all.
>
> Reported-and-tested-by: Stan Johnson <userm57@yahoo.com>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> Tested on Mac IIci & IIfx, Quadra 630 & 650, Daystar Mac II, QEMU.
>
> Some corner cases remain problematic. For example, a stock Mac II or
> a Mac IIci with a 68040 accelerator will still use the C routine, because
> mac_reset() lacks an asm implementation for '020 and '040 systems.

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.10.

> However, amiga_reset(), atari_reset() and mac_reset() do have a lot in
> common, which suggests that a generic asm reset function parameterized by
> final JMP location may be a useful refactoring. This would provide the
> '020 and '040 handling missing here and could potentially replace
> hp300_reset(), dn_dummy_reset() and q40_reset().

Sounds like a good idea!

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
