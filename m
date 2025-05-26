Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBDAF9E8
	for <linux-m68k@vger.kernel.org>; Mon, 26 May 2025 18:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748285359; cv=none; b=IATJnravJVaL3VEzams8godgOk0cVYVNhnDfjSZ0urwa6j1sHU2lBfWXG+GuvFEhEqQEwxS4zdszS0wgUaJ5HOsNk/j+Rg5LfhMCP3wk9Z/0P+D+HAt3JUHRQTyQR+FWYxjNrCDvQPy8unPO6nSALOUJ5LRTydMIAUW/Cz/H/yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748285359; c=relaxed/simple;
	bh=W6woZj3zpZZ/NpROcizRirvtqvqOuT+F5DQmM/nX7ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGsdhEJqvg11UQvLQ1WBdKxZkM3PPAACv+8qY9qqkseLFesoNo69CbMNIpaqDDlNm5IM+nXqAV8iqoAIO9o73WNzapzSzmnk2uyYYsx+WGz3DEy3T4OeKKeA6kMLivttVSUtYz6qeo+F+RGLBbSsipkeYzUIZdFsEcaQ3mPDlHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgjWx38S; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgjWx38S"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so2937672e87.0
        for <linux-m68k@vger.kernel.org>; Mon, 26 May 2025 11:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748285354; x=1748890154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xKQQZ40MDKPSK/f86/aTfJXDJ4VkASyIAY23NlJ8lls=;
        b=CgjWx38S+rAHx+KohHDXCYMUDHMf6EHrGelBfY1xs69xkN7QSymZ/57Fpe6hQUAASq
         JpPx4BsH/Vcn2dhL/EBgC/Pr6IFtlPRmXWZ26A+plTJsJCl7Sw9xSJtCqS0gJYr2unx/
         tGUMOqHLg85ZMf/MCRLQeCAz7wMYKkh6a7GJ81xcKSpp05TJ9UzsccOw3AiMIhw0FtAQ
         ntU+laaxXprKBC2uH36rx/v9IgX6GbwcXHdklWhl4fkRNuj/XdVL7CMt7kTy9es6hFUy
         k5CEBfNKUdepaXJF4JOWL/LgnC6DjjqsGjP6ROFyahGJ5WaPytNmphPpq1jFAaVDgrFp
         wN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748285354; x=1748890154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xKQQZ40MDKPSK/f86/aTfJXDJ4VkASyIAY23NlJ8lls=;
        b=fxrmRr5YQB/zC1Vn2AeWTt9lKtM7Qi/nzo9JCN4tXmfcP9ht1x1wQxs5vLxy3XdQ1R
         Xml5oZi4DDZvdRbY8sBShCBrmpo1HKEkMHgPhffJfObb2G68iygcpf4rccjX68SLkfgw
         xnABaDbqTUAyVQzJmoHSc98HKu6l7GjoyVDid4wpbacnM0DOMKamviqwcAJWtSXjZJgT
         S35s0u6J5tPxOUMmvFOz1fgvocpBuqHevHKX7DhG+XfhEWdxJX5FNJKdnPcv5XYwlFJs
         WgqknEBPF6ui5Pyw89pU+k3mCC4GTff4kn1w1G6tU5iibARygk/+1t86SRp05vBX6NYs
         k9Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUVJEX0JYwMaJUWuK2Ird98J19Jb0GvTbC6g4LHHGiYiIsJp7eNj+tNyIqECC8QujWBGu588bC+re0L@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7OLjrKIvvigMeenzirZzDrcjYJPtojaS56YDRDCGBmL0EVpb7
	j3icoFPOHQBZxEIoCrnz9o2Cvuv1qvd6VNyOXk+D0F1+D9v/u+jFSvn6dE6Ts9LUwagl//vKCSm
	F91NQPhG8855MzdX/jSx4hihdYNBpfI8=
X-Gm-Gg: ASbGncuGlkg7yPbOJ5ujV2EPK7mU+CHWlDSrB2nZfU2YMwzc8G9EtfU6KQCYMSuJmcK
	aQIH1OeXQuUAqvgBNtyON/BFccyzgyjK6Qx4uiuaIzAN8Ixld0y8AqgyIBJ0v34nYO+nzGicSnQ
	H2CJkqWBtRw52mSElV8EShwT9UtoluR/A=
X-Google-Smtp-Source: AGHT+IEokjisy47mtg9Et8ixdHkIXYMxQD1pDudndPGchPC/fZMl3SdBX1S/SXWAF8nYqEYKdStL7AnDsR1yUfR2xCU=
X-Received: by 2002:a05:6512:3c8d:b0:549:5850:f275 with SMTP id
 2adb3069b0e04-5521cbaed91mr3042450e87.50.1748285353721; Mon, 26 May 2025
 11:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <CAH8yC8=bbDMNFLj=eQzW+ZHvJpH0ZdVQthfscTo1fe0w=wnU_g@mail.gmail.com> <e22c54a868bb70825aa3f91084742fded97470d6.camel@physik.fu-berlin.de>
In-Reply-To: <e22c54a868bb70825aa3f91084742fded97470d6.camel@physik.fu-berlin.de>
Reply-To: noloader@gmail.com
From: Jeffrey Walton <noloader@gmail.com>
Date: Mon, 26 May 2025 14:48:36 -0400
X-Gm-Features: AX0GCFvmnvi5oSdMSNooWIfR9CtNEuI7DcHM1E4PuVz6UI6wxukB3OuqjYEsBMs
Message-ID: <CAH8yC8=iVc46vN-aq671r7utpwJjWERRDS3FKEkurFfe7cWiBQ@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
	linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 2:23=E2=80=AFPM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> On Mon, 2025-05-26 at 14:16 -0400, Jeffrey Walton wrote:
> > I don't know about the 64 byte alignment on NetBSD. Maybe it was
> > copied/pasted/modified from amd64? amd64 has a BIGGEST_ALIGNMENT of 64
> > due to AVX512. Prior to that, I believe amd64 had a BIGGEST_ALIGNMENT
> > of 32 due to AVX. (These were due to the aligned loads, like
> > _mm256_load_epi32 (32-byte requirement) or _mm512_load_epi32 (64-byte
> > requirement)).
> >
> > For PowerPC with Altivec, I believe BIGGEST_ALIGNMENT should be 16.
> >
> > I don't know if __ALTIVEC__ plays a part in BIGGEST_ALIGNMENT. That
> > is, should BIGGEST_ALIGNMENT be 4 (for int) or 8 (for doubles) unless
> > __ALTIVEC__ is defined; and if __ALTIVEC__ is defined, then
> > BIGGEST_ALIGNMENT should be 16.
>
> The alignment is specified in bits here, not bytes. Hence a BIGGEST_ALIGN=
MENT
> of 64 means 8 bytes, not 64 bytes.

Derp...

Maybe the 64-bits/8-bytes is coming from limitations in the linker.
See the discussion of __BIGGEST_ALIGNMENT__ at
<https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html>:

    On some systems, the linker is only able to arrange for variables to
    be aligned up to a certain maximum alignment. (For some linkers, the
    maximum supported alignment may be very very small.) If your linker
    is only able to align variables up to a maximum of 8-byte alignment,
    then specifying aligned(16) in an __attribute__ still only provides
    you with 8-byte alignment.

Jeff
