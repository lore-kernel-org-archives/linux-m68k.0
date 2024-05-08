Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A654A45018
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 May 2024 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715168694; cv=none; b=JzFN6e/N2xFbH3rOJ93X5NkSKamHSX4d5koKgH7YFV93VdtiZ7ZHL/2WYL1nCGLJx4mB4liTKNzOL6CV42PkalOfGx7AeD/BAUK4iPMpjMbVNWU+v8XTY7pC9B9VAs1vJ28GQcIuonr0ewwouLFNsoq8jldxx0b+7zuz7JfzRdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715168694; c=relaxed/simple;
	bh=Tji7GiPNotKO9wzv99gLTkUyJlpMOyW/ti0VSFsUCTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhzzoBuhmmgwBZvRa9J17eiCtXcoEHrWBCrRF/2B8buV0g+j9CHXkH4kok42Ii2DNR3AToF9XfK/UXMRXdhKuFL3T/ygBOCw3vNtudlgLxXjorhu3dgHLfYtWhRI0V9TvF50wJJK7R4PIaxSWbFWfxVjfQfcfjN4kwLAeaFeWJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-61be4b9869dso44299927b3.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 May 2024 04:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715168691; x=1715773491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tD6uk6nyfWQJri7TBNWjTfNOLRhSaC+EWWwCRebNrC0=;
        b=w+NgThTWKcP2oaOe/DoTsvGWstrwwOOGlgbfJUUPhOf5fDAoMVBELRqbc9n4wU/T5k
         6zVqOfEAL2Drs+m+Ou3kczNLf/x+GaJSreyKzIlmQ28G+FD8TRaTxOmpl3r4SIgnn+BX
         QxC/21LBGhYucfcXa2wh/JMYgBBrOWm5pxVT4bikZc2Z5aqSOxHZb6S+GmuogaBKQzTo
         4wUtlHc6UrzP3borduqB5YaaJePIIGgQRumZEAtVCuHu1KqQzfOaaVpua9zOzl44aSJg
         to+2UwAhOzp3wBpV+zOUdoD7Op0UyUjc0QPsk3PF0NUtvR6LexzIXuJ/XCV4kSTn8Fc2
         xJcw==
X-Gm-Message-State: AOJu0YzOjpbemMk2WVga1e/VasBWXKDkooLBVb4xVb83qTNH+6PLBiMN
	lUKaUZ6xlfW0LFBs3bQhkFekegX/IpkCVY06YadaxwMM6IAjCQ8cfV6/DvCQ81A=
X-Google-Smtp-Source: AGHT+IHHLAFBVWTiYdgG/cBra6zWrowrRkVZE9b/wYnxqc9IRWqTlHGTF+fH7V4YBR2jo1RrDGLEEA==
X-Received: by 2002:a0d:d449:0:b0:61b:3346:a79b with SMTP id 00721157ae682-620862e3778mr26347147b3.37.1715168691310;
        Wed, 08 May 2024 04:44:51 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id u76-20020a81844f000000b0061431d20d83sm3254767ywf.39.2024.05.08.04.44.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 04:44:50 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-de5b1e6beceso4913847276.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 May 2024 04:44:50 -0700 (PDT)
X-Received: by 2002:a25:d352:0:b0:de5:5ba3:c324 with SMTP id
 3f1490d57ef6-debb9d2dca6mr2272321276.38.1715168690511; Wed, 08 May 2024
 04:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403122851.38808-1-schnelle@linux.ibm.com> <20240403122851.38808-2-schnelle@linux.ibm.com>
In-Reply-To: <20240403122851.38808-2-schnelle@linux.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 May 2024 13:44:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw86JMgrStxFozDvhCjwynsHgXnPinO4YWXQf_VvWHKA@mail.gmail.com>
Message-ID: <CAMuHMdUw86JMgrStxFozDvhCjwynsHgXnPinO4YWXQf_VvWHKA@mail.gmail.com>
Subject: Re: [PATCH 1/1] m68k: Let GENERIC_IOMAP depend on HAS_IOPORT
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 2:29=E2=80=AFPM Niklas Schnelle <schnelle@linux.ibm.=
com> wrote:
> In a future patch HAS_IOPORT=3Dn will disable inb()/outb() and friends at
> compile time. With that choosing dynamically between I/O port and MMIO
> access via GNERIC_IOMAP will not work. So only select GENERIC_IOMAP when
> HAS_IOPORT is selected.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

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
