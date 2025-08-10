Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7543A1C8621
	for <linux-m68k@lists.linux-m68k.org>; Sun, 10 Aug 2025 09:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754816909; cv=none; b=Lt7tlWU4HL4srtScuSaPX0rjbriyabSiH8sBHo7ClhJeMOsp9IhVj40H3lVKodzynJjUFfX1Cazlmgg/pjJhUlFJZhGE4f/fqEIOv04ELSknriBFpNDC1d2IefPu7x+osRBW5USD4yb+z6NGbAL2RLJoCUpKM/JTpIlLkm5E2us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754816909; c=relaxed/simple;
	bh=NqrJcDK9Q9Pbwnv9mkT1gvpoDiy/onKZKuiEiMl6Esw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nc2OuMhgaCOjyRLzG0i8XQAeLhSoGyv9yMEL6zNNenrzn/HHskDcundNh5YQPGj01DKKwgaVY14d0NdnLymYi3OFeguFgjE5jvhH7N66E8n3tWgkjNFjUIEU3G6gppWpt4TlzSllJqs+3nEFOiw/PwMO+ap6jx/FAXs5GunOVs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=YLR9ClsC; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="YLR9ClsC"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b3f80661991so3186751a12.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 10 Aug 2025 02:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1754816906; x=1755421706; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XefKmLNL7nnqmo+5yH2hBjHjtzORSbfHYnDOv5fvrSs=;
        b=YLR9ClsCzmon6kFYP6Qf2+PmhrfIGCJQXLhzbmq7nZOcFnuGozanSK1lHOYs1aMvD2
         RpkiUqya6UhSVFPyfWqiTIFGmWnf99MXCwelxKM2Bp1MA6+qUqFIr30CBlQrY9UPXaEp
         xEu2Jcv9P2n4IW5lGeb3ccGy6bLUBg5Gh3Pfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754816906; x=1755421706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XefKmLNL7nnqmo+5yH2hBjHjtzORSbfHYnDOv5fvrSs=;
        b=jHo94qZkoVgGQE9lc4AZ43bRmymUjyb7VSL+R1fnqbDlpjuApozCZ/Th3O/oO1XwAR
         lrVXceLrzmbII7YK01N/aRioIadBtYqboHsgW8MXh0PdT8gK+OT4X8Z+pSi8yfX/xZMh
         4hfezrnMlfT4M//kDRclbLPI1abRrgmMmazzG8Q3a4uuXoIWpt67brW4WqSz0N4E4j/5
         hGNisrcycO4LuOvMrbp388ydFRp5d2AcQAcW8eMWadEvbFZgqGxuVdt1ByFCmPbGzoK/
         Qt6uOdkT5QN9FL8SEqM8fVqsNdM5D9sL5GnsCJO728GEmIH4mFlTTzRvuYlR/zoEB4xV
         cEAA==
X-Forwarded-Encrypted: i=1; AJvYcCUqZArkPBJxiQVNgv5Y1/LaLWgj4Y5GPZatdy85LRBk2aaYmzMV1zeyFTMfoovvitgd8DQmqFCM0Z8K@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzmoEUIkBkWFnxj8TstAAiYHpNLUxHmUG+HXT47G8lrXidRo7kc
	27CDLJt/9ybYjgHMY04kFTwjdMsrOr+thudNBxwPIXPgf1jkfwMjdAJucFYPEA3u24TWW3AACp+
	iPB9hO9sX0i+CPr+5HfFYToYOddU4jfqRzsdfyXdgRw==
X-Gm-Gg: ASbGncuAtzQkivwiTvjPfSvcpvfvgGVvIHciJrvjNnb1JOhVcXuA1hKQYKGZUMIR8st
	sWsShjAk6pQQqkRGGS8Ei3HLt6Oa2yrS33i0lO9I0l4vOKvr/Ses+0NM8PMOqPmFghtOqC8icaG
	gjgmmVk6iWf5SGvCBjm42TUWfMjNpqbE1cJW0E3wpCBkl8jjXLi5SXDoceNUeTRBaWGWsUoJqqC
	OnZcIg=
X-Google-Smtp-Source: AGHT+IGgxGY8TIGss+p+m+rvdoCroOkrH0WSwlEH1yu+EbvcphNklaPzY6Wumaxx6GRiOOtAmCnqSI1I1Q1UxJRHVLE=
X-Received: by 2002:a17:90a:ec8e:b0:321:9462:49b7 with SMTP id
 98e67ed59e1d1-32194624af4mr7997024a91.12.1754816906402; Sun, 10 Aug 2025
 02:08:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250809015529.373693-1-daniel@0x0f.com> <5dd0a031-dd7b-4078-b1a8-6b760248390b@t-8ch.de>
 <CAFr9PXmF-AOL8yj9FntHw+b1A8HWKNeAHU=rx7Dk7pfi1N_4fA@mail.gmail.com> <d7974cbe-41b3-4994-8982-30c8f660e65f@t-8ch.de>
In-Reply-To: <d7974cbe-41b3-4994-8982-30c8f660e65f@t-8ch.de>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sun, 10 Aug 2025 18:08:15 +0900
X-Gm-Features: Ac12FXzKlx-ot3OecZiA6JO8-sqa2rTE3ab_yidKsy8cX4VcNGeRieYae9c2z9w
Message-ID: <CAFr9PXkJCPm9UwV8-FeZxhB+ODxGgtbKdD3n90UjqyPGF8tMSw@mail.gmail.com>
Subject: Re: [PATCH] m68k: Add target for lz4 compressed vmlinux
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Sat, 9 Aug 2025 at 21:29, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> w=
rote:
>
> Hi Daniel,
>
> On 2025-08-09 20:35:39+0900, Daniel Palmer wrote:
> > On Sat, 9 Aug 2025 at 16:50, Thomas Wei=C3=9Fschuh <linux@weissschuh.ne=
t> wrote:
> I would continue with vmlinux.tmp. It might not actually be stripped.
>
> quiet_cmd_precompress =3D PRECOMPRESS $@
> ifndef CONFIG_KGDB
>       cmd_precompress =3D cp $< $@
> else
>       cmd_precompress =3D $(STRIP) $< -o $@
> endif
>
> vmlinux.tmp: vmlinux FORCE
>         $(call if_changed,precompress)
>
> targets +=3D vmlinux.tmp
>
> This will also correctly handle CONFIG_KGDB changing.
>
> (Maybe the naming can be improved)

Nice, that's a lot better and I've reworked my patch to do that.

> And for the compressor invocations we already have predefined commands:
>
> vmlinux.gz: vmlinux.tmp FORCE
>         $(call if_changed,gzip)

I also did this for all of the targets and $(call if_changed,lz4)
results in an lz4 file with the old header format[0] and 8MB block
size which is not what I need.
So v2 will have a patch to add a helper to generate that style of lz4
in scripts/Makefile.lib

Thanks!,

Daniel

0 - https://github.com/lz4/lz4/blob/dev/doc/lz4_Frame_format.md#legacy-fram=
e
